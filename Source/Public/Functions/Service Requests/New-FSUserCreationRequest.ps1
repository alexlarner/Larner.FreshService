function New-FSUserCreationRequest {
	[CmdletBinding(
		SupportsShouldProcess,
		ConfirmImpact = 'Low'
	)]
	param (
		[Parameter(
			Mandatory,
			ValueFromPipelineByPropertyName
		)]
		[string]$FirstName,

		[Parameter(
			Mandatory,
			ValueFromPipelineByPropertyName
		)]
		[string]$LastName,

		[Parameter(
			Mandatory,
			ValueFromPipelineByPropertyName
		)]
		[string]$EmployeeID,

		[string]$OUCanonicalName = 'COMPANYNAME.com/Testing AQ/Users',

		[Parameter(Mandatory)]
		[ValidatePattern('^[A-Z0-9+_.-]+@[A-Z0-9.-]+$')]
		[string]$ManagerEmail,

		[ValidatePattern('^[A-Z0-9+_.-]+@[A-Z0-9.-]+$')]
		[string]$RequestedForEmail,

		[string[]]$TaskTitles = @(
			'Create AD Account & Mailbox',
			'Set Employee ID',
			'Add AD user to Domain Guests',
			'Set AD user''s primary group to Domain Guests',
			'Remove AD user from Domain Users',
			'Add user to M365 License AD Group',
			'Email new user''s credentials to their manager'
		),

		[switch]$IncludePasswordResetTask,

		[switch]$EnableException,

		[switch]$PassThru
	)

	begin {
		$ServiceItemDisplayID = 93
		$HelpdeskAutomationAgentID = '18013003172'
		$TerminationTicketsAgentGroupID = '18000295199'

		if ($IncludePasswordResetTask) { $TaskTitles += 'Reset user''s AD password and send it to their manager via encrypted email' }
	}
	process {
		Write-PSFMessage -Level SomewhatVerbose -Message 'Setting custom field values for the service request'
		$CustomFields = @{
			first_name                               = $FirstName
			last_name                                = $LastName
			employee_id                              = $EmployeeID
			active_directory_organization_unit_ad_ou = $OUCanonicalName
		}

		$NewSRSplat = @{
			Email           = $ManagerEmail
			DisplayID       = $ServiceItemDisplayID
			Category        = 'Account/Access'
			Quantity        = 1
			CustomFields    = $CustomFields
			PassThru        = $true
			EnableException = $true
		}

		#This needs to be ordered so that the PSFValidateSet will see the Category value before it validates the SubCategory value
		$UpdateTicketSplat = @{
			SubCategory = 'New/Change Employee'
			GroupID     = $TerminationTicketsAgentGroupID
			Responder = $HelpdeskAutomationAgentID
			Tags        = 'New User Creation'
		}

		if ($RequestedForEmail) { $NewSRSplat.RequestedFor = $RequestedForEmail }

		Invoke-PSFProtectedCommand -Action "Create new user creation request" -Target "$FirstName $LastName ($EmployeeID)" -ScriptBlock {
			$NewSR = New-FSServiceRequest @NewSRSplat
			Update-FSTicket -ID $NewSR.ID @UpdateTicketSplat
			#Nesting the ticket creation in here might work to have it only fire if the request is created
		} -Continue

		Invoke-PSFProtectedCommand -Action "Create new user creation request tasks" -Target "$FirstName $LastName ($EmployeeID)" -ScriptBlock {
			New-FSTicketTask -ID $NewSR.ID -Title $TaskTitles -Group 'Global IT Infrastructure Group'
		}

		if ($PassThru) { Write-Output $NewSR }
	}
}

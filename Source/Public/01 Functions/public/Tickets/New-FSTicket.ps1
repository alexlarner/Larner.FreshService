function New-FSTicket {
	<#
		.EXTERNALHELP
			https://api.freshservice.com/#create_ticket
	#>
	[CmdletBinding()]
	param(
		#Name of the requester
		[Parameter(Mandatory,
			ParameterSetName = 'PhoneAndName')]
		[string]$Name,

		#User ID of the requester. For existing contacts, the requester_id can be passed instead of the requester's email.
		[Parameter(Mandatory,
			ParameterSetName = 'ID')]
		[long]$RequesterID,

		#Email address of the requester. If no contact exists with this email address in Freshservice, it will be added as a new contact.
		[Parameter(Mandatory,
			ParameterSetName = 'Email')]
		[Parameter(Mandatory,
			ParameterSetName = 'PhoneAndEmail')]
		[ValidatePattern('^[A-Z0-9+_.-]+@[A-Z0-9.-]+$')]
		[string]$Email,

		#Phone number of the requester. If no contact exists with this phone number in Freshservice, it will be added as a new contact. If the phone number is set and the email address is not, then the name attribute is mandatory.
		[Parameter(Mandatory,
			ParameterSetName = 'PhoneAndEmail')]
		[Parameter(Mandatory,
			ParameterSetName = 'PhoneAndName')]
		[ValidatePattern('^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')]
		[string]$Phone,

		#Subject of the ticket. The default value is null. The API documentation is incorrect, this is in fact a mandatory field, per the API error response when one is not specified, or when the specified one is a blank string.
		[Parameter(Mandatory)]
		[string]$Subject,

		#Status of the ticket.
		[PsfValidateSet(TabCompletion = 'FreshService.TicketStatuses')]
		[string]$Status = 'Open',

		#Priority of the ticket.
		[PsfValidateSet(TabCompletion = 'FreshService.PriorityNames')]
		[string]$Priority = 'Low',

		#HTML content of the ticket. The API documentation is incorrect, this is in fact a mandatory field, per the API error response when one is not specified, or when the specified one is a blank string.
		[Parameter(Mandatory)]
		[string]$Description,

		#ID of the agent to whom the ticket has been assigned
		[long]$ResponderID,

		#Ticket attachments. The total size of these attachments cannot exceed 15MB. This currently gives a HTTP 400 error with a "It should contain elements of type valid file format only","code":"datatype_mismatch"
		[ValidateScript({ ($_ | Measure-Object -Sum Length).Sum -le 15MB })]
		[System.IO.FileInfo[]]$Attachments,

		#Email address added in the 'cc' field of the incoming ticket email.
		[ValidatePattern('^[A-Z0-9+_.-]+@[A-Z0-9.-]+$')]
		[string[]]$CcEmails,

		#Key value pairs containing the names and values of custom fields.
		[hashtable]$CustomFields,

		#Timestamp that denotes when the ticket is due to be resolved.
		[datetime]$DueBy,

		#ID of email config which is used for this ticket. (i.e., support@yourcompany.com/sales@yourcompany.com)
		[long]$EmailConfigID,

		#Timestamp that denotes when the first response is due
		[datetime]$FrDueBy,

		<#
		ID of the group to which the ticket has been assigned.
		The default value is the ID of the group that is associated with the given email_config_id.

		This is mandatory due to CompanyName policy, not manufacturer's policy.
		#>		
		[Parameter(Mandatory)]
		[long]$GroupId,

		#The channel through which the ticket was created. The default value is 2.
		[PsfValidateSet(TabCompletion = 'FreshService.SourceNames')]
		[string]$Source,

		#Tags that have been associated with the ticket
		[string[]]$Tags,

		#Department ID of the requester. Not needed if DepartmentName is used.
		[long]$DepartmentID,

		#Department name of the requester. Not needed if DepartmentID is used.
		[PsfValidateSet(TabCompletion = 'FreshService.DepartmentNames')]
		[string]$DepartmentName,

		#Ticket category. The API documentation is incorrect, this is in fact a mandatory field, per the API "Validation Failed" response when one is not specified.
		[Parameter(Mandatory)]
		[PsfValidateSet(TabCompletion = 'FreshService.CategoryNames')]
		[string]$Category,

		#Ticket sub category
		[PsfValidateSet(TabCompletion = 'FreshService.SubcategoryNames')]
		[string]$SubCategory,

		#Ticket item category
		[string]$ItemCategory,

		#List of assets associated with the ticket
		[hashtable]$Assets,

		#Ticket urgency
		[PsfValidateSet(TabCompletion = 'FreshService.UrgencyNames')]
		[string]$Urgency,

		#Ticket impact
		[PsfValidateSet(TabCompletion = 'FreshService.ImpactNames')]
		[string]$Impact,

		#Problem that need to be associated with ticket (problem display id)
		[hashtable]$Problem,

		#Change causing the ticket that needs to be associated with ticket (change display id)
		[hashtable]$ChangeInitiatingTicket,

		#Change needed for the ticket to be fixed that needs to be associated with ticket (change display id)
		[hashtable]$ChangeInitiatedByTicket,

		[switch]$EnableException
	)

	#This is because $PSBoundParameters does not include default values. FYI, this section does not work with dynamic parameters.
	Write-PSFMessage -Level Debug -Message "Adding default parameters to PSBoundParameters"
	$UnspecifiedParams = $MyInvocation.MyCommand.Parameters.Keys | Where-Object { $_ -notin $PSBoundParameters.Keys }
	foreach ($Key in $UnspecifiedParams) {
		$Value = Get-Variable $Key -ValueOnly -ErrorAction SilentlyContinue
		if (
			$null -ne $Value -and
			$Value -ne '' -and
			$Value -ne 0 #Not allowing zero might cause issues in the future
		) { $PSBoundParameters.$Key = $Value }
	}

	if ($DepartmentName) {
		#This is because removing entries from PSBoundParameters returns a bool
		$PSBoundParameters.Remove('DepartmentName') | Out-Null
		$PSBoundParameters.DepartmentID = (Get-FSDepartment -Name $DepartmentName).ID
	}

	foreach ($ToTranslate in 'Status', 'Priority', 'Source', 'Urgency', 'Impact') {
		if ($PSBoundParameters.ContainsKey($ToTranslate)) {
			$PSBoundParameters[$ToTranslate] = Get-FSTicketFieldChoiceID -Field $ToTranslate -Choice $PSBoundParameters[$ToTranslate]
		}
	}

	$Splat = @{
		URISuffix = '/tickets'
		Body = ConvertTo-FSNames -FrontEndParams $PSBoundParameters -ExcludePair @{ Source = 2 } -PreserveStringValue *
		Method      = 'Post'
	}

	#I haven't quite decided if this is better than the commented bit below. The commented bit is a bit better because it contains a continue, that would remove the necessity of the $Result below
	if ($PSCmdlet.ShouldProcess('', "Creating ticket for $Subject")) {
		$Result = Invoke-FSAPI @Splat
	}

	#Write-PSFMessage "Creating ticket for $Subject"
	#Invoke-PSFProtectedCommand -Action "Creating ticket for $Subject" -ScriptBlock {
	#	$Result = Invoke-FSAPI @Splat -EnableException $true
	#} -Continue

	if ($Result) {
		Write-PSFMessage "Created ticket $($Result.ticket.ID)"
		Write-Output $Result.ticket
	}
}

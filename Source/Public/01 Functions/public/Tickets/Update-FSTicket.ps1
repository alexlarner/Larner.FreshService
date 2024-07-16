function Update-FSTicket {
	<#
	.EXTERNALHELP
		https://api.freshservice.com/#filter_tickets

	.NOTES
		Attachments don't work

		To Do
		=====
		Update subcategory validation
#>
	[CmdletBinding(
		DefaultParameterSetName = 'NonRequester',
		SupportsShouldProcess
	)]
	param (
		#ID of the ticket
		[Parameter(
			Mandatory,
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		[long[]]$ID,

		#Name of the requester
		[Parameter(
			Mandatory,
			ParameterSetName = 'PhoneAndName'
		)]
		[string]$Name,

		#User ID of the requester. For existing contacts, the requester_id can be passed instead of the requester's email.
		[Parameter(ParameterSetName = 'ID')]
		[long]$RequesterID,

		#Email address of the requester. If no contact exists with this email address in Freshservice, it will be added as a new contact.
		[Parameter(
			Mandatory,
			ParameterSetName = 'Email'
		)]
		[Parameter(
			Mandatory,
			ParameterSetName = 'PhoneAndEmail'
		)]
		[ValidatePattern('^[A-Z0-9+_.-]+@[A-Z0-9.-]+$')]
		[string]$Email,

		#Phone number of the requester. If no contact exists with this phone number in Freshservice, it will be added as a new contact. If the phone number is set and the email address is not, then the name attribute is mandatory.
		[Parameter(
			Mandatory,
			ParameterSetName = 'PhoneAndEmail'
		)]
		[Parameter(
			Mandatory,
			ParameterSetName = 'PhoneAndName'
		)]
		[ValidatePattern('^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')]
		[string]$Phone,

		#Subject of the ticket. The default value is null.
		[string]$Subject,

		#Helps categorize the ticket according to the different kinds of issues your support team deals with. The default Value is null.
		[PsfValidateSet(TabCompletion = 'FreshService.TicketTypeNames')]
		[string]$Type,

		#Status of the ticket. The default Value is 2.
		[PsfValidateSet(TabCompletion = 'FreshService.StatusNames')]
		[string]$Status,

		#Priority of the ticket. The default value is 1.
		[PsfValidateSet(TabCompletion = 'FreshService.PriorityNames')]
		[string]$Priority,

		#HTML content of the ticket.
		[string]$Description,

		#ID of the agent to whom the ticket has been assigned
		[Parameter(ParameterSetName = 'ID')]
		[Alias('AgentID')]
		[long]$ResponderId,

		#Ticket attachments. The total size of these attachments cannot exceed 15MB.
		[ValidateScript( { ($_ | Measure-Object -Sum Length).Sum -le 15MB })]
		[System.IO.FileInfo[]]$Attachments,

		#Key value pairs containing the names and values of custom fields.
		[hashtable]$CustomFields,

		#Timestamp that denotes when the ticket is due to be resolved
		[datetime]$DueBy,

		#ID of email config which is used for this ticket. (i.e., support@yourcompany.com/sales@yourcompany.com)
		[long]$EmailConfigId,

		#Timestamp that denotes when the first response is due
		[datetime]$FrDueBy,

		#ID of the group to which the ticket has been assigned. The default value is the ID of the group that is associated with the given email_config_id.
		[Parameter(ParameterSetName = 'ID')]
		[long]$GroupId,

		#Name of the group to which the ticket has been assigned. The default value is the ID of the group that is associated with the given email_config_id.
		[Parameter(ParameterSetName = 'Email')]
		[Parameter(ParameterSetName = 'NonRequester')]
		[Parameter(ParameterSetName = 'PhoneAndEmail')]
		[Parameter(ParameterSetName = 'PhoneAndName')]
		[PsfValidateSet(TabCompletion = 'FreshService.AgentGroupNames')]
		[string]$Group,

		#The channel through which the ticket was created. The default value is 2.
		[PsfValidateSet(TabCompletion = 'FreshService.SourceNames')]
		[string]$Source,

		#Tags that have been associated with the ticket.
		[string[]]$Tags,

		#List of assets associated with the ticket
		[hashtable]$Assets,

		#Ticket urgency
		[PsfValidateSet(TabCompletion = 'FreshService.UrgencyNames')]
		[string]$Urgency,

		#Ticket impact
		[PsfValidateSet(TabCompletion = 'FreshService.ImpactNames')]
		[string]$Impact,

		#Ticket category
		[PsfValidateSet(TabCompletion = 'FreshService.CategoryNames')]
		[string]$Category,

		#Ticket sub-category
		#This currently only works if you also specify a category
		[PsfValidateSet(ScriptBlock = {
			if (
				$PSBoundParameters.ContainsKey('ID') -and
				(-Not ($PSBoundParameters.ContainsKey('Category')))
			) {
				$Category = (Get-FSTicket -ID $PSBoundParameters.ID).Category
			} elseif ($PSBoundParameters.ContainsKey('Category')) {
				$Category = $PSBoundParameters['Category']
			}
			if ($Category) {
				Get-FSTicketSubCategories -Category $Category
			} else { Get-FSTicketCategories | Get-FSTicketSubCategories }
		})]
		[string]$SubCategory,

		#Ticket item category
		[string]$ItemCategory,

		#Department ID of the requester.
		[Parameter(ParameterSetName = 'ID')]
		[long]$DepartmentID,

		#Department name of the requester.
		[Parameter(ParameterSetName = 'Email')]
		[Parameter(ParameterSetName = 'NonRequester')]
		[Parameter(ParameterSetName = 'PhoneAndEmail')]
		[Parameter(ParameterSetName = 'PhoneAndName')]
		[PsfValidateSet(TabCompletion = 'FreshService.DepartmentNames')]
		[string]$DepartmentName,

		#Problem need to be associated with ticket display_id: problem display id
		[hashtable]$Problem,

		#Ticket causing change need to be associated display_id: change display id
		[hashtable]$ChangeInitiatingTicket,

		#Change need to be associated with ticket display_id: change display id
		[hashtable]$ChangeInitiatedByTicket,

		[switch]$DeleteExistingTags,

		[switch]$PassThru,

		[switch]$EnableException
	)
	begin {
		$Defaults = @{
			Status   = 2
			Priority = 1
			Source   = 2
		}

		if ($PSBoundParameters.ContainsKey('Tags') -and $PSBoundParameters.Tags -isnot [array]) {
			$PSBoundParameters.Tags = @($PSBoundParameters.Tags)
		}
		if ($PSBoundParameters.ContainsKey('Attachments') -and $PSBoundParameters.Attachments -isnot [array]) {
			$PSBoundParameters.Attachments = @($PSBoundParameters.Attachments)
		}

		if ($PSCmdlet.ParameterSetName -ne 'ID') {
			if ($PSBoundParameters.ContainsKey('DepartmentName')) {
				$PSBoundParameters.Remove('DepartmentName')
				$PSBoundParameters.DepartmentID = (Get-FSDepartment -Name $DepartmentName).ID
			}
			if ($PSBoundParameters.ContainsKey('Group')) {
				$PSBoundParameters.Remove('Group')
				$PSBoundParameters.GroupID = (Get-FSAgentGroup | Where-Object Name -eq $Group).ID
			}
		}

		foreach ($ToTranslate in 'Status', 'Priority', 'Source', 'Urgency', 'Impact') {
			if ($PSBoundParameters.ContainsKey($ToTranslate)) {
				$PSBoundParameters[$ToTranslate] = Get-FSTicketFieldChoiceID -Field $ToTranslate -Choice $PSBoundParameters[$ToTranslate]
			}
		}

		#-ExcludePair $Defaults
		$Body = ConvertTo-FSNames -FrontEndParams $PSBoundParameters -PreserveStringValue * -ExcludeKey ID, DeleteExistingTags, PassThru, EnableException
	}

	process {
		foreach ($TicketID in $ID) {
			$UniqueBody = $Body

			if ($DeleteExistingTags.IsPresent) {
				if (-Not ($UniqueBody.ContainsKey('Tags'))) {
					$UniqueBody.Add('tags', @(''))
				}
			} else {
				if ($UniqueBody.ContainsKey('Tags')) {
					[string[]]$ExistingTags = (Get-FSTicket -ID $TicketID -Include Tags).Tags
					if ($ExistingTags.Count -gt 0) { $UniqueBody.Tags = @($UniqueBody.Tags + $ExistingTags | Select-Object -Unique) }
				}
			}
			Invoke-PSFProtectedCommand -Action "Update ticket" -Target $TicketID -ScriptBlock {
				#$Ticket = Invoke-FSAPI -URISuffix "/tickets/$TicketID" -Form $UniqueBody -Method Put -EnableException $true
				$Ticket = Invoke-FSAPI -URISuffix "/tickets/$TicketID" -Body $UniqueBody -Method Put
			} -Continue

			if ($PassThru.IsPresent) { Write-Output $Ticket.Ticket }
		}
	}
}

function Get-FSAllTickets {
	<#
	.SYNOPSIS

	.DESCRIPTION

	.INPUTS
		String, Long, DateTime
	.OUTPUTS

	.EXAMPLE
		PS C:\> Get-FSALlTickets
	.LINK
		https://api.freshservice.com/#view_all_ticket
	.NOTES

	#>
	[CmdletBinding()]
	param
	(
		#The filters available are new_and_my_open, watching, spam, deleted.
		[ValidateSet('New and My Open', 'Watching', 'Spam', 'Deleted')]
		[string]$Filter,

		[long]$RequesterID,

		[ValidatePattern('^[A-Z0-9+_.-]+@[A-Z0-9.-]+$')]
		[string]$Email,

		#By default only tickets that have been created within the past 30 days will be returned. For older tickets, use this filter.
		[datetime]$UpdatedSince,

		#For Incidents: /api/v2/tickets?type=Incident
		#For Service Requests: /api/v2/tickets?type=Service+Request
		#The API response mentions an alert option
		[PsfValidateSet(TabCompletion = 'FreshService.TicketTypeNamesAlt')]
		[string]$Type,

		#Default sort order type is Descending
		[ValidateSet('Ascending', 'Descending')]
		[string]$OrderType = 'Descending',

		<#
		Stats: Will return the tickets closed_at, resolved_at and first_responded_at time.
		Requester: Will return the requester's email, id, mobile, name, and phone.
		Requested_For: Will return details of the user on behalf of whom the request has been raised
		Tags and department are not listed in the documentation, but are listed in the error response if you use an invalid value for this.
		#>
		[ValidateSet('Stats', 'Requester', 'Requested For', 'Tags', 'Department')]
		[string[]]$Include
	)

	$APIDefaultValues = @{ OrderType = 'Descending' }

	$DateProcessing = {
		if ($args[0].TimeOfDay -eq '00:00:00') {
			Get-Date $args[0] -UFormat %Y-%m-%d
		} else {
			Get-Date $args[0] -UFormat %Y-%m-%dT%TZ%Z
		}
	}

	$Body = ConvertTo-FSNames -FrontEndParams $PSBoundParameters -ExcludePair $APIDefaultValues -ExtraProcessing @{ UpdatedSince = $DateProcessing } -PreserveStringValue 'Type'
	#This is because the includes field cannot be an array, it has to be the translated names joined by a comma
	if ($Body.ContainsKey('Include')) { $Body.Include = $Body.Include -join ',' }

	Write-PSFMessage 'Getting all tickets'
	Write-Output (Invoke-FSAPI -URISuffix '/tickets' -Body $Body).Tickets
}

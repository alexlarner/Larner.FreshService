function Get-FSTimeEntry {
	<#
		.NOTES
			https://api.freshservice.com/#view_ticket_time_entry
	#>
	[CmdletBinding()]
	param (
		#Time Entry ID
		[Parameter(Mandatory,
			ValueFromPipeline,
			ValueFromPipelineByPropertyName)]
		[long]$ID,

		#Time Entry ID
		[Parameter(Mandatory)]
		[long]$TicketID
	)
	process {
		foreach ($TimeEntryID in $ID) {
			(Invoke-RestMethod -Headers $Header -Uri ($BaseURL + "/tickets/$TicketID/time_entries/$TimeEntryID")).time_entry
		}
	}
}

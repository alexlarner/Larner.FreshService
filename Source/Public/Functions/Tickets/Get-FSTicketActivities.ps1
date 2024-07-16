function Get-FSTicketActivities {
	<#
	.LINK
		https://api.freshservice.com/#get_ticket_activities
	#>
	[CmdletBinding()]
	param (
		#Ticket ID
		[Parameter(Mandatory,
			ValueFromPipeline,
			ValueFromPipelineByPropertyName)]
		[long]$ID
	)
	process {
		foreach ($TicketID in $ID) {
			Write-PSFMessage "Getting activities from ticket $TicketID"
			Write-Output (Invoke-FSAPI -URISuffix "/tickets/$TicketID/activities").activities
		}
	}
}

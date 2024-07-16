function Restore-FSTicket {
	<#
	.EXTERNALHELP
		https://api.freshservice.com/#restore_a_ticket
#>
	[CmdletBinding()]
	param (
		[Parameter(Mandatory,
			ValueFromPipeline,
			ValueFromPipelineByPropertyName)]
		[long[]]$ID
	)
	process {
		foreach ($TicketNumber in $ID) {
			Write-PSFMessage "Restoring ticket $TicketNumber"
			Invoke-FSAPI -URISuffix "/tickets/$TicketNumber/restore" -Method Put
			#Invoke-RestMethod -Headers $Header -Uri "$BaseURL/tickets/$TicketNumber/restore"
		}
	}
}

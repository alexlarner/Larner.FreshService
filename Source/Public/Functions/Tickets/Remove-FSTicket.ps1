function Remove-FSTicket {
	<#
	.LINK
		https://api.freshservice.com/#delete_a_ticket
	#>
	[CmdletBinding()]
	param (
		[Parameter(
			Mandatory,
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		[long[]]$ID
	)
	process {
		foreach ($TicketID in $ID) {
			Write-PSFMessage "Deleting ticket $TicketID"
			Invoke-FSAPI -URISuffix "/tickets/$TicketID" -Method Delete
		}
	}
}

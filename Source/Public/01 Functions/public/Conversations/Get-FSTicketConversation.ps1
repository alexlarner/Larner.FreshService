function Get-FSTicketConversation {
	[CmdletBinding()]
	param (
		[Parameter(
			Mandatory,
			ValueFromPipeline
		)]
		[Alias('TicketID')]
		[long]$ID,

		[switch]$EnableException
	)
	process {
		foreach ($TicketID in $ID) {
			Write-Output (Invoke-FSAPI -URISuffix "/tickets/$TicketID/conversations").Conversations
		}
	}
}
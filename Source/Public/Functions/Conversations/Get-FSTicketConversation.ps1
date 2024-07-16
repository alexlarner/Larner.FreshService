function Get-FSTicketConversation {
	[CmdletBinding(SupportsShouldProcess)]
	[OutputType([Conversation])]
	param (
		[Parameter(
			Mandatory,
			ValueFromPipeline
		)]
		[Alias('Ticket')]
		[Ticket[]]$ID,

		[switch]$DisablePropertyExpansion,

		[switch]$EnableException
	)
	process {
		foreach ($TicketID in $ID.ID) {
			Invoke-PSFProtectedCommand -Action "Getting ticket conversations on $TicketID" -Target $TicketID -ScriptBlock {
				$Result = (Invoke-FSAPI -URISuffix "/tickets/$TicketID/conversations").Conversations
			} -Continue

			$Result |
			ForEach-Object {
				$Conversation = [Conversation]::New($_)
				if (-Not $DisablePropertyExpansion) {
					$Conversation.UpdateCustomClassProperties()
				}
				Write-Output $Conversation
			}
		}
	}
}
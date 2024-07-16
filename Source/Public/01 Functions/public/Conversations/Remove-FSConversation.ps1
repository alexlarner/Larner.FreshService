function Remove-FSConversation {
	[CmdletBinding(SupportsShouldProcess)]
	[Alias('Remove-FSNote')]
	param (
		[Parameter(
			Mandatory,
			ValueFromPipeline
		)]
		[Alias('ConversationID')]
		[long]$ID,

		[switch]$EnableException
	)
	process {
		foreach ($ConversationID in $ID) {
			Invoke-PSFProtectedCommand -Action 'Deleting conversation' -Target $ConversationID -ScriptBlock {
				Invoke-FSAPI -URISuffix "/conversations/$ConversationID" -Method Delete	| Out-Null
			} -Continue
		}
	}
}
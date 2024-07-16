function Remove-FSTicketAttachment {
	<#
	.LINK
		https://api.freshservice.com/#delete_a_ticket_attachment
	#>
	[CmdletBinding()]
	param (
		[Parameter(
			Mandatory,
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		[long[]]$ID,

		[long]$TicketID
	)
	process {
		foreach ($AttachmentNumber in $ID) {
			Write-PSFMessage "Removing attachment $AttachmentNumber from ticket $TicketID"
			Invoke-FSAPI -URISuffix "/tickets/$TicketID/attachments/$AttachmentNumber" -Method Delete
		}
	}
}

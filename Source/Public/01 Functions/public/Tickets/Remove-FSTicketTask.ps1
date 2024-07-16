function Remove-FSTicketTask {
	[CmdletBinding(
		DefaultParameterSetName = 'NoGroup',
		SupportsShouldProcess
	)]
	param (
		#Unique ID of the task.
		[Parameter(
			Mandatory,
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		[long]$ID,

		#ID of the ticket to attach the task to.
		[Parameter(Mandatory)]
		[long]$TicketID,

		[switch]$EnableException
	)
	process {
		foreach ($TaskID in $ID) {
			Invoke-PSFProtectedCommand -Action "Remove task $TaskID" -Target "Ticket $TicketID" -ScriptBlock {
				#This API call $onnormally returns a blank line
				Invoke-FSAPI -URISuffix "/tickets/$TicketID/tasks/$TaskID" -Method Delete | Out-Null
			} -Continue
		}
	}
}

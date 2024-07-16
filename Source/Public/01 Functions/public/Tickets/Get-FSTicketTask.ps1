function Get-FSTicketTask {
	[CmdletBinding()]
	param (
		[Parameter(
			Mandatory,
			ValueFromPipeline
		)]
		[int[]]$TicketID,

		[Alias('TaskID')]
		[int[]]$ID,

		[switch]$EnableException
	)
	process {
		foreach ($TickID in $TicketID) {
			$URISuffix = "/tickets/$TickID/tasks"
			if ($PSBoundParameters.ContainsKey('ID')) {
				foreach ($TaskID in $ID) {
					Write-Output (Invoke-FSAPI -URISuffix ($URISuffix + "/$TaskID")).Task
				}
			} else {
				Write-Output (Invoke-FSAPI -URISuffix $URISuffix).Tasks
			}
		}
	}
}
function Get-FSTicketTask {
	[CmdletBinding()]
	param (
		[Parameter(
			Mandatory,
			ValueFromPipeline
		)]
		[Ticket[]]$Ticket,

		[Alias('TaskID')]
		[int[]]$ID,

		[switch]$EnableException
	)
	process {
		foreach ($TicketID in $Ticket.ID) {
			$URISuffix = "/tickets/$Tick/tasks"
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
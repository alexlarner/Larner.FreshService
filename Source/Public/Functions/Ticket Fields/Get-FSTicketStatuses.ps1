function Get-FSTicketStatuses {
	[CmdletBinding()]
	param (
		[switch]$EnableException
	)
	Get-FSTicketFieldValues -Field Status
}

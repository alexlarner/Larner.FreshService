function Get-FSAllTicketFields {
	[CmdletBinding()]
	param (
		[switch]$EnableException
	)
	Get-PSFTaskEngineCache -Module FreshService -Name TicketFieldValues
}
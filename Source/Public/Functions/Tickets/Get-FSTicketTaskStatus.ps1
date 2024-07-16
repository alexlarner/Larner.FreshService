#I don't know if this function really needs to exist
function Get-FSTicketTaskStatus {
	[CmdletBinding()]
	param (
		[Parameter(
			ParameterSetName = 'ID',
			Mandatory
		)]
		[PSFValidateSet(ScriptBlock = {$TicketTaskStatuses.Keys})]
		[int]$ID,

		[Parameter(
			ParameterSetName = 'Name',
			Mandatory
		)]
		[PSFValidateSet(ScriptBlock = {$TicketTaskStatuses.Values})]
		[string]$Name
	)

	if ($PSCmdlet.ParameterSetName -eq 'ID') {
		$TicketTaskStatuses[$ID]
	} else {
		($TicketTaskStatuses.GetEnumerator() | Where-Object Value -eq $Name).Key
	}
}

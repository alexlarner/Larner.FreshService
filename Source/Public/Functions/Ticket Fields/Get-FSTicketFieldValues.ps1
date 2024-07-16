function Get-FSTicketFieldValues {
	[CmdletBinding()]
	param (
		#[PsfValidateSet(TabCompletion = 'FreshService.TicketFieldsWithChoices')]
		[string[]]$Field,

		[switch]$EnableException
	)
	Write-PSFMessage -Level System -Message "Getting ticket $($Field.ToLower()) values"
	(Get-FSAllTicketFields | Where-Object Label -In @($Field)).Choices.Value | Sort-Object
}

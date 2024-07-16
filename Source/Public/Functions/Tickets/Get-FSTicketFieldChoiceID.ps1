function Get-FSTicketFieldChoiceID {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory)]
		[PsfValidateSet(TabCompletion = 'FreshService.TicketFieldsWithChoices')]
		[string]$Field,

		[Parameter(
			Mandatory,
			ValueFromPipeline
		)]
		[Alias('Value')]
		[string[]]$Choice
	)
	process {
		foreach ($Value in $Choice) {
			Write-PSFMessage -Level System -Message "Getting ID for choice $Value for ticket field $Field"

			Get-FSAllTicketFields |
				Where-Object Label -EQ $Field |
					Select-Object -ExpandProperty Choices |
						Where-Object Value -EQ $Value |
							Select-Object -ExpandProperty ID
		}
	}
}

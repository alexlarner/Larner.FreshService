function Get-FSTicketSubCategories {
	[CmdletBinding()]
	param (
		[Parameter(
			Mandatory,
			ValueFromPipeline
		)]
		[PsfValidateSet(TabCompletion = 'FreshService.CategoryNames')]
		[string]$Category
	)
	process {
		foreach ($Cat in $Category) {
			Write-PSFMessage "Getting ticket subcategories for $Cat"
			((Get-FSAllTicketFields | Where-Object Label -EQ Category).Choices | Where-Object Value -EQ $Cat).Nested_Options.Value | Sort-Object
		}
	}
}

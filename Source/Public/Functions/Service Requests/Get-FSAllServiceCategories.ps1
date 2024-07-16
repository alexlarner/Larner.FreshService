function Get-FSAllServiceCategories {
	[CmdletBinding()]
	param ()
	(Invoke-FSAPI -URISuffix '/service_catalog/categories').service_categories
}

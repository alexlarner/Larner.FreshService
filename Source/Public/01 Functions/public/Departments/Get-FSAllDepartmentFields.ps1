function Get-FSAllDepartmentFields {
	[CmdletBinding()]
	param ()

	Write-PSFMessage 'Getting all department fields'

	(Invoke-FSAPI -URISuffix '/department_fields').department_fields
}

function Get-FSDepartment {
	[CmdletBinding(DefaultParameterSetName = 'All')]
	param (
		#ID of the department.
		[Parameter(
			ParameterSetName = 'ID',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		[long[]]$ID,

		#Name of the department.
		[Parameter(
			ParameterSetName = 'Name',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		[PsfValidateSet(TabCompletion = 'FreshService.DepartmentNames')]
		[string[]]$Name
	)
	process {
		switch ($PSCmdlet.ParameterSetName) {
			'All' {
				Write-PSFMessage "Getting all departments"
				Write-Output (Invoke-FSAPI -URISuffix '/departments').Departments
			}
			'ID' {
				$ID | ForEach-Object {
					Write-PSFMessage "Getting department $_"
					Write-Output (Invoke-FSAPI -URISuffix "/departments/$_").Department
				}
			}
			'Name' {
				$Name | ForEach-Object {
					Write-PSFMessage "Getting $_ department"
					Write-Output (Invoke-FSAPI -URISuffix '/departments' -Body @{ query = "name:'$_'" }).Departments
				}
			}
		}
	}
}

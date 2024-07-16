function Remove-FSDepartment {
	[CmdletBinding()]
	param (
		#ID of the department.
		[Parameter(
			Mandatory,
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		[long[]]$ID
	)
	process {
		$ID | ForEach-Object { Invoke-FSAPI -URISuffix "/departments/$_" -Method Delete }
	}
}

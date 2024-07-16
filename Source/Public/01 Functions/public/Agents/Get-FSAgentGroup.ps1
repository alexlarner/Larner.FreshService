function Get-FSAgentGroup {
	[CmdletBinding(DefaultParameterSetName = 'All')]
	param (
		[Parameter(
			ParameterSetName = 'ID',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		[long[]]$ID
	)
	process {
		if ($PSCmdlet.ParameterSetName -eq 'All') {
			Write-PSFMessage 'Getting all agent groups'
			Write-Output (Invoke-FSAPI -URISuffix '/groups').Groups
		} else {
			$ID | ForEach-Object {
				Write-PSFMessage "Getting agent group $_"
				Write-Output (Invoke-FSAPI -URISuffix "/groups/$_").Group
			}
		}
	}
}

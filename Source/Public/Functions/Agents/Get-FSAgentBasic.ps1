function Get-FSAgentBasic {
	[CmdletBinding()]
	param (
		[Parameter(
			Mandatory,
			ValueFromPipeline
		)]
		[Agent]$Agent,

		[switch]$EnableException
	)
	process {
		Write-Host "You selected Agent $Agent" -ForegroundColor Green        
	}
}
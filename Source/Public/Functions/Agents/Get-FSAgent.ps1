function Get-FSAgent {
	<#
	.SYNOPSIS

	.DESCRIPTION

	.INPUTS

	.OUTPUTS

	.EXAMPLE
		PS C:\>
	.LINK
		https://api.freshservice.com/#view_an_agent
	.LINK
		https://api.freshservice.com/#list_all_agents
	.NOTES
		List all agents and view an agent are currently supported, but filter agent is not yet, because it has custom query language like filter tickets
	#>
	[CmdletBinding(
		DefaultParameterSetName = 'All',
		SupportsShouldProcess
	)]
	[OutputType([Agent])]
	param (
		[Parameter(
			Mandatory,
			ParameterSetName = 'ID',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		[long[]]$ID,

		[Parameter(
			ParameterSetName = 'Filtered',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		[ValidatePattern('^[A-Z0-9+_.-]+@[A-Z0-9.-]+$')]
		[string[]]$Email,

		[Parameter(
			ParameterSetName = 'Filtered',
			ValueFromPipelineByPropertyName
		)]
		[ValidatePattern('^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')]
		[string]$MobilePhoneNumber,

		[Parameter(
			ParameterSetName = 'Filtered',
			ValueFromPipelineByPropertyName
		)]
		[ValidatePattern('^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')]
		[string]$WorkPhoneNumber,

		[Parameter(ParameterSetName = 'Filtered')]
		[bool]$Active,

		#The allowable values for this are only documented in the API error message for when you use an invalid state
		[Parameter(
			Mandatory,
			ParameterSetName = 'Filtered by State'
		)]
		[ValidateSet('Occasional','Fulltime')]
		[string]$State,

		[switch]$DisablePropertyExpansion,

		[switch]$EnableException
	)
	begin {
		$Splat = @{ UriSuffix = '/agents' }
		$RootProperty = 'Agents'
	}
	process {
		# Write-PSFMessage -Target $PSBoundParameters -Level Debug -Message "Running $($MyInvocation.MyCommand) using parameter set $($PSCmdlet.ParameterSetName) with these parameters"
		switch ($PSCmdlet.ParameterSetName) {
			'ID' {
				$RootProperty = 'Agent'
				$Splat = $ID | ForEach-Object { @{ UriSuffix = "/agents/$_" } }
			}
			'Filtered by State' {
				$Splat.Body = @{ state = $State.ToLower() }
			}
			'Filtered' {
				$Splat.Body = ConvertTo-FSNames -FrontEndParams $PSBoundParameters -PreserveStringValue * -ExcludeKey Email
				if ($PSBoundParameters.ContainsKey('Email')) {
					$Splat = $Email | ForEach-Object {
						$TempSplat = $Splat.Clone()
						$TempSplat.Body.email = $_
						$TempSplat
					}
				}
			}
		}
		foreach ($ParamSplat in $Splat) {
			Invoke-PSFProtectedCommand -Action "Getting agents by $($PSCmdlet.ParameterSetName)" -Target $ParamSplat -ScriptBlock {
				$Result = Invoke-FSAPI @ParamSplat
			} -Continue

			if (-not $Result.$RootProperty) { Continue }

			$Agents = $Result.$RootProperty | ForEach-Object { [Agent]::New($_) }

			if (-Not $DisablePropertyExpansion) {
				$Agents.UpdateCustomClassProperties()
			}

			Write-Output $Agents
		}
	}
}

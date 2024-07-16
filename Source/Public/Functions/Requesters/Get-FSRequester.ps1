function Get-FSRequester {
	[CmdletBinding(
		DefaultParameterSetName = 'All',
		SupportsShouldProcess
	)]
	[OutputType([Requester])]
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

		[switch]$DisablePropertyExpansion,

		[switch]$EnableException
	)
	begin {
		$Splat = @{ UriSuffix = '/requesters' }
		$RootProperty = 'Requesters'
	}
	process {
		Write-PSFMessage -Target $PSBoundParameters -Level Debug -Message "Running $($MyInvocation.MyCommand) using parameter set $($PSCmdlet.ParameterSetName) with these parameters"
		switch ($PSCmdlet.ParameterSetName) {
			'ID' {
				$RootProperty = 'Requester'
				$Splat = $ID | ForEach-Object { @{ UriSuffix = "/requesters/$_" } }
			}
			'Filtered' {
				$Splat.Body = ConvertTo-FSNames -FrontEndParams $PSBoundParameters -PreserveStringValue * -ExcludeKey Email
				#This is because email is an array unlike the other parameters in the Filtered parameter set
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
			Invoke-PSFProtectedCommand -Action "Getting requesters by $($PSCmdlet.ParameterSetName)" -Target $ParamSplat -ScriptBlock {
				$Result = Invoke-FSAPI @ParamSplat
			} -Continue

			if (-not $Result.$RootProperty) { Continue }

			$Requesters = $Result.$RootProperty | ForEach-Object { [Requester]::New($_) }

			if (-Not $DisablePropertyExpansion) {
				$Requesters.UpdateCustomClassProperties()
			}

			Write-Output $Requesters
		}
	}
}
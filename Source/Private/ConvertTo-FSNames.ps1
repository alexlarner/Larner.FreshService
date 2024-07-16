function ConvertTo-FSNames {
	[CmdletBinding()]
	param (
		[parameter(
            Mandatory,
			ValueFromPipeline
        )]
		[hashtable]$FrontEndParams,

		[string[]]$ExcludeKey,

		[hashtable]$ExcludePair,

		[hashtable]$ExtraProcessing,

		[string[]]$PreserveStringValue,

		[string]$DateUFormatting = '%Y-%m-%dT%TZ%Z',

		[hashtable]$KeyTranslation = $script:APIPropertyTranslation,

		[hashtable]$ValueTranslation = $script:APIPropertyValueTranslation
	)
	begin {
		$Body = @{}
		@(
			'Debug',
			'DisablePropertyExpansion',
			'EnableException',
			'PassThru',
			'Verbose'
		) |
			ForEach-Object {
				if ($_ -notin $ExcludeKey) { $ExcludeKey += $_ }
			}
	}
	process {
		foreach ($Pair in $FrontEndParams.GetEnumerator()) {
			Write-PSFMessage -Level Debug "Converting pair $($Pair.Key):$($Pair.Value) to their valid API values"
			if (
				$Pair.Key -in $ExcludeKey -or
				(
					$ExcludePair -and
					$ExcludePair.ContainsKey($Pair.Key) -and
					($ExcludePair.($Pair.Key) -eq $Pair.Value)
				)
			) {
				continue
			}

			$Key = if ($KeyTranslation.ContainsKey($Pair.Key)) {
				$KeyTranslation[$Pair.Key]
			} else {
				$Pair.Key.ToLower()
			}

			$Value = foreach ($KeyValue in $Pair.Value) {
				if ($null -ne $ExtraProcessing -and $Pair.Key -in $ExtraProcessing.Keys) {
					& $ExtraProcessing.($Pair.Key) $KeyValue
					break
				} else {
					switch ($KeyValue) {
						{ $_ -is [string] } {
							if (
							$null -ne $PreserveStringValue -and
							($Pair.Key -in $PreserveStringValue -or $PreserveStringValue[0] -eq '*')
							) {
								$KeyValue
							} elseif ($ValueTranslation.ContainsValue($KeyValue)) {
								($ValueTranslation.GetEnumerator() | Where-Object Value -EQ $KeyValue).Key
							} else {
								$KeyValue.ToLower()
							}
						}
						{ $_ -is [DateTime] } { Get-Date $KeyValue -UFormat $DateUFormatting }
						{ $_ -is [System.Management.Automation.SwitchParameter] } { $KeyValue.ToBool() }
						{ $_ -is [FreshService] } { $KeyValue.ID }
						default { $KeyValue }
					}
				}
				# elseif ($KeyValue -is [string]) {
				# 	if (
				# 		$null -ne $PreserveStringValue -and
				# 		($Pair.Key -in $PreserveStringValue -or $PreserveStringValue[0] -eq '*')
				# 	) {
				# 		$KeyValue
				# 	} elseif ($ValueTranslation.ContainsValue($KeyValue)) {
				# 		($ValueTranslation.GetEnumerator() | Where-Object Value -EQ $KeyValue).Key
				# 	} else {
				# 		$KeyValue.ToLower()
				# 	}
				# } elseif ($KeyValue -is [DateTime]) {
				# 	Get-Date $KeyValue -UFormat $DateUFormatting
				# } elseif ($KeyValue -is [System.Management.Automation.SwitchParameter]) {
				# 	$KeyValue.ToBool()
				# } else {
				# 	$KeyValue
				# }
			}
			if ($Pair.Value -is [array] -and $Pair.Value.Count -eq 1) {
				$Value = @($Value)
			}
			$Body.Add($Key, $Value)
		}
	}
	end { $Body }
}

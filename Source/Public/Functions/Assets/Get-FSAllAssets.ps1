function Get-FSAllAssets {
	[CmdletBinding()]
	param (
		#Default order by is created_at.
		[ValidateSet('ID', 'Created At', 'Updated At')]
		[string]$OrderBy = 'Created At',

		#Default sort order is desc.
		[ValidateSet('Ascending', 'Descending')]
		[string]$OrderType = 'Descending',

		#Will return all fields that are specific to each asset type. For example, for Hardware Asset Type, including type_fields will return fields such as Product_ID, Vendor_ID, Serial_number, etc.
		[ValidateSet('Type Fields')]
		[string]$Include,

		#Will return all the assets that are in trash.
		[bool]$Trashed
	)

	$Body = ConvertTo-FSNames -FrontEndParams $PSBoundParameters -ExcludePair @{ OrderBy = 'Created At'; OrderType = 'Descending' }

	Write-PSFMessage 'Getting all assets'
	$Response = (Invoke-FSAPI -URISuffix '/assets' -Body $Body).Assets
	#$Response = $(Invoke-RestMethod -Headers $Header -Uri ($BaseURL + '/assets') -Body $Body -FollowRelLink).assets

	<#
		When Include Type Fields is specified the "type_field" property on the assets contains properties with numbers in the name, i.e.:

		asset_state_18000471492          : In Use
		serial_number_18000471492        : 1Y87MN3
		last_audit_date_18000471492      : 5/5/2022 3:13:00 PM
		os_18000471497                   : Microsoft Windows 10 Pro
		os_version_18000471497           : 10.0.19043

		So the below bit removes that
	#>
	if ($Include) {
		Write-PSFMessage "Removing numbers from the type_field subproperty names on the $($Response.Count) assets"
		foreach ($Asset in $Response) {
			$NewTypeData = @{}
			Write-PSFMessage -Level SomewhatVerbose -Message "Removing numbers from the type_field subproperty names on $($Asset.Name)"
			foreach ($TypeDataName in $Asset.type_fields.PSObject.Properties.Name) {
				if ($TypeDataName -match '^(?<TrimmedPropertyName>.*)_[0-9]{11}$') {
					Write-PSFMessage -Level System -Message "Adding $($Matches.TrimmedPropertyName) and its value to the new type data hashtable for $($Asset.Name)"
					$NewTypeData.($Matches.TrimmedPropertyName) = $Asset.type_fields.$TypeDataName
				} else {
					Write-PSFMessage -Level System -Message "Adding $TypeDataName and its value to the new type data hashtable for $($Asset.Name)"
					$NewTypeData.$TypeDataName = $Asset.type_fields.$TypeDataName
				}
			}
			$NewAsset = $Asset
			$NewAsset.type_fields = [PSCustomObject]$NewTypeData
			Write-Output $NewAsset
		}
	} else {
		Write-Output $Response
	}
}

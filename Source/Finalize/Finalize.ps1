$ConnectSplat = @{
	EnableException = $true
}

if (-Not (Test-Path "$env:LOCALAPPDATA\FreshService\FreshServiceAPIKey.xml")) {
	$ConnectSplat.SaveCredentials = $true
}

try {
	Connect-FSAPI @ConnectSplat
} catch {
	throw $_
}
Write-PSFMessage "BaseUrl is: $script:BaseURL"
Write-PSFMessage "FSAuthHeader Authorization is: $($FSAuthHeader.Authorization)"

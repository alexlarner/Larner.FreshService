function Connect-FSAPI {
	[CmdletBinding(SupportsShouldProcess)]
	param (
		[SecureString]$APIKey,

		[URI]$FreshServiceURL = 'https://COMPANYNAMEservicedesk.freshservice.com/api/v2',

		[switch]$SaveCredentials,

		[switch]$EnableException
	)
	begin {
		$EncryptedKeyPath = "$env:LOCALAPPDATA\FreshService\FreshServiceAPIKey.xml"
	}
	process {
		if ($null -eq $APIKey) {
			if (Test-Path $EncryptedKeyPath) {
				$APIKey = Import-Clixml $EncryptedKeyPath
			} else {
				$ParentPath = Split-Path $EncryptedKeyPath
				if (-Not (Test-Path $ParentPath)) {
					Invoke-PSFProtectedCommand -Action 'Creating folder for FreshService API key' -Target $ParentPath -ScriptBlock {
						New-Item -ItemType Directory -Path $ParentPath -ErrorAction Stop | Out-Null
					}
				}
				$APIKey = Read-Host -Prompt 'Please enter your FreshService API key' -AsSecureString
				$SaveCredentials = $true
			}
		}

		if ($SaveCredentials) {
			if (Test-Path $ParentPath) {
				Invoke-PSFProtectedCommand -Action 'Exporting FreshService API Key' -Target $EncryptedKeyPath -ScriptBlock {
					$APIKey | Export-Clixml -Path $EncryptedKeyPath -Force -ErrorAction Stop
				}
			}
		}

		$script:BaseURL = $FreshServiceURL
		#Yes this is not secure, as it passes the unencrypted API key into memory. Though I have not found any other way to convert a secure string to a Base64 string that the FreshService API will accept.
		$Base64Creds = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes("$(ConvertFrom-SecureString $APIKey -AsPlainText):"))
		$script:FSAuthHeader = @{ 'Authorization' = "Basic $Base64Creds" }
	}
}
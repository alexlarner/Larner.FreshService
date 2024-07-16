$Script:ErrorActionPreference = 'Stop'

Set-PSFFeature -Name PSFramework.InheritEnableException -Value $true -ModuleName FreshService.Beta
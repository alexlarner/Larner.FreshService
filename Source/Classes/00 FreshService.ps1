class FreshService {
    [long]$ID
    [PSObject]$InputObject
    # [string]$Text
    # [string]$ToolTip

    FreshService () {
        # throw "The FreshService blank constructor should never be called"
    } #For whatever reason, not having a empty constructor on a base class will cause child single input constructors to fail

    FreshService ([PSCustomObject]$RawData) {
        $RenamedRawData = $RawData | Rename-FSObject

        foreach ($PropertyName in $RenamedRawData.PSObject.Properties.Name) {
            $this.$PropertyName = $RenamedRawData.$PropertyName
        }
        $this.InputObject = $RawData
        # $this.Text = $this.ID
        # $this.ToolTip = $this.ToString()
    }

    FreshService ([long]$ID) {
        $This.ID = $ID
        $this.InputObject = $ID
        # $this.Text = $this.ID
        # $this.ToolTip = $ID
    }

    [void] UpdateCustomClassProperties () {
        Write-PSFMessage -Level System -Message "Filling in properties for any property that's a custom class with just an ID filled in" -Target $this -FunctionName 'FreshService.UpdateCustomClassProperties'
        $PropertiesWithCustomType = $this.PSObject.Properties | Where-Object Value | Where-Object Value -is [FreshService]
        #Couldn't we just do an ? value -is [FreshService]
        #Conversation does not and cannot have an UpdatePropeties method
        $PropertiesWithCustomType.Name | ForEach-Object { $This.$_.UpdateProperties() } # I don't think this will update subproperties
    }

    [void] UpdateCustomClassProperties ([string[]]$ClassesToUpdate) {
        Write-PSFMessage -Level System -Message "Filling in properties for these custom classes with just an ID filled in: $($ClassesToUpdate -join ', ')" -Target $this -FunctionName 'FreshService.UpdateCustomClassProperties'
        $PropertiesWithCustomType = $this.PSObject.Properties | Where-Object TypeNameOfValue -in $ClassesToUpdate
        $PropertiesWithCustomType.Name | ForEach-Object { $This.$_.UpdateProperties() } # I don't think this will update subproperties
    }
}


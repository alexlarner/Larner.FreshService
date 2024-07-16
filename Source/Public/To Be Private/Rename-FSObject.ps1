function Rename-FSObject {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory,
            ValueFromPipeline
        )]
        [PSCustomObject]$InputObject
    )
    process {
        foreach ($Object in $InputObject) {
            $RawDataWithValues = $InputObject | Select-FSPropertiesWithValue
            $PropertyTranslation = New-FSPropertyTranslation -Object $RawDataWithValues -OutputType PSFSelect
            $RawDataWithValues | Select-PSFObject -Property $PropertyTranslation | Write-Output
        }        
    }
}
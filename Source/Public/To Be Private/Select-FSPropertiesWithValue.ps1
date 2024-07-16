function Select-FSPropertiesWithValue {
    param (
        [Parameter(
            Mandatory,
            ValueFromPipeline
        )]
        [PSCustomObject[]]$InputObject,

        [string[]]$DeprecatedProperties
    )
    begin {
        $DeprecatedProperties ??= @(
            'role_ids'
        )
    }
    process {
        foreach ($Object in $InputObject) {
            $PropertiesWithValue = $Object.PSObject.Properties |
                Where-Object MemberType -eq 'NoteProperty' |
                    Where-Object Value |
                        Where-Object { '' -ne $_.Value } | #This is to filter out the blank PSCustom objects that come from json like: {"blank_object":{}}
                            Where-Object Name -notin $DeprecatedProperties |
                                Select-Object -ExpandProperty Name

            if ($PropertiesWithValue) { $Object | Select-Object -Property $PropertiesWithValue }
        }
    }
}
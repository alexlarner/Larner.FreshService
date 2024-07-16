function New-FSPropertyTranslation {
	[CmdletBinding()]
    [OutputType()]
	param (
		[Parameter(
			Mandatory,
			ValueFromPipeline
		)]
		[PSCustomObject]$Object,

        [ValidateSet('Hashtable', 'Hashtable Code', 'PSFSelect')]
        [string]$OutputType
	)
    process {
		$PropertyNames = $Object.PSObject.Properties | Where-Object MemberType -eq 'NoteProperty' | Select-Object -ExpandProperty Name | Sort-Object

        $Translation = [Ordered]@{}

        foreach ($PropName in $PropertyNames) {
            $PSName = Convert-FSApiPropertyName -PropertyName $PropName

            if ($PropName -cne $PSName) {
                $Translation.$PropName = $PSName
            }
        }

        if ($Translation.Count -ne 0) {
            switch ($OutputType) {
                Hashtable { $Translation }
                'Hashtable Code' { Convert-HashtableToCode -Hashtable $Translation }
                'PSFSelect' {
                    $Translation.GetEnumerator() | ForEach-Object { $_.Key, $_.Value -join ' as ' }
                    $PropertyNames | Where-Object { $_ -notin $Translation.Keys }
                }
            }
        }
	}
}
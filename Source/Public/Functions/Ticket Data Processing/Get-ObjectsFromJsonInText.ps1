function Get-ObjectsFromJsonInText {
	<#
		.SYNOPSIS
			Parses out PSCustomObjects from a JSON in a string
		.DESCRIPTION
			Finds a JSON inside a string using Regex and converts it into PSCustomObjects.
			Writes a warning and a log message if no regex matches are found in the given text.
		.INPUTS
			String, Regex
		.NOTES
	#>
	[OutputType([PSCustomObject])]
	[CmdletBinding()]
	param (
		[Parameter(
			Mandatory,
			ValueFromPipeline
		)]
		#The text to parse the JSON objects from
		[string[]]$Text,

		#The regex to parse out the JSON from the text. There must only be two capture groups.
		[ValidateScript({ $_.GetGroupNumbers().Count -eq 2 })]
		[regex]$Regex = 'Raw JSON Data: ([\{|\[].+[\}|\]])'
	)
	process {
		$Text.ForEach{
			if ($_ -match $Regex) {
				$Matches[1] | ConvertFrom-Json
			} else {
				Write-Log Warning "$_ did not match $Regex"
			}
		}
	}
}

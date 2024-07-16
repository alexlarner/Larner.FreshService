function Get-StringsFromFSTicketDescription {
	<#
		.SYNOPSIS
			Parses out a list of strings from a string
		.DESCRIPTION
			Finds a string inside a string using Regex and splits it if a delimiter is given.
			Writes a warning and a log message if no regex matches are found in the given text.
		.EXAMPLE
			PS C:\> Get-ObjectsFromJsonInText -Text 'Failed to disable the AD Account of alarner' -Text 'Failed to disable the AD Account of (.+)$'
			alarner
		.EXAMPLE
			PS C:\> Get-ObjectsFromJsonInText -Text 'Failed to disable the AD Account of alarner, alarner-test' -Text 'Failed to disable the AD Account of (.+)$' -Delimiter ', '
			alarner
			alarner-test
		.INPUTS
			String, Regex
		.NOTES
	#>
	[OutputType([String])]
	[CmdletBinding()]
	param (
		[Parameter(
			Mandatory,
			ValueFromPipeline
		)]
		#The text to parse the strings from
		[string[]]$Text,

		[Parameter(Mandatory)]
		[ValidateScript({ $_.GetGroupNumbers().Count -eq 2 })]
		#The regex to parse the strings with. There must only be two capture groups.
		[regex]$Regex,

		#The delimiter to split the regex matches with
		[string]$Delimiter
	)
	process {
		foreach ($String in $Text) {
			if ($String -match $Regex) {
				if ($Delimiter -eq '') {
					$Matches[1]
				} else {
					$Matches[1] -split $Delimiter
				}
			} else {
				Write-Log Warning "$String did not match $Regex"
			}
		}
	}
}

function Remove-ReportedIssues {
	<#
	.SYNOPSIS
		Filters out the objects that are in open tickets matching the same tag
	.DESCRIPTION
		Get all the open tickets for the given tag
		Get the objects in those tickets (using Get-ObjectsFromJsonInText)
		Filters out the property value pairs that already exist in the objects in the open tickets (using Select-UniquePropertyValuePairs)
	.EXAMPLE
		PS C:\> Remove-ReportedIssues -Objects $FailedADUpdates -ForeignKey SAMAccountName -Tag 'Failed AD Update'
	.INPUTS
		String, Regex, PSCustomObject
	.NOTES
	#>
	[CmdletBinding(DefaultParameterSetName = 'Objects')]
	[OutputType([PSCustomObject], ParameterSetName = 'Objects')]
	[OutputType([String], ParameterSetName = 'Strings')]
	param (
		[Parameter(
			Mandatory,
			ParameterSetName = 'Strings'
		)]
		#The objects to filter
		[string[]]$Strings,

		[Parameter(
			Mandatory,
			ParameterSetName = 'Strings'
		)]
		[ValidateScript({ $_.GetGroupNumbers().Count -eq 2 })]
		#The regex to parse the strings with. There must only be two capture groups.
		[Regex]$Regex,

		[Parameter(
			ParameterSetName = 'Strings'
		)]
		#The delimiter to split the regex matches with
		[string]$Delimiter,

		[Parameter(
			Mandatory,
			ParameterSetName = 'Objects'
		)]
		#The objects to filter
		[PSCustomObject[]]$Objects,

		[Parameter(
			Mandatory,
			ParameterSetName = 'Objects'
		)]
		#The property that links the given objects and the objects from the tickets together.
		[string]$ForeignKey,

		<#
		If you want the matching of the new issues to only match on the foreign key and not all of the object's properties.
		If this is not used, but the Objects parameter set is used, the objects for any new tickets will only have the foreign key property and any properties that have changed for that object since it was last reported.
		#>
		[Parameter( ParameterSetName = 'Objects')]
		[switch]$MatchOnForeignKeyOnly,

		[Parameter(Mandatory)]
		#The tag to search for open tickets for.
		[string]$Tag
	)

	$ItemsToFilter = switch ($PSCmdlet.ParameterSetName) {
		'Objects' { $Objects }
		'Strings' { $Strings }
	}

	Write-Log Debug "Filtering out already reported issues from the $Tag tickets"

	$OpenTickets = Get-FSTicketFromQuery -Query (New-FSTicketTagQuery -Tag $Tag) -ExcludeClosedResolvedTickets

	if ($null -ne $OpenTickets) {
		Write-Log Debug "Found $($OpenTickets.Count) open tickets for $Tag"

		$ParseSplat = @{
			Text  = $OpenTickets.Description
		}

		switch ($PSCmdlet.ParameterSetName) {
			'Objects' {
				[PSCustomObject[]]$AlreadyReported = Get-ObjectsFromJsonInText @ParseSplat
			}
			'Strings' {
				$ParseSplat.Add('Regex', $Regex)
				if ($Delimiter -ne '') { $ParseSplat.Add('Delimiter', $Delimiter) }
				[string[]]$AlreadyReported = Get-ObjectsFromJsonInText @ParseSplat | Sort-Object -Unique
			}
		}
	} else {
		Write-Log Debug "Found no open tickets for $Tag"
		$AlreadyReported = @()
	}

	if ($AlreadyReported.Count -gt 0) {
		Write-Log Debug "Filtering out the $($AlreadyReported.Count) items in open tickets for $Tag"
		switch ($PSCmdlet.ParameterSetName) {
			'Objects' {
				foreach ($Object in $ItemsToFilter) {
					if ($Object.$ForeignKey -in $AlreadyReported.$ForeignKey) {
						[PSCustomObject[]]$MatchingExistingObjects = $AlreadyReported | Where-Object $ForeignKey -EQ $Object.$ForeignKey
						if ($MatchOnForeignKeyOnly) {
							if ($MatchingExistingObjects.Count -eq 0) { $Object }
						} else {
							Select-UniquePropertyValuePairs -NewObject $Object -ExistingObjects $MatchingExistingObjects -PreserveProperty $ForeignKey
						}
					} else { $Object }
				}
			}
			'Strings' {	$ItemsToFilter | Where-Object { $_ -notin $AlreadyReported } }
		}
	} else { $ItemsToFilter }
}

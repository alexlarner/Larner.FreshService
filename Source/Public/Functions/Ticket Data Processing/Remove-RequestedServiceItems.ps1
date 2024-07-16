function Remove-RequestedServiceItems {
	<#
	.SYNOPSIS
		Filters out the objects that are in open tickets matching the same tag
	.DESCRIPTION
		Get all the open tickets for the given tag
		Get the objects in those tickets (using Get-ObjectsFromJsonInText)
		Filters out the property value pairs that already exist in the objects in the open tickets (using Select-UniquePropertyValuePairs)
	.EXAMPLE
		PS C:\> Remove-ReportedIssues -Objects $FailedADUpdates -ForeignKey SAMAccountName -Tag 'Failed AD Update'
	.NOTES
	#>
	[CmdletBinding()]
	[OutputType([PSCustomObject])]
	param (
		[Parameter(Mandatory)]
		#The objects to filter
		[PSCustomObject[]]$Objects,

		[Parameter(Mandatory)]
		#The property that links the given objects and the objects from the tickets together.
		[string]$ForeignKey,

		#If you want the matching of the new issues to only match on the foreign key and not all of the object's properties.
		[switch]$MatchOnForeignKeyOnly,

		[Parameter(Mandatory)]
		#The tag to search for open tickets for.
		[string]$Tag
	)

	Write-Log Debug "Filtering out already reported issues from the $Tag tickets"

	$OpenTickets = Get-FSTicketFromQuery -Query (New-FSTicketTagQuery -Tag $Tag) -ExcludeClosedResolvedTickets

	if ($null -ne $OpenTickets) {
		Write-Log Debug "Found $($OpenTickets.Count) open tickets for $Tag"
		[PSCustomObject[]]$AlreadyReported = (Get-FSServiceRequestItems -ID $OpenTickets.ID)?.custom_fields
	} else {
		Write-Log Debug "Found no open tickets for $Tag"
		$AlreadyReported = @()
	}

	if ($AlreadyReported.Count -gt 0) {
		Write-Log Debug "Filtering out the $($AlreadyReported.Count) items in open tickets for $Tag"
		foreach ($Object in $Objects) {
			if ($Object.$ForeignKey -in $AlreadyReported.$ForeignKey) {
				[PSCustomObject[]]$MatchingExistingObjects = $AlreadyReported | Where-Object $ForeignKey -EQ $Object.$ForeignKey
				if ($MatchOnForeignKeyOnly) {
					if ($MatchingExistingObjects.Count -eq 0) { $Object }
				} else {
					Select-UniquePropertyValuePairs -NewObject $Object -ExistingObjects $MatchingExistingObjects -PreserveProperty $ForeignKey
				}
			} else { $Object }
		}
	} else { $Objects }
}

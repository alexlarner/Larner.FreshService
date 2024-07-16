function New-FSTicketForUnreportedIssues {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory)]
		[PSObject[]]$Object,

		[Parameter(Mandatory)]
		[string]$ObjectDescription,

		[Parameter(Mandatory)]
		[string]$ForeignKey,

		#[Parameter(Mandatory)]
		#[string]$TicketSummary,

		<#
		This should contain any parameters other than the Subject, Description, or Tag.
		It must contain these parameters: GroupID, Category, Subcategory, Email
		#>
		[Parameter(Mandatory)]
		[ValidateScript({
			$Splat = $_
			$MandatoryKeys = 'GroupID', 'Category', 'Subcategory', 'Email'
			$ExcludeKeys = 'Description', 'Subject', 'Tags'

			$MissingKeys = $MandatoryKeys | Where-Object { $_ -notin $Splat.Keys }
			if ($MissingKeys) { throw "These mandatory keys are missing from the hashtable: $($MissingKeys -join ', ')" }

			$BannedKeys = $ExcludeKeys | Where-Object { $_ -in $Splat.Keys }
			if ($BannedKeys) { 
				throw "These keys should not be in the hashtable as this function sets those new ticket parameters: $($BannedKeys -join ', ')"
			} else { $true }
		})]
		[hashtable]$TicketSplat,
		
		[Parameter(Mandatory)]
		[string]$TagForTicketFilter,

		[Parameter(Mandatory)]
		[string]$TagForNewTicket,
		
		#If you want the matching of the new issues to only match on the foreign key and not all of the object's properties.
		[switch]$MatchOnForeignKeyOnly,

		[string[]]$PropertyToSortOn
	)
	
	Write-PSFMessage "Filtering out the already reported items out of the $($Object.Count) $ObjectDescription"
	$NewIssues = Remove-ReportedIssues -Objects $Object -ForeignKey $ForeignKey -Tag $TagForTicketFilter -MatchOnForeignKeyOnly:$MatchOnForeignKeyOnly

	if ($NewIssues) {
		$TicketSummary = "Found $($NewIssues.Count) $ObjectDescription"

		$SortOn = if ($PropertyToSortOn) { $PropertyToSortOn } else { $ForeignKey }

		$TicketDescription = New-FSTicketDescription -Objects $NewIssues -PropertyToSortOn $SortOn -Summary $TicketSummary

		$NewTicket = New-FSTicket @TicketSplat -Subject $TicketSummary -Description $TicketDescription -Tag ($TagForTicketFilter, $TagForNewTicket)
		
		Write-PSFMessage "Created ticket $($NewTicket.ID) for $($NewIssues.Count) $ObjectDescription"
	} else {
		Write-PSFMessage "All $($Object.Count) $ObjectDescription have already been reported"
	}	
}
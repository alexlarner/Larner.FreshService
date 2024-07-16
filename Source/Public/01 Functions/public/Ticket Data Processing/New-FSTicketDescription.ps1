function New-FSTicketDescription {
	<#
	.SYNOPSIS
		Creates a new FreshService ticket for the issues that occur in the Workday Import script.
	.DESCRIPTION
		Writes a warning using string given in the Summary parameter
		If the MakeDescription parameter set was used
			Convert the objects given into an HTML table fragment
				Prepended with the Summary
				Appended with the Objects as a compressed JSON
				If the DifferentProperties switch was used
					Set the unique property names from all the objects as the HTML table headers
		Create a FreshService ticket with
			Category of the Category parameter
			Subcategory of the Subcategory parameter
			Subject of the Summary parameter
			Description of the Description parameter
			Tag of the Tag parameter and 'Workday Export Script'
			Email of 'WorkdayImport@CompanyName.com'
			Impact & Urgency of Low
		Write a warning and log entry with the new ticket ID and summary
	.EXAMPLE
		PS C:\> $FailedADUpdatesTicketSplat = @{
			Summary             = "Failed to update $($NewFailedADUpdates.Count) AD users"
			PropertyToSortOn    = 'SAMAccountName'
			Objects             = $NewFailedADUpdates
			DifferentProperties = $true
		}
		PS C:\> New-FSWorkdayImportTicket @FailedADUpdatesTicketSplat
	.INPUTS
		String, PSCustomObject
	.OUTPUTS
		None
	.NOTES
	#>
	[CmdletBinding()]
	param (
		[Parameter(Mandatory)]
		#The summary of the issue to go above the HTML table and JSON of the ticket objects
		[string]$Summary,

		[Parameter(Mandatory)]
		#The items to include
		[PSCustomObject[]]$Objects,

		[Parameter(Mandatory)]
		#The property to sort the objects on in the description
		[string[]]$PropertyToSortOn,

		#Use this if the objects do not all have the same properties. If this switch is used it will set the unique property names from all the objects as the HTML table headers in the description.
		[switch]$DifferentProperties
	)
	$ConvertToHTMLSplat = @{
		PreContent = "<p>$Summary`:</p>"
		Fragment   = $true
		PostContent = "<p>Raw JSON Data: $($Objects | ConvertTo-Json -Compress -Depth 100)</p>"
	}
	if ($DifferentProperties.IsPresent) {
		#This has the unique parameter on the sort-object instead of on the select, because the select unique was not merging SAMAccountName and SamAccountName
		$CumulativeProperties = $Objects | ForEach-Object { $_.PSObject.Properties | Where-Object MemberType -EQ NoteProperty } | Select-Object -ExpandProperty Name | Sort-Object -Unique
		$Objects = $Objects | Select-Object -Property $CumulativeProperties
	}

	$Objects | Sort-Object $PropertyToSortOn | ConvertTo-Html @ConvertToHTMLSplat | Join-String -Separator "`r`n"
}

function Get-FSTicketFromQuery {
	[CmdletBinding()]
	param (
		[Parameter(
			Mandatory,
			ValueFromPipeline
		)]
		[ValidateLength(1,512)]
		[string[]]$Query,

		[switch]$ExcludeClosedResolvedTickets,

		[switch]$EnableException
	)
	begin {
		if ($ExcludeClosedResolvedTickets.IsPresent) {
			$StatusesToExclude = 'Closed', 'Resolved'
			
			#This creates a string like: status:2 OR status:3
			$StatusQuery = Get-FSTicketStatuses |
				Where-Object { $_ -notin $StatusesToExclude } |
					Get-FSTicketFieldChoiceID -Field Status |
						Join-String -FormatString 'status:{0}' -Separator ' OR '
		}
	}
	process {
		if ($ExcludeClosedResolvedTickets.IsPresent) {
			$Query = $Query.ForEach{ "($_) AND ($StatusQuery)" }
			Write-PSFMessage -Level System -Message "Updated ticket queries are:`r`n$($Query -join "`r`n")"
		}
		foreach ($Q in $Query) {
			$Body = @{
				page = 1
				query = "`"$Q`""
			}
			<#
				The below is to work around the bug in the FreshService API where no relational links are given to the next page and the total count of the matching tickets is not given, contrary to their documentation,
				see Note #7 on https://api.freshservice.com/#filter_tickets
			#>
			Do {
				Write-PSFMessage -Level Debug -Message "Getting page $($Body.Page) of the tickets that match this query: $($Body.Query)"
				[PSCustomObject[]]$Result = (Invoke-FSAPI -URISuffix "/tickets/filter" -Body $Body).Tickets
				Write-Output $Result
				$Body.Page++
			} While ($Result.Count -eq 100)
		}
	}
}

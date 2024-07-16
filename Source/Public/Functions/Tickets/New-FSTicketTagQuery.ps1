function New-FSTicketTagQuery {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory)]
		[string[]]$Tag,

		[ValidateSet('AND', 'OR')]
		[string]$Operator = 'OR',

		[PsfValidateSet(TabCompletion = 'FreshService.StatusNames')]
		[string[]]$Status
	)

	#This creates a string like: tag:'Bob' OR tag:'Jill' OR tag:'Steve'
	$TagQuery = $Tag | Join-String -FormatString 'tag:''{0}''' -Separator " $Operator "

	if ($PSBoundParameters.ContainsKey('Status')) {
		#This creates a string like: status:2 OR status:3
		$StatusQuery = Get-FSTicketFieldChoiceID -Field Status -Choice $Status | Join-String -FormatString 'status:{0}' -Separator ' OR '
		$TagQuery = "($TagQuery) AND ($StatusQuery)"
	}

	Write-Output $TagQuery
}

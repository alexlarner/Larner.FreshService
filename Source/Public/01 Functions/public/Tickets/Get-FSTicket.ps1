function Get-FSTicket {
	<#
	.LINK
		https://api.freshservice.com/#view_a_ticket
	#>
	[CmdletBinding()]
	param
	(
		[Parameter(
			Mandatory,
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		[ValidateNotNullOrEmpty()]
		[long[]]$ID,

		#Tags is shown in the examples but not in the values table
		[ValidateSet('Conversations', 'Requester', 'Requested For', 'Stats', 'Problem', 'Assets', 'Change', 'Related Tickets', 'Tags')]
		[string[]]$Include,

		[switch]$EnableException
	)
	begin {
		$Splat = @{
			SkipPerPageAddition = $true
		}
		if ($Include) {
			$Splat.Body = ConvertTo-FSNames -FrontEndParams $PSBoundParameters -ExcludeKey ID
			$Splat.Body.Include = $Splat.Body.Include -join ','
		}
	}
	process {
		foreach ($TicketNumber in $ID) {
			$Splat.URISuffix = "/tickets/$TicketNumber"
			Invoke-PSFProtectedCommand -Action 'Get ticket' -Target $ID -ScriptBlock {
				$Result = Invoke-FSAPI @Splat
			} -Continue

			Write-Output $Result.Ticket
		}
	}
}

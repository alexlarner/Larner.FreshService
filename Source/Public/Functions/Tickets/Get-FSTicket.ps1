function Get-FSTicket {
	<#
	.LINK
		https://api.freshservice.com/#view_a_ticket
	#>
	[CmdletBinding(SupportsShouldProcess)]
	[OutputType([Ticket])]
	param
	(
		[Parameter(
			Mandatory,
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		[long[]]$ID,

		#Tags is shown in the examples but not in the values table
		[ValidateSet('Conversations', 'Requester', 'Requested For', 'Stats', 'Problem', 'Assets', 'Change', 'Related Tickets', 'Tags')]
		[string[]]$Include,

		[switch]$DisablePropertyExpansion,

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
		foreach ($TicketID in $ID) {
			$Splat.URISuffix = "/tickets/$TicketID"
			Invoke-PSFProtectedCommand -Action "Get ticket $TicketID" -Target $TicketID -ScriptBlock {
				$Result = Invoke-FSAPI @Splat
			} -Continue

			if (-not $Result.Ticket) { Continue }

			$Ticket = if ($Result.Ticket.Type -eq 'Service Request') {
				[ServiceRequest]::New($Result.Ticket)
			} else { [Ticket]::New($Result.Ticket) }

			if (-Not $DisablePropertyExpansion) {
				$Ticket.UpdateCustomClassProperties()
			}

			Write-Output $Ticket
		}
	}
}

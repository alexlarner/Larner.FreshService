function New-FSTimeEntry {
	<#
	.EXTERNALHELP
		https://api.freshservice.com/#create_ticket_time_entry
	#>
	[CmdletBinding()]
	param (
		#Ticket ID
		[Parameter(
			Mandatory,
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		[long]$ID,

		#Set to true if timer is currently running. Default value is false. At a time, only one timer can be running for an agent across the account
		[bool]$TimerRunning,

		#Set as true if the time-entry is billable. Default value is true
		[bool]$Billable,

		#The total amount of time spent by the timer in hh::mm format. This field cannot be set if timer_running is true. Mandatory if timer_running is false
		[TimeSpan]$TimeSpent,

		#Time at which the timer is executed. Default value (unless given in request) is the time at which timer is added. Should be less than or equal to current date_time
		[ValidateScript({ $_ -le (Get-Date) })]
		[datetime]$ExecutedAt,

		#Id of the task assigned to the time-entry. Task should be valid on the given ticket and assigned to agent_id
		[long]$TaskId,

		#Description of the time-entry
		[string]$Note,

		#The user/agent to whom this time-entry is assigned
		[Parameter(Mandatory)]
		[Agent]$Agent
	)
	begin {
		$PSBoundParameters.Agent = $Agent.ID
		$Splat = @{
			FrontEndParams = $PSBoundParameters
			ExcludeKey = 'ID'
			PreserveStringValue = '*'
			ExtraProcessing = @{
				TimeSpent = { $args[0].ToString('hh\:mm') }
			}
		}
		$Body = ConvertTo-FSNames @Splat
	}
	process {
		foreach ($TicketID in $ID) {
			Write-PSFMessage "Creating time entry on ticket $TicketID"
			$Result = Invoke-FSAPI -URISuffix "/tickets/$TicketID/time_entries" -Body $Body -Method Post

			Write-PSFMessage "Created time entry $($Result.time_entry.ID) on ticket $TicketID"
			Write-Output $Result.time_entry
		}
	}
}

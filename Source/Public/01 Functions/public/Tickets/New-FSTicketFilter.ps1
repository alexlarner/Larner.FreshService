function New-FSTicketFilter {
	<#
	.EXTERNALHELP
		https://api.freshservice.com/#filter_tickets
#>

	<#
	This will need all kinds of special processing to allow the user to input logic instead of just fields and convert it to their query language, i.e.
	PWSH: ($AgentID -eq 1) -or (($AgentID -eq 2) and ($Status -eq 3))
	FS API Query: "agent_id:1 OR (agent_id:2 AND status:3)"

	See this for full complexity:
	https://api.freshservice.com/#filter_tickets
	#>
	[CmdletBinding()]
	param
	(
		#ID of the agent to whom the ticket has been assigned
		[long]$AgentId,

		#ID of the group to which the ticket has been assigned
		[long]$GroupId,

		#Priority of the ticket
		[PsfValidateSet(TabCompletion = 'FreshService.PriorityNames')]
		[Priority]$Priority,

		#Status of the ticket
		[PsfValidateSet(TabCompletion = 'FreshService.StatusNames')]
		[Status]$Status,

		#Ticket impact
		[long]$Impact,

		#Ticket urgency
		[PsfValidateSet(TabCompletion = 'FreshService.UrgencyNames')]
		[long]$Urgency,

		#Tag that has been associated to the tickets
		[string]$Tag,

		#Date (YYYY-MM-DD) when the ticket is due to be resolved
		[datetime]$DueBy,

		#Date (YYYY-MM-DD) when the first response is due
		[datetime]$FrDueBy,

		#Ticket creation date (YYYY-MM-DD)
		[datetime]$CreatedAt
	)
}

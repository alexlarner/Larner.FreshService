function Invoke-FSTicketTask {
	[CmdletBinding(SupportsShouldProcess)]
	param (
		[Parameter(Mandatory)]
		[String]$Action,

		[PsObject]$Target,

		[Parameter(Mandatory)]
		[ScriptBlock]$ScriptBlock,

		[Parameter(Mandatory)]
		[long]$ServiceRequestID,

		[Parameter(Mandatory)]
		[long]$TaskID,

		[long]$FSUserID,

		#The alias is there as an alias instead of the parameter name so I don't have to refactor the ArgumentCompleter script to use a parameter name to command names hashtable
		[Alias('TicketStatusOnFail')]
		[PsfValidateSet(TabCompletion = 'FreshService.StatusNames')]
		[string]$Status,

		[switch]$EnableException
	)

	$WrapperParamNames = 'FSUserID', 'ServiceRequestID', 'Status', 'TaskID'
	$WrapperParams = $PSBoundParameters | ConvertTo-PSFHashtable -Include $WrapperParamNames
	$Splat = $PSBoundParameters | ConvertTo-PSFHashtable -Exclude $WrapperParamNames

	Invoke-PSFProtectedCommand @Splat -ErrorEvent {
		New-FSNote -ID $ServiceRequestID -UserID $FSUserID -Body "Failed to: $Action on $Target"
		if ($WrapperParams.ContainsKey('Status')) {
			Update-FSTicket -ID $ServiceRequestID -Status $WrapperParams.Status
		}
	} -Continue

	Update-FSTicketTask -ID $TaskID -TicketID $ServiceRequestID -Status Completed
}
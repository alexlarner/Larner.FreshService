function New-FSTicketTask {
	[CmdletBinding(
		DefaultParameterSetName = 'No Group',
		SupportsShouldProcess
	)]
	param (
		#ID of the ticket to attach the task to.
		[Parameter(Mandatory)]
		[long]$ID,

		#Status of the task, 1-Open, 2-In Progress, 3-Completed
		[PsfValidateSet(TabCompletion = 'FreshService.StatusNames')]
		[string]$Status,

		#Due date of the task
		[datetime]$DueDate,

		[ValidateSet(0,900,1800,2700,3600,7200)]
		#Time in seconds before which notification is sent prior to due date
		[int]$NotifyBefore,

		#Title of the task
		[Parameter(
			Mandatory,
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		[string[]]$Title,

		#Description of the task
		#If this is left blank it will be set to the title, because any updates to the task will error out if the description of the task is blank. Even though tasks by default are created with blank descriptions.
		[string]$Description,

		#Unique ID of the group to assign the task to
        [Parameter(ParameterSetName = 'ID')]
		[long]$GroupID,

		#Name of the group to assign the task to
		[Parameter(ParameterSetName = 'Name')]
		[PsfValidateSet(TabCompletion = 'FreshService.AgentGroupNames')]
		[string]$Group,

		[switch]$EnableException,

		[switch]$PassThru
	)

	begin {
		$ExtraProcessing = @{
			Status  = { $TicketTaskStatuses[$args[0]] }
			DueDate = { $args[0].ToString('o') }
		}

		if ($PSCmdlet.ParameterSetName -eq 'Name') {
			$PSBoundParameters.Remove('Group') | Out-Null
			$PSBoundParameters.GroupID = (Get-FSAgentGroup | Where-Object Name -eq $Group).ID
		}
	}
	process {
		foreach ($TTL in $Title) {
			$PSBoundParameters.Title = $TTL
			if (-Not $PSBoundParameters.ContainsKey('Description')) {
				$PSBoundParameters.Description = $TTL
			}

			$FSNameSplat = @{
				FrontEndParams = $PSBoundParameters
				ExcludeKey = 'ID', 'PassThru', 'EnableException'
				ExtraProcessing = $ExtraProcessing
				PreserveStringValue = '*'
			}

			Invoke-PSFProtectedCommand -Action "Creating $TTL task" -Target "Ticket $ID" -ScriptBlock {
				$Result = Invoke-FSAPI -URISuffix "/tickets/$ID/tasks" -Body (ConvertTo-FSNames @FSNameSplat) -Method 'POST'
			} -Continue

			#Add error variable?
			Write-PSFMessage "Created $TTL task $($Result.Task.ID) on ticket $ID"
			if ($PassThru) { Write-Output $Result.Task }
		}
	}
}

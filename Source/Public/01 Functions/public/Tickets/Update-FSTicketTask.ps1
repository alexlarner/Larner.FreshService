function Update-FSTicketTask {
	[CmdletBinding(
		DefaultParameterSetName = 'NoGroup',
		SupportsShouldProcess
	)]
	param (
		#Unique ID of the task.
		[Parameter(Mandatory)]
		[long]$ID,

		#ID of the ticket to attach the task to.
		[Parameter(Mandatory)]
		[long]$TicketID,

		[PsfValidateSet(TabCompletion = 'FreshService.TaskStatusNames')]
		#Status of the task, 1-Open, 2-In Progress, 3-Completed
		[string]$Status,

		#Due date of the task
		[datetime]$DueDate,

		[ValidateSet(0,900,1800,2700,3600,7200)]
		#Time in seconds before which notification is sent prior to due date
		[int]$NotifyBefore,

		#Title of the task
		[string]$Title,

		#Description of the task
		[string]$Description,

		#Unique ID of the group to assign the task to
        [Parameter(
			Mandatory,
			ParameterSetName = 'ID'
		)]
		[long]$GroupID,

		#Name of the group to assign the task to
		[Parameter(
			Mandatory,
			ParameterSetName = 'Name'
		)]
		[PsfValidateSet(TabCompletion = 'FreshService.AgentGroupNames')]
		[string]$Group,

		[switch]$PassThru,

		[switch]$EnableException
	)
	process {
		Write-PSFMessage 'Defining extra processing'
		$ExtraProcessing = @{
			Status = { $TicketTaskStatuses[$args[0]] }
			DueDate = { $args[0].ToString('o') }
		}

		if ($PSCmdlet.ParameterSetName -eq 'Name') {
			Write-PSFMessage 'Replacing group name with group ID'
			$PSBoundParameters.Remove('Group') | Out-Null
			$PSBoundParameters.GroupID = (Get-FSAgentGroup | Where-Object Name -eq $Group).ID
		}

		Write-PSFMessage 'Creating Invoke-FSAPI splat'
		$Splat = @{
			URISuffix       = "/tickets/$TicketID/tasks/$ID"
			Body            = ConvertTo-FSNames -FrontEndParams $PSBoundParameters -ExcludeKey ID, TicketID, PassThru -ExtraProcessing $ExtraProcessing -PreserveStringValue *
			Method          = 'Put'
			EnableException = $true
		}

		#This will error out if the description of the task is blank. Even though the tasks are created with blank descriptions

		Invoke-PSFProtectedCommand -Action "Update task $ID" -Target "Ticket $TicketID" -ScriptBlock {
			$Task = (Invoke-FSAPI @Splat).Task
			if ($PassThru.IsPresent) { Write-Output $Task }
		} -Continue
	}
}

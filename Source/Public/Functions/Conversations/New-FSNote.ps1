function New-FSNote {
	[CmdletBinding(SupportsShouldProcess)]
	param (
		[Parameter(Mandatory)]
		[Alias('TicketID')]
		[Ticket[]]$ID,

		#Attachments. The total size of all the ticket's attachments (not just this note) cannot exceed 15MB.
		#$Attachments,

		#Content of the note in HTML format
		[Parameter(Mandatory)]
		[string]$Body,

		#Set to true if a particular note should appear as being created from the outside (i.e., not through the web portal). The default value is false
		[switch]$Incoming,

		#Email addresses of agents/users who need to be notified about this note
		[ValidatePattern('^[A-Z0-9+_.-]+@[A-Z0-9.-]+$')]
		[string[]]$NotifyEmails,

		[switch]$Private,

		#ID of the agent/user who is adding the note
		[Alias('Agent')]
		[Parameter(ValueFromPipelineByPropertyName)]
		[Agent]$User,

		[switch]$EnableException
	)

	begin {
		#This is because this is a bool with a default of true on the API. However I have made the default the opposite for this command.
		if ($Private) {
			$PSBoundParameters.Remove('Private') | Out-Null
		} else {
			$PSBoundParameters.Private = $false
		}

		$ConvertSplat = @{
			ExcludeKey = 'ID'
			FrontEndParams = $PSBoundParameters
			PreserveStringValue = '*'
		}

		$Parameters = ConvertTo-FSNames @ConvertSplat
	}

	process {
		foreach ($TicketID in $ID.ID) {
			$Splat = @{
				URISuffix = "/tickets/$TicketID/notes"
				Body      = $Parameters
				Method    = 'Post'
			}

			Invoke-PSFProtectedCommand -Action 'Creating note' -Target "Ticket $TicketID" -ScriptBlock {
				$Result = Invoke-FSAPI @Splat
			} -Continue

			Write-PSFMessage "Created note $($Result.Conversation.ID) on ticket $TicketID for $UserID" -Target $Result.Conversation
			Write-Output ([Conversation]::New($Result.Conversation))
		}
	}
}
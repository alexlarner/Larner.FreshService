function New-FSNote {
	[CmdletBinding(SupportsShouldProcess)]
	param (
		[Parameter(Mandatory)]
		[Alias('TicketID')]
		[long]$ID,

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
		[Alias('AgentID')]
		[long]$UserID,

		[switch]$EnableException,

		[switch]$PassThru
	)

	begin {
		#This is because this is a bool with a default of true on the API. However I have made tye default the opposite for this command.
		if ($Private.IsPresent) {
			$PSBoundParameters.Remove('Private')
		} else {
			$PSBoundParameters.Private = $false
		}
	}

	process {
		foreach ($TicketID in $ID) {
			$PSBoundParameters.Remove('ID') | Out-Null
			$Splat = @{
				URISuffix = "/tickets/$TicketID/notes"
				Body      = ConvertTo-FSNames -FrontEndParams $PSBoundParameters -PreserveStringValue *
				Method    = 'Post'
			}
			Invoke-PSFProtectedCommand -Action 'Creating note' -Target "Ticket $TicketID" -ScriptBlock {
				$Result = Invoke-FSAPI @Splat
			} -Continue

			Write-PSFMessage "Created note $($Result.Conversation.ID) on ticket $TicketID"
			if ($PassThru.IsPresent) { Write-Output $Result.Conversation }
		}
	}
}
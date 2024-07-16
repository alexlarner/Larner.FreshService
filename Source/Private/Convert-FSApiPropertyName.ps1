function Convert-FSApiPropertyName {
	[CmdletBinding()]
    [OutputType([string])]
	param (
		[Parameter(
			Mandatory,
			ValueFromPipeline
		)]
		[string[]]$PropertyName,

        [hashtable]$Override
	)
	begin {
        $Override ??= @{
            responder_id = 'Responder'
			requester_id = 'Requester'
			ticket_id = 'Ticket'
			user_id = 'Agent'
        }
    }
    process {
		foreach ($Name in $PropertyName) {
			if ($Override.ContainsKey($Name)) {
                $Override.$Name
            } else {
                (Get-Culture).TextInfo.ToTitleCase($Name).Replace('_','')
            }
		}
	}
}
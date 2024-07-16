function New-FSClassPropertyList {
	[CmdletBinding()]
    [OutputType([string])]
	param (
		[Parameter(
			Mandatory,
			ValueFromPipeline
		)]
		[PSCustomObject]$Object
	)
	begin {
        $KnownTypes = @{
            active           = 'bool'
            attachments      = 'PSCustomObject[]'
            custom_fields    = 'hashtable'
            due_by           = 'DateTime'
            external_id      = 'string'
            id               = 'long'
            language         = 'System.Globalization.CultureInfo'
            primary_email    = 'System.Net.Mail.MailAddress'
            requester_id     = 'Requester'
            required = 'bool'
            secondary_emails = 'System.Net.Mail.MailAddress[]'
            tags             = 'string[]'
        }
    }
    process {
		$PropertyNames = $Object.PSObject.Properties |
            Where-Object MemberType -eq 'NoteProperty' |
                Where-Object Name -ne 'ID' |
                    Select-Object -ExpandProperty Name |
                        Sort-Object

        foreach ($PropName in $PropertyNames) {
            $Type = if ($KnownTypes.ContainsKey($PropName)) {
                $KnownTypes.$PropName
            } else {
                switch -Regex ($PropName) {
                    '_at$' { 'DateTime'; Break }
                    '^can_' { 'bool'; Break }
                    'emails$' { 'System.Net.Mail.MailAddress[]'; Break }
                    '_id$' { 'Nullable[long]'; Break }
                    '_ids$' { 'long[]'; Break }
                    '^is_' { 'bool'; Break }
                    'phone_numbers$' { 'string[]'; Break }
                    '^required_for' { 'bool'; Break }
                    default { 'string'; Break }
                }
            }

            $PSName = Convert-FSApiPropertyName -PropertyName $PropName
            
            Write-Output "[$Type]`$$PSName"
        }
	}
}
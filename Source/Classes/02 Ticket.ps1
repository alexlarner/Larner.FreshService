class Ticket : FreshService {
    [string]$AppliedBusinessHours
    [PSCustomObject[]]$Attachments
    [System.Net.Mail.MailAddress[]]$BccEmails
    [string]$Category
    [System.Net.Mail.MailAddress[]]$CcEmails
    [DateTime]$CreatedAt
    [string]$CreatedWithinBusinessHours
    [hashtable]$CustomFields
    [string]$Deleted
    [Nullable[long]]$DepartmentId
    [string]$Description
    [string]$DescriptionText
    [DateTime]$DueBy
    [Nullable[long]]$EmailConfigId
    [string]$FrDueBy
    [string]$FrEscalated
    [System.Net.Mail.MailAddress[]]$FwdEmails
    [Nullable[long]]$GroupId
    [string]$Impact
    [bool]$IsEscalated
    [string]$ItemCategory
    [string]$Priority
    [System.Net.Mail.MailAddress[]]$ReplyCcEmails
    [Nullable[long]]$RequestedForId
    [Requester]$Requester
    [Agent]$Responder
    [Nullable[long]]$SlaPolicyId
    [string]$Source
    [string]$Spam
    [string]$Status
    [string]$SubCategory
    [string]$Subject
    [System.Net.Mail.MailAddress[]]$ToEmails
    [string]$Type
    [DateTime]$UpdatedAt
    [string]$Urgency

    Ticket ([PSCustomObject]$RawData) : base ([PSCustomObject]$RawData) {}

    Ticket ([long]$ID) : base ([long]$ID) {}

    [void] UpdateProperties () {
        Write-PSFMessage -FunctionName 'Ticket.UpdateProperties' -Level System -Message 'Updating ticket properties' -Target $this
        $Object = Get-FSTicket -ID $this.ID
        $Object.PSObject.Properties.Name | ForEach-Object { $This.$_ = $Object.$_ }
    }

    [string] ToString () {
        return $This.ID, $This.Subject -join ': '
    }
}

Update-TypeData -TypeName Ticket -DefaultDisplayPropertySet ID, Subject, Requester, Responder

class Conversation : FreshService {
    [PSCustomObject[]]$Attachments
    [string]$Body
    [string]$BodyText
    [DateTime]$CreatedAt
    [bool]$Incoming
    [bool]$Private
    [ConversationSource]$Source
    [System.Net.Mail.MailAddress]$SupportEmail
    [Ticket]$Ticket
    [System.Net.Mail.MailAddress[]]$ToEmails
    [DateTime]$UpdatedAt
    [Agent]$Agent

    Conversation ([PSCustomObject]$RawData) : base ([PSCustomObject]$RawData) {}

    Conversation ([long]$ID) : base ([long]$ID) {}

    [string] ToString () {
        return ($this.ID,$this.BodyText -join '; ')
    }
}

Update-TypeData -TypeName Conversation -DefaultDisplayPropertySet ID, Agent, BodyText, PrimaryEmail

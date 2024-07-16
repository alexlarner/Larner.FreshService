class TicketField : FreshService {
    [bool]$BelongsToSection
    [TicketFieldChoice[]]$Choices
    [DateTime]$CreatedAt
    [bool]$CustomersCanEdit
    [bool]$DefaultField
    [string]$Description
    [bool]$DisplayedToCustomers
    [string]$FieldType
    [string]$Label
    [string]$LabelForCustomers
    [string]$Name
    [TicketField[]]$NestedFields
    [bool]$PortalCc
    [string]$PortalccTo
    [int]$Position
    [bool]$RequiredForAgents
    [bool]$RequiredForClosure
    [bool]$RequiredForCustomers
    [array]$Sections
    [DateTime]$UpdatedAt

    TicketField ([PSCustomObject]$RawData) : base ([PSCustomObject]$RawData) {
        if ($this.Choices) {
            $this.choices | ForEach-Object {
                $_.TicketField = $this #Might be an infinite recursion
            }
        }
    }

    [string] ToString() {
        return $this.LabelForCustomers
    }
}
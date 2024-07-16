<#
This one (Ticket Field Choice) is tricky and will probably need multiple subclasses
All choices have a ID & value property and some have some of these properties:
display_id
nested_options
requester_display_value

The primary reason for creating this class would be for easy conversion between id & name (value) for the functions that use the tickets fields as inputs, i.e. these fields:
Impact
Priority
Source
Status
Subcategory
Type
Urgency
#>
class TicketFieldChoice : FreshService {
    [string]$Value
    $TicketField #This should only ever be a TicketField type object, but it cannot be named so because the TicketField type requires this type (TicketFieldChoice)

    TicketFieldChoice ([PSCustomObject]$RawData) : base ([PSCustomObject]$RawData) {}

    TicketFieldChoice ([TicketField]$TicketField, [PSCustomObject]$RawData) : base ([PSCustomObject]$RawData) {
        $this.TicketField = $TicketField
    }

    TicketFieldChoice ([string]$TicketField, [string]$TicketChoiceValue) {
        Get-FSTicketFieldChoiceID -Field $TicketField -Choice $TicketChoiceValue
    }

    [string] ToString () {
        return $This.Value
    }
}
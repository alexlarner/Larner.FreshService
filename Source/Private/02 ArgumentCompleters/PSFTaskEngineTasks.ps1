Register-PSFTaskEngineTask -Name TicketFieldValuesRefresh -Interval (New-TimeSpan -Hours 1) -ScriptBlock {
    Set-PSFTaskEngineCache -Module FreshService -Name TicketFieldValues -Value (Invoke-FSAPI -URISuffix '/ticket_form_fields').ticket_fields
}

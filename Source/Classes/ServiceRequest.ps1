class ServiceRequest : Ticket {
    [int]$ApprovalStatus
    [string]$ApprovalStatusName

    ServiceRequest ([PSCustomObject]$RawData) : base ([PSCustomObject]$RawData) {}

    ServiceRequest ([long]$ID) : base ([long]$ID) {}
}

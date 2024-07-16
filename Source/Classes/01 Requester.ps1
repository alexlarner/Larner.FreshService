class Requester : FreshService {
    [bool]$Active
    [string]$Address
    [string]$BackgroundInformation
    [bool]$CanSeeAllChangesFromAssociatedDepartments
    [bool]$CanSeeAllTicketsFromAssociatedDepartments
    [DateTime]$CreatedAt
    [PSCustomObject]$CustomFields
    [long[]]$DepartmentIds
    [string]$DepartmentNames
    [string]$ExternalId
    [string]$FirstName
    [bool]$HasLoggedIn
    [bool]$IsAgent
    [string]$JobTitle
    [System.Globalization.CultureInfo]$Language
    [string]$LastName
    [Nullable[long]]$LocationId
    [string]$LocationName
    [string]$MobilePhoneNumber
    [System.Net.Mail.MailAddress]$PrimaryEmail
    [Nullable[long]]$ReportingManagerId
    [System.Net.Mail.MailAddress[]]$SecondaryEmails
    [string]$TimeFormat
    [string]$TimeZone
    [DateTime]$UpdatedAt
    [bool]$VipUser
    [string]$WorkPhoneNumber

    Requester ([PSCustomObject]$RawData) : base ([PSCustomObject]$RawData) {}

    Requester ([long]$ID) : base ([long]$ID) {}

    Requester ([string]$Email) {
        $Object = Get-FSRequester -Email $Email
        $Object.PSObject.Properties.Name | ForEach-Object { $This.$_ = $Object.$_ }
    }

    [void] UpdateProperties () {
        Write-PSFMessage -FunctionName 'Requester.UpdateProperties' -Level System -Message 'Updating requester properties' -Target $this
        $Object = Get-FSRequester -ID $this.ID
        $Object.PSObject.Properties.Name | ForEach-Object { $This.$_ = $Object.$_ }
    }

    [string] ToString () {
        return $This.FirstName, $This.LastName, "($($This.ID))" -join ' '
    }
}

Update-TypeData -TypeName Requester -DefaultDisplayPropertySet ID, FirstName, LastName, PrimaryEmail

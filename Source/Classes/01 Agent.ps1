class Agent : FreshService {
    [bool]$Active
    [string]$Address
    [DateTime]$AutoAssignStatusChangedAt
    [bool]$AutoAssignTickets
    [string]$BackgroundInformation
    [bool]$CanSeeAllTicketsFromAssociatedDepartments
    [DateTime]$CreatedAt
    [hashtable]$CustomFields
    [long[]]$DepartmentIds
    [string[]]$DepartmentNames
    [string]$Email
    [string]$ExternalId
    [string]$FirstName
    [long[]]$GroupIds
    [bool]$HasLoggedIn
    [string]$JobTitle
    [System.Globalization.CultureInfo]$Language
    [DateTime]$LastActiveAt
    [DateTime]$LastLoginAt
    [string]$LastName
    [Nullable[long]]$LocationId
    [string]$LocationName
    [long[]]$MemberOf
    [long[]]$MemberOfPendingApproval
    [string]$MobilePhoneNumber
    [string]$Name
    [long[]]$ObserverOf
    [long[]]$ObserverOfPendingApproval
    [bool]$Occasional
    [Nullable[long]]$ReportingManagerId
    [long[]]$RoleIds
    [PSCustomObject[]]$Roles
    [string]$Scopes
    [Nullable[int]]$ScoreboardLevelId
    [int]$ScoreboardPoints
    [string]$Signature
    [string]$TimeFormat
    [string]$TimeZone
    [DateTime]$UpdatedAt
    [bool]$VipUser
    [string]$WorkPhoneNumber

    Agent ([long]$ID) : base ([long]$ID) {}

    Agent ([PSCustomObject]$RawData) : base ([PSCustomObject]$RawData) {
        #$this.ToolTip = $This.FirstName, $This.LastName -join ' '
        $this.Name = $This.FirstName, $This.LastName | Where-Object { $null -ne $_ } | Join-String -Separator ' '
    }

    Agent ([string]$Email) {
        $Object = Get-FSAgent -Email $Email
        $Object.PSObject.Properties.Name | ForEach-Object { $This.$_ = $Object.$_ }
    }

    [void] UpdateProperties () {
        Write-PSFMessage -FunctionName 'Agent.UpdateProperties' -Level System -Message 'Updating Agent properties' -Target $this
        $Object = Get-FSAgent -ID $this.ID
        $Object.PSObject.Properties.Name | ForEach-Object { $This.$_ = $Object.$_ }
    }

    [string] ToString () {
        return ($This.FirstName, $This.LastName, "($($This.ID))" | Where-Object { $null -ne $_  } | Join-String -Separator ' ')
    }
}

Update-TypeData -TypeName Agent -DefaultDisplayPropertySet ID, FirstName, LastName, Email

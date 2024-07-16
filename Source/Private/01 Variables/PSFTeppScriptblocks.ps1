$TeppScriptblocks = @{
    #Agents = { Get-FSAgent | Select-PSFObject 'ID as Text', 'Name as Tooltip' }
    Agents = {
        param ($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
        Write-PSFMessage "Getting agent argument completers"
        Get-FSAgent |
            Where-Object Name -like "$wordToComplete*" |
                ForEach-Object {
                    [System.Management.Automation.CompletionResult]::New($_.ID, $_.Name, 'ParameterValue', $_.ToString())
                }
    }
    AgentGroupNames = { (Get-FSAgentGroup).Name }
    CategoryNames = { Get-FSTicketCategories }
    ClassNames = {
            Get-ChildItem "$env:USERPROFILE\OneDrive\Documents\FreshService\Source\Classes" -Exclude 'To Be Created' |
                Get-ChildItem -Filter *.ps1 -Recurse |
                    Select-Object -ExpandProperty BaseName |
                        ForEach-Object { $_.Split(' ')[-1] }
    }
    DepartmentNames = { (Get-FSDepartment).Name }
    ImpactNames = { Get-FSTicketImpacts }
    PriorityNames = { Get-FSTicketPriorities }
    ServiceCategoryNames = { (Get-FSAllServiceCategories).Name }
    ServiceItemNames = { (Get-FSServiceItem).Name }
    SourceNames = { Get-FSTicketSources }
    StatusNames = { Get-FSTicketStatuses }
    SubcategoryNames = {
        param ($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
        Write-PSFMessage "Getting ticket subcategory argument completers"
        if (
            $fakeBoundParameters.ContainsKey('ID') -and
            (-Not ($fakeBoundParameters.ContainsKey('Category')))
        ) {
            $Category = (Get-FSTicket -ID $fakeBoundParameters.ID).Category
        } elseif ($fakeBoundParameters.ContainsKey('Category')) {
            $Category = $fakeBoundParameters['Category']
        }
        if ($Category) {
            Get-FSTicketSubCategories -Category $Category |
                Where-Object { $_ -like "$wordToComplete*" } |
                    ForEach-Object {
                        if ($_.Contains(' ') -or $_.Contains('(')) { "'$_'" } else { $_ }
                    }
        } else { Get-FSTicketCategories | Get-FSTicketSubCategories }
    }
    TaskStatusNames = {
        $Module = Get-Module FreshService
        & $Module { $script:TicketTaskStatuses.Keys }
    }
    Tickets = {
        param ($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
        Write-PSFMessage "Getting ticket argument completers"
        $Agent = Get-FSAgent -Email "$env:USERNAME@$env:USERDNSDOMAIN"

        if ($Agent) {
            Get-FSTicketFromQuery -Query "agent_id:$($Agent.ID)" -ExcludeClosedResolvedTickets |
                Where-Object Subject -like "$wordToComplete*" |
                    ForEach-Object {
                        [System.Management.Automation.CompletionResult]::New($_.ID, $_.Subject, 'ParameterValue', $_.ToString())
                    }
        }
    }
    TicketFieldsWithChoices = { (Get-FSAllTicketFields | Where-Object Choices).Label }
    TicketTypeNames = { Get-FSTicketTypes }
    TicketTypeNamesAlt = { @(Get-FSTicketTypes) + 'Alert' }
    UrgencyNames = { Get-FSTicketUrgencies }
}

$CacheIntervals = {
    Agents = '1h'
}


foreach ($TeppBlock in $TeppScriptblocks.GetEnumerator()) {
    $Splat = @{
        Name        = "FreshService.$($_.Key)"
        ScriptBlock = $TeppBlock.Value
        Global      = $true
        <#
        The Global flag enables the PsfValidateSet TabCompletion named scriptblock to work properly.
        The documentation for that parameter says:
        This parameter is needed to reliably execute in background runspaces, but means no direct access to module content.
        #>
    }

    if ($CacheIntervals.ContainsKey($TeppBlock.Key)) {
        $Splat.CacheDuration = $CacheIntervals.($TeppBlock.Key)
    }

    Register-PSFTeppScriptblock @Splat
}
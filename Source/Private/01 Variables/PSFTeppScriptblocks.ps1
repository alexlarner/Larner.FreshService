$TeppScriptblocks = @{
    AgentGroupNames = { (Get-FSAgentGroup).Name }
    CategoryNames = { Get-FSTicketCategories }
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
    TicketFieldsWithChoices = { (Get-FSAllTicketFields | Where-Object Choices -NE $null).Label }
    TicketTypeNames = { Get-FSTicketTypes }
    TicketTypeNamesAlt = { @(Get-FSTicketTypes) + 'Alert' }
    UrgencyNames = { Get-FSTicketUrgencies }
}


$TeppScriptblocks.GetEnumerator() | ForEach-Object {
    Register-PSFTeppScriptblock -Name "FreshService.$($_.Key)" -ScriptBlock $_.Value -Global
    <#
    The Global flag enables the PsfValidateSet TabCompletion named scriptblock to work properly.
    The documentation for that parameter says:
    This parameter is needed to reliably execute in background runspaces, but means no direct access to module content.
    #>
}
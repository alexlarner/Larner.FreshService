@{

# Script module or binary module file associated with this manifest.
RootModule = '.\FreshService.psm1'

# Version number of this module.
ModuleVersion = '2.2.0'

# Supported PSEditions
CompatiblePSEditions = 'Core'

# ID used to uniquely identify this module
GUID = '51b9ba15-ecda-4cd5-93b4-690b463ccdc4'

# Author of this module
Author = 'Alexander Larner'

# Company or vendor of this module
# CompanyName = ''

# Copyright statement for this module
# Copyright = ''

# Description of the functionality provided by this module
Description = 'Provides a PowerShell wrapper to the FreshService API'

# Minimum version of the PowerShell engine required by this module
PowerShellVersion = '7.2.0'

# Name of the PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# ClrVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @('CompanyName.Utility', 'ActiveDirectory', 'PSFramework')

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @(
	'Connect-FSAPI',
	'Get-FSAgent',
	'Get-FSAgentGroup',
	'Get-FSAllAssets',
	'Get-FSAllDepartmentFields',
	'Get-FSAllServiceCategories',
	'Get-FSAllTicketFields',
	'Get-FSAllTickets',
	'Get-APIErrorMessage',
	'Get-FSDepartment',
	'Get-FSRequester',
	'Get-FSServiceItem',
	'Get-FSServiceRequestItems',
	'Get-FSTicket',
	'Get-FSTicketActivities',
	'Get-FSTicketCategories',
	'Get-FSTicketConversation',
	'Get-FSTicketFieldChoiceID',
	'Get-FSTicketFieldValues',
	'Get-FSTicketFromQuery',
	'Get-FSTicketImpacts',
	'Get-FSTicketPriorities',
	'Get-FSTicketSources',
	'Get-FSTicketStatuses',
	'Get-FSTicketSubCategories',
	'Get-FSTicketTask',
	'Get-FSTicketTaskStatus',
	'Get-FSTicketTypes',
	'Get-FSTicketUrgencies',
	'Get-FSTimeEntry',
	'Get-ObjectsFromJsonInText',
	'Get-StringsFromFSTicketDescription',
	'Invoke-FSAPI',
	'Invoke-FSTicketTask',
	'New-FSChildTicket',
	'New-FSDepartment',
	'New-FSNote',
	'New-FSServiceRequest',
	'New-FSTicket',
	'New-FSTicketDescription',
	'New-FSTicketFilter',
	'New-FSTicketForUnreportedIssues',
	'New-FSTicketTagQuery',
	'New-FSTicketTask',
	'New-FSTimeEntry',
	'New-FSUserCreationRequest',
	'New-FSUserDeletionRequest',
	'Remove-FSConversation',
	'Remove-FSDepartment',
	'Remove-FSTicket',
	'Remove-FSTicketAttachment',
	'Remove-FSTicketTask',
	'Remove-ReportedIssues',
	'Remove-RequestedServiceItems',
	'Restore-FSTicket',
	'Select-UniquePropertyValuePairs',
	'Update-FSDepartment',
	'Update-FSTicket',
	'Update-FSTicketTask'
)

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        # Tags = @()

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        # ProjectUri = ''

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = @'
1.0.1 - 12/15/2021 - Added workaround to FreshService API ticket query bug, to pull all matching tickets instead of first 100
1.0.2 - 01/12/2022 - Added class and functions for Agent Groups.
						Updated New-FSTicketTask to accept Agent Group names.
						Created Update-FSTicketTask.
2.0.0 - 03/09/2022 - Reformatted module to put functions, classes, and main variables into their own files
'@

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}


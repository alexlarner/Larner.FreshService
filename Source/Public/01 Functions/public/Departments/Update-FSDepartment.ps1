function Update-FSDepartment {
	#Needs to be tested
	[CmdletBinding()]
	param (
		#Unique identifier of the department
		[long]$ID,

		#Name of the department
		[Parameter(
			Mandatory,
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		[PsfValidateSet(TabCompletion = 'FreshService.DepartmentNames')]
		[string[]]$Name,

		#Description about the department
		[string]$Description,

		#Unique identifier of the agent or requester who serves as the head of the department
		[long]$HeadUserID,

		#Unique identifier of the agent or requester who serves as the prime user of the department
		[long]$PrimeUserID,

		#Email domains associated with the department
		[string[]]$Domains,

		#Custom fields that are associated with departments
		[hashtable]$CustomFields,

		#Timestamp at which the department was created
		[datetime]$CreatedAt,

		#Timestamp at which the department was last modified
		[datetime]$UpdatedAt
	)
	begin { $URISuffix = '/departments' }
	process {
		foreach ($N in $Name) {

			if ($ID) {
				$URISuffix = $URISuffix + "/$ID"
				$PSBoundParameters.Remove('ID') | Out-Null
			}

			$PSBoundParameters.Name = $N

			$Body = ConvertTo-FSNames -FrontEndParams $PSBoundParameters -PreserveStringValue *

			Write-Output (Invoke-FSAPI -URISuffix $URISuffix -Body $Body -Method Put).Department
		}
	}
}

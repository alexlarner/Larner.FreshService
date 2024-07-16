function New-FSDepartment {
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

	process {
		foreach ($N in $Name) {
			$PSBoundParameters.Name = $N

			$Body = ConvertTo-FSNames -FrontEndParams $PSBoundParameters -PreserveStringValue *

			Write-Output (Invoke-FSAPI -URISuffix '/departments' -Body $Body -Method Post).Department
		}
	}
}

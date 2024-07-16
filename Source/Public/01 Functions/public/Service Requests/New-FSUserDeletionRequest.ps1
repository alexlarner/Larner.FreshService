function New-FSUserDeletionRequest {
	[CmdletBinding()]
	param (
		[Parameter(
			Mandatory,
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		[Microsoft.ActiveDirectory.Management.ADUser]$User,

		[Parameter(Mandatory)]
		[datetime]$DeleteDate
	)

	begin {
		$ServiceItemDisplayID = 68
		$MandatoryProps = 'EmployeeID', 'Title', 'EmailAddress'
	}
	process {
		foreach ($ADUser in $User) {
			$UserProps = $ADUser.PSObject.Properties.Name

			Write-PSFMessage "Checking user object $($ADUser.SamAccountName) for mandatory properties"
			foreach ($Prop in $MandatoryProps) {
				if ($Prop -notin $UserProps) {
					Write-PSFMessage "User object $($ADUser.SamAccountName) did not contain a $Prop property, re-getting user"
					$ADUser = Get-ADUser -Identity $ADUser.SamAccountName -Properties $MandatoryProps
					Break
				}
			}

			Write-PSFMessage -Level Debug -Message 'Setting custom field values for the service request'
			$CustomFields = @{
				employee_name = $ADUser.Name
				employee_id   = $ADUser.EmployeeID
				job_title     = $ADUser.Title
				delete_date   = $DeleteDate.ToString('yyyy-MM-dd')
			}

			$SRSplat = @{
				RequestedFor = $ADUser.EmailAddress
				Email        = $ADUser.EmailAddress
				DisplayID = $ServiceItemDisplayID
				Quantity        = 1
				CustomFields   = $CustomFields
			}

			Write-PSFMessage "Creating new user deletion request for $($SRSplat.CustomFields.employee_name) ($($SRSplat.CustomFields.employee_id)) on $($SRSplat.CustomFields.delete_date)"
			New-FSServiceRequest @SRSplat
		}
	}
}

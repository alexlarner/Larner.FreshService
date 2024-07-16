function Select-UniquePropertyValuePairs {
	<#
	.SYNOPSIS
		Filters out the property value pairs on one object that exist on another object
	.DESCRIPTION
		Get all the note property names from the new & existing objects except the property specified in the preserve property value
		 Foreach property in the new object
		 	If the property exists on the existing objects
		 		Get the existing objects that have the property
		 		If the new object property value is not in the existing object property values
		 			Add the property name and new object property value to a hashtable of unique property value pairs
		 	Else add the property name and new object property value to a hashtable of unique property value pairs
		 If there's anything in the unique property value pairs hashtable
		 	Add the preserve property and the new object's property value to the unique property value pairs hashtable
		 	Output the unique property value pairs hashtable as a PSCustomObject
	.EXAMPLE
		PS C:\> $New

		Name : Bob
		a    : 1
		b    : 2
		c    : 3
		d    : 4

		PS C:\> $Existing | fl

		Name : Bob
		a    : 1

		Name : Bob
		b    : 22

		Name : Bob
		c    : 3
		e    : 55

		PS C:\> Select-UniquePropertyValuePairs -NewObject $New -ExistingObjects $Existing -PreserveProperty Name

		b d Name
		- - ----
		2 4 Bob
	.EXAMPLE
		PS C:\> Select-UniquePropertyValuePairs -NewObject $BadWorkdayValues -ExistingObjects ($AlreadyReportedBadWorkdayValues | Where-Object EmployeeID -EQ $_.EmployeeID) -PreserveProperty EmployeeID
	.INPUTS
		PSCustomObject, String
	.NOTES
	#>
	[CmdletBinding()]
	[OutputType([PSCustomObject])]
	param (
		[Parameter(Mandatory)]
		#The object to be filtered
		[PSCustomObject]$NewObject,

		[Parameter(Mandatory)]
		#The objects to filter the new object with
		[PSCustomObject[]]$ExistingObjects,

		[Parameter(Mandatory)]
		#The property to not filter out and to preserve the new object's value of. Generally, the foreign key property that links the two objects together.
		[string]$PreserveProperty
	)
	$NewObjectProps = ($NewObject.PSObject.Properties | Where-Object MemberType -EQ NoteProperty | Where-Object Name -NE $PreserveProperty).Name
	$ExistingObjectsProps = $ExistingObjects | ForEach-Object { $_.PSObject.Properties | Where-Object MemberType -EQ NoteProperty | Where-Object Name -NE $PreserveProperty } | Select-Object -ExpandProperty Name -Unique

	$UniquePropPairs = @{}

	foreach ($Property in $NewObjectProps) {
		if ($Property -in $ExistingObjectsProps) {
			$ExistingObjectsWithProp = $ExistingObjects | Where-Object { ($_.PSObject.Properties | Where-Object MemberType -EQ NoteProperty).Name -Contains $Property }
			if ($NewObject.$Property -notin $ExistingObjectsWithProp.$Property) {
				$UniquePropPairs.Add($Property, $NewObject.$Property)
			}
		} else {
			$UniquePropPairs.Add($Property, $NewObject.$Property)
		}
	}
	if ($UniquePropPairs.Count -gt 0) {
		$UniquePropPairs.Add($PreserveProperty, $NewObject.$PreserveProperty)
		[PSCustomObject]$UniquePropPairs
	}
}

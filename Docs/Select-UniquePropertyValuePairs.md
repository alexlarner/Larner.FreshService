---
external help file: Larner.FreshService-help.xml
Module Name: Larner.FreshService
online version: https://api.freshservice.com/#delete_a_ticket_attachment
schema: 2.0.0
---

# Select-UniquePropertyValuePairs

## SYNOPSIS

Filters out the property value pairs on one object that exist on another object

## SYNTAX

```text
Select-UniquePropertyValuePairs [-NewObject] <PSObject> [-ExistingObjects] <PSObject[]>
 [-PreserveProperty] <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION

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

## EXAMPLES

### Example 1

```PowerShell
$New
```

Name : Bob
a    : 1
b    : 2
c    : 3
d    : 4

PS C:\\\> $Existing | fl

Name : Bob
a    : 1

Name : Bob
b    : 22

Name : Bob
c    : 3
e    : 55

PS C:\\\> Select-UniquePropertyValuePairs -NewObject $New -ExistingObjects $Existing -PreserveProperty Name

b d Name
- - ----
2 4 Bob

### Example 2

```PowerShell
Select-UniquePropertyValuePairs -NewObject $BadWorkdayValues -ExistingObjects ($AlreadyReportedBadWorkdayValues | Where-Object EmployeeID -EQ $_.EmployeeID) -PreserveProperty EmployeeID
```

## PARAMETERS

### -NewObject

The object to be filtered

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExistingObjects

The objects to filter the new object with

```yaml
Type: PSObject[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PreserveProperty

The property to not filter out and to preserve the new object's value of.
Generally, the foreign key property that links the two objects together.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction

{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### PSCustomObject, String

## OUTPUTS

### System.Management.Automation.PSObject

## NOTES

## RELATED LINKS

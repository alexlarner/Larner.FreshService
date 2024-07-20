---
external help file: Larner.FreshService-help.xml
Module Name: Larner.FreshService
online version: https://api.freshservice.com/#create_service_request
schema: 2.0.0
---

# New-FSTicketDescription

## SYNOPSIS

Creates a new FreshService ticket for the issues that occur in the Workday Import script.

## SYNTAX

```text
New-FSTicketDescription [-Summary] <String> [-Objects] <PSObject[]> [-PropertyToSortOn] <String[]>
 [-DifferentProperties] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION

Writes a warning using string given in the Summary parameter
If the MakeDescription parameter set was used
	Convert the objects given into an HTML table fragment
		Prepended with the Summary
		Appended with the Objects as a compressed JSON
		If the DifferentProperties switch was used
			Set the unique property names from all the objects as the HTML table headers
Create a FreshService ticket with
	Category of the Category parameter
	Subcategory of the Subcategory parameter
	Subject of the Summary parameter
	Description of the Description parameter
	Tag of the Tag parameter and 'Workday Export Script'
	Email of 'WorkdayImport@CompanyName.com'
	Impact & Urgency of Low
Write a warning and log entry with the new ticket ID and summary

## EXAMPLES

### Example 1

```PowerShell
$FailedADUpdatesTicketSplat = @{
	Summary             = "Failed to update $($NewFailedADUpdates.Count) AD users"
	PropertyToSortOn    = 'SAMAccountName'
	Objects             = $NewFailedADUpdates
	DifferentProperties = $true
}
PS C:\> New-FSWorkdayImportTicket @FailedADUpdatesTicketSplat
```

## PARAMETERS

### -Summary

The summary of the issue to go above the HTML table and JSON of the ticket objects

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Objects

The items to include

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

### -PropertyToSortOn

The property to sort the objects on in the description

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DifferentProperties

Use this if the objects do not all have the same properties.
If this switch is used it will set the unique property names from all the objects as the HTML table headers in the description.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
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

### String, PSCustomObject

## OUTPUTS

### None

## NOTES

## RELATED LINKS

---
external help file: Larner.FreshService-help.xml
Module Name: Larner.FreshService
online version: https://api.freshservice.com/#delete_a_ticket_attachment
schema: 2.0.0
---

# Remove-RequestedServiceItems

## SYNOPSIS

Filters out the objects that are in open tickets matching the same tag

## SYNTAX

```text
Remove-RequestedServiceItems [-Objects] <PSObject[]> [-ForeignKey] <String> [-MatchOnForeignKeyOnly]
 [-Tag] <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION

Get all the open tickets for the given tag
Get the objects in those tickets (using Get-ObjectsFromJsonInText)
Filters out the property value pairs that already exist in the objects in the open tickets (using Select-UniquePropertyValuePairs)

## EXAMPLES

### Example 1

```PowerShell
Remove-ReportedIssues -Objects $FailedADUpdates -ForeignKey SAMAccountName -Tag 'Failed AD Update'
```

## PARAMETERS

### -Objects

The objects to filter

```yaml
Type: PSObject[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForeignKey

The property that links the given objects and the objects from the tickets together.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MatchOnForeignKeyOnly

If you want the matching of the new issues to only match on the foreign key and not all of the object's properties.

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

### -Tag

The tag to search for open tickets for.

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

## OUTPUTS

### System.Management.Automation.PSObject

## NOTES

## RELATED LINKS

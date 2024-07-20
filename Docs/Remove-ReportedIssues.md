---
external help file: Larner.FreshService-help.xml
Module Name: Larner.FreshService
online version: https://api.freshservice.com/#delete_a_ticket_attachment
schema: 2.0.0
---

# Remove-ReportedIssues

## SYNOPSIS

Filters out the objects that are in open tickets matching the same tag

## SYNTAX

### Objects (Default)

```text
Remove-ReportedIssues -Objects <PSObject[]> -ForeignKey <String> [-MatchOnForeignKeyOnly] -Tag <String>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Strings

```text
Remove-ReportedIssues -Strings <String[]> -Regex <Regex> [-Delimiter <String>] -Tag <String>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
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

### -Strings

The objects to filter

```yaml
Type: String[]
Parameter Sets: Strings
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Regex

The regex to parse the strings with.
There must only be two capture groups.

```yaml
Type: Regex
Parameter Sets: Strings
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Delimiter

The delimiter to split the regex matches with

```yaml
Type: String
Parameter Sets: Strings
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Objects

The objects to filter

```yaml
Type: PSObject[]
Parameter Sets: Objects
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForeignKey

The property that links the given objects and the objects from the tickets together.

```yaml
Type: String
Parameter Sets: Objects
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MatchOnForeignKeyOnly

If you want the matching of the new issues to only match on the foreign key and not all of the object's properties.
If this is not used, but the Objects parameter set is used, the objects for any new tickets will only have the foreign key property and any properties that have changed for that object since it was last reported.

```yaml
Type: SwitchParameter
Parameter Sets: Objects
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
Position: Named
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

### String, Regex, PSCustomObject

## OUTPUTS

### System.Management.Automation.PSObject

### System.String

## NOTES

## RELATED LINKS

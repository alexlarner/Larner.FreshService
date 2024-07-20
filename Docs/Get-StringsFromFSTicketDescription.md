---
external help file: Larner.FreshService-help.xml
Module Name: Larner.FreshService
online version: https://api.freshservice.com/#get_ticket_activities
schema: 2.0.0
---

# Get-StringsFromFSTicketDescription

## SYNOPSIS

Parses out a list of strings from a string

## SYNTAX

```text
Get-StringsFromFSTicketDescription [-Text] <String[]> [-Regex] <Regex> [[-Delimiter] <String>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION

Finds a string inside a string using Regex and splits it if a delimiter is given.
Writes a warning and a log message if no regex matches are found in the given text.

## EXAMPLES

### Example 1

```PowerShell
Get-ObjectsFromJsonInText -Text 'Failed to disable the AD Account of alarner' -Text 'Failed to disable the AD Account of (.+)$'
alarner
```

### Example 2

```PowerShell
Get-ObjectsFromJsonInText -Text 'Failed to disable the AD Account of alarner, alarner-test' -Text 'Failed to disable the AD Account of (.+)$' -Delimiter ', '
alarner
alarner-test
```

## PARAMETERS

### -Text

The text to parse the strings from

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Regex

The regex to parse the strings with.
There must only be two capture groups.

```yaml
Type: Regex
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Delimiter

The delimiter to split the regex matches with

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
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

### String, Regex

## OUTPUTS

### System.String

## NOTES

## RELATED LINKS

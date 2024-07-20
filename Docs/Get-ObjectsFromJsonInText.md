---
external help file: Larner.FreshService-help.xml
Module Name: Larner.FreshService
online version: https://api.freshservice.com/#get_ticket_activities
schema: 2.0.0
---

# Get-ObjectsFromJsonInText

## SYNOPSIS

Parses out PSCustomObjects from a JSON in a string

## SYNTAX

```text
Get-ObjectsFromJsonInText [-Text] <String[]> [[-Regex] <Regex>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION

Finds a JSON inside a string using Regex and converts it into PSCustomObjects.
Writes a warning and a log message if no regex matches are found in the given text.

## EXAMPLES

### Example 1

```PowerShell
Get-ObjectsFromJsonInText -Text '<p>Raw JSON Data: {"EmployeeID":123456,"ADUsers":"ALarner, ALarnerAdmin"}</p><p>Extra stuff here</p>'
```

EmployeeID ADUsers
---------- -------
         123456 ALarner, ALarnerAdmin

## PARAMETERS

### -Text

The text to parse the JSON objects from

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

The regex to parse out the JSON from the text.
There must only be two capture groups.

```yaml
Type: Regex
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Raw JSON Data: ([\{|\[].+[\}|\]])
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

### System.Management.Automation.PSObject

## NOTES

## RELATED LINKS

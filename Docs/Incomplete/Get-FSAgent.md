---
external help file: Larner.FreshService-help.xml
Module Name: Larner.FreshService
online version: https://api.freshservice.com/#view_an_agent
schema: 2.0.0
---

# Get-FSAgent

## SYNOPSIS

## SYNTAX

### All (Default)

```text
Get-FSAgent [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### ID

```text
Get-FSAgent -ID <Int64[]> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Filtered

```text
Get-FSAgent [-Email <String[]>] [-MobilePhoneNumber <String>] [-WorkPhoneNumber <String>] [-Active <Boolean>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Filtered by State

```text
Get-FSAgent -State <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION

{{ Fill in the Description }}

## EXAMPLES

### Example 1

```PowerShell

```

## PARAMETERS

### -ID

{{ Fill ID Description }}

```yaml
Type: Int64[]
Parameter Sets: ID
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Email

{{ Fill Email Description }}

```yaml
Type: String[]
Parameter Sets: Filtered
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -MobilePhoneNumber

{{ Fill MobilePhoneNumber Description }}

```yaml
Type: String
Parameter Sets: Filtered
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -WorkPhoneNumber

{{ Fill WorkPhoneNumber Description }}

```yaml
Type: String
Parameter Sets: Filtered
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Active

{{ Fill Active Description }}

```yaml
Type: Boolean
Parameter Sets: Filtered
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -State

The allowable values for this are only documented in the API error message for when you use an invalid state

```yaml
Type: String
Parameter Sets: Filtered by State
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

List all agents and view an agent are currently supported, but filter agent is not yet, because it has custom query language like filter tickets

## RELATED LINKS

[https://api.freshservice.com/#view_an_agent](https://api.freshservice.com/#view_an_agent)

[https://api.freshservice.com/#list_all_agents](https://api.freshservice.com/#list_all_agents)


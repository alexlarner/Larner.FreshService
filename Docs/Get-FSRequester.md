---
external help file: Larner.FreshService-help.xml
Module Name: Larner.FreshService
online version: https://api.freshservice.com/#view_all_ticket
schema: 2.0.0
---

# Get-FSRequester

## SYNOPSIS

{{ Fill in the Synopsis }}

## SYNTAX

### All (Default)

```text
Get-FSRequester [-PassThru] [-EnableException] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### ID

```text
Get-FSRequester -ID <Int64[]> [-PassThru] [-EnableException] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### Filtered

```text
Get-FSRequester [-Email <String[]>] [-MobilePhoneNumber <String>] [-WorkPhoneNumber <String>] [-PassThru]
 [-EnableException] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION

{{ Fill in the Description }}

## EXAMPLES

### Example 1

```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

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

### -EnableException

{{ Fill EnableException Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

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

### -PassThru

{{ Fill PassThru Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
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

### System.Int64[]

### System.String[]

### System.String

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

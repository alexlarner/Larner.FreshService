---
external help file: Larner.FreshService-help.xml
Module Name: Larner.FreshService
online version: https://api.freshservice.com/#create_service_request
schema: 2.0.0
---

# New-FSTicketTask

## SYNOPSIS

{{ Fill in the Synopsis }}

## SYNTAX

### No Group (Default)

```text
New-FSTicketTask -ID <Int64> [-Status <String>] [-DueDate <DateTime>] [-NotifyBefore <Int32>] -Title <String[]>
 [-Description <String>] [-EnableException] [-PassThru] [-ProgressAction <ActionPreference>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

### ID

```text
New-FSTicketTask -ID <Int64> [-Status <String>] [-DueDate <DateTime>] [-NotifyBefore <Int32>] -Title <String[]>
 [-Description <String>] [-GroupID <Int64>] [-EnableException] [-PassThru] [-ProgressAction <ActionPreference>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Name

```text
New-FSTicketTask -ID <Int64> [-Status <String>] [-DueDate <DateTime>] [-NotifyBefore <Int32>] -Title <String[]>
 [-Description <String>] [-Group <String>] [-EnableException] [-PassThru] [-ProgressAction <ActionPreference>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
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

### -Confirm

Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description

{{ Fill Description Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DueDate

{{ Fill DueDate Description }}

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableException

Replaces user friendly yellow warnings with bloody red exceptions of doom! Use this if you want the function to throw terminating errors you want to catch.

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

### -Group

{{ Fill Group Description }}

```yaml
Type: String
Parameter Sets: Name
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupID

{{ Fill GroupID Description }}

```yaml
Type: Int64
Parameter Sets: ID
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
Type: Int64
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NotifyBefore

{{ Fill NotifyBefore Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:
Accepted values: 0, 900, 1800, 2700, 3600, 7200

Required: False
Position: Named
Default value: None
Accept pipeline input: False
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

### -Status

{{ Fill Status Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title

{{ Fill Title Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -WhatIf

Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String[]

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

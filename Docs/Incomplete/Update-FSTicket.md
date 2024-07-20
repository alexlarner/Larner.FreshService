---
external help file: Larner.FreshService-help.xml
Module Name: Larner.FreshService
online version: https://api.freshservice.com/#delete_a_ticket_attachment
schema: 2.0.0
---

# Update-FSTicket

## SYNOPSIS

{{ Fill in the Synopsis }}

## SYNTAX

### NonRequester (Default)

```text
Update-FSTicket -ID <Int64[]> [-Subject <String>] [-Type <String>] [-Status <String>] [-Priority <String>]
 [-Description <String>] [-Attachments <FileInfo[]>] [-CustomFields <Hashtable>] [-DueBy <DateTime>]
 [-EmailConfigId <Int64>] [-FrDueBy <DateTime>] [-Group <String>] [-Source <String>] [-Tags <String[]>]
 [-Assets <Hashtable>] [-Urgency <String>] [-Impact <String>] [-Category <String>] [-SubCategory <String>]
 [-ItemCategory <String>] [-DepartmentName <String>] [-Problem <Hashtable>]
 [-ChangeInitiatingTicket <Hashtable>] [-ChangeInitiatedByTicket <Hashtable>] [-DeleteExistingTags] [-PassThru]
 [-EnableException] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### PhoneAndName

```text
Update-FSTicket -ID <Int64[]> -Name <String> -Phone <String> [-Subject <String>] [-Type <String>]
 [-Status <String>] [-Priority <String>] [-Description <String>] [-Attachments <FileInfo[]>]
 [-CustomFields <Hashtable>] [-DueBy <DateTime>] [-EmailConfigId <Int64>] [-FrDueBy <DateTime>]
 [-Group <String>] [-Source <String>] [-Tags <String[]>] [-Assets <Hashtable>] [-Urgency <String>]
 [-Impact <String>] [-Category <String>] [-SubCategory <String>] [-ItemCategory <String>]
 [-DepartmentName <String>] [-Problem <Hashtable>] [-ChangeInitiatingTicket <Hashtable>]
 [-ChangeInitiatedByTicket <Hashtable>] [-DeleteExistingTags] [-PassThru] [-EnableException]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ID

```text
Update-FSTicket -ID <Int64[]> [-RequesterID <Int64>] [-Subject <String>] [-Type <String>] [-Status <String>]
 [-Priority <String>] [-Description <String>] [-ResponderId <Int64>] [-Attachments <FileInfo[]>]
 [-CustomFields <Hashtable>] [-DueBy <DateTime>] [-EmailConfigId <Int64>] [-FrDueBy <DateTime>]
 [-GroupId <Int64>] [-Source <String>] [-Tags <String[]>] [-Assets <Hashtable>] [-Urgency <String>]
 [-Impact <String>] [-Category <String>] [-SubCategory <String>] [-ItemCategory <String>]
 [-DepartmentID <Int64>] [-Problem <Hashtable>] [-ChangeInitiatingTicket <Hashtable>]
 [-ChangeInitiatedByTicket <Hashtable>] [-DeleteExistingTags] [-PassThru] [-EnableException]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### PhoneAndEmail

```text
Update-FSTicket -ID <Int64[]> -Email <String> -Phone <String> [-Subject <String>] [-Type <String>]
 [-Status <String>] [-Priority <String>] [-Description <String>] [-Attachments <FileInfo[]>]
 [-CustomFields <Hashtable>] [-DueBy <DateTime>] [-EmailConfigId <Int64>] [-FrDueBy <DateTime>]
 [-Group <String>] [-Source <String>] [-Tags <String[]>] [-Assets <Hashtable>] [-Urgency <String>]
 [-Impact <String>] [-Category <String>] [-SubCategory <String>] [-ItemCategory <String>]
 [-DepartmentName <String>] [-Problem <Hashtable>] [-ChangeInitiatingTicket <Hashtable>]
 [-ChangeInitiatedByTicket <Hashtable>] [-DeleteExistingTags] [-PassThru] [-EnableException]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Email

```text
Update-FSTicket -ID <Int64[]> -Email <String> [-Subject <String>] [-Type <String>] [-Status <String>]
 [-Priority <String>] [-Description <String>] [-Attachments <FileInfo[]>] [-CustomFields <Hashtable>]
 [-DueBy <DateTime>] [-EmailConfigId <Int64>] [-FrDueBy <DateTime>] [-Group <String>] [-Source <String>]
 [-Tags <String[]>] [-Assets <Hashtable>] [-Urgency <String>] [-Impact <String>] [-Category <String>]
 [-SubCategory <String>] [-ItemCategory <String>] [-DepartmentName <String>] [-Problem <Hashtable>]
 [-ChangeInitiatingTicket <Hashtable>] [-ChangeInitiatedByTicket <Hashtable>] [-DeleteExistingTags] [-PassThru]
 [-EnableException] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
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

### -Assets

{{ Fill Assets Description }}

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Attachments

{{ Fill Attachments Description }}

```yaml
Type: FileInfo[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Category

{{ Fill Category Description }}

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

### -ChangeInitiatedByTicket

{{ Fill ChangeInitiatedByTicket Description }}

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ChangeInitiatingTicket

{{ Fill ChangeInitiatingTicket Description }}

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

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

### -CustomFields

{{ Fill CustomFields Description }}

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DeleteExistingTags

{{ Fill DeleteExistingTags Description }}

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

### -DepartmentID

{{ Fill DepartmentID Description }}

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

### -DepartmentName

{{ Fill DepartmentName Description }}

```yaml
Type: String
Parameter Sets: NonRequester, PhoneAndName, PhoneAndEmail, Email
Aliases:

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

### -DueBy

{{ Fill DueBy Description }}

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

### -Email

{{ Fill Email Description }}

```yaml
Type: String
Parameter Sets: PhoneAndEmail, Email
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EmailConfigId

{{ Fill EmailConfigId Description }}

```yaml
Type: Int64
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

### -FrDueBy

{{ Fill FrDueBy Description }}

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

### -Group

{{ Fill Group Description }}

```yaml
Type: String
Parameter Sets: NonRequester, PhoneAndName, PhoneAndEmail, Email
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupId

{{ Fill GroupId Description }}

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
Type: Int64[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Impact

{{ Fill Impact Description }}

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

### -ItemCategory

{{ Fill ItemCategory Description }}

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

### -Name

{{ Fill Name Description }}

```yaml
Type: String
Parameter Sets: PhoneAndName
Aliases:

Required: True
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

### -Phone

{{ Fill Phone Description }}

```yaml
Type: String
Parameter Sets: PhoneAndName, PhoneAndEmail
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Priority

{{ Fill Priority Description }}

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

### -Problem

{{ Fill Problem Description }}

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RequesterID

{{ Fill RequesterID Description }}

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

### -ResponderId

{{ Fill ResponderId Description }}

```yaml
Type: Int64
Parameter Sets: ID
Aliases: AgentID

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Source

{{ Fill Source Description }}

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

### -SubCategory

{{ Fill SubCategory Description }}

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

### -Subject

{{ Fill Subject Description }}

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

### -Tags

{{ Fill Tags Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type

{{ Fill Type Description }}

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

### -Urgency

{{ Fill Urgency Description }}

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

### System.Int64[]

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

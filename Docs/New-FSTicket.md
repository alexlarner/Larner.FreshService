---
external help file: Larner.FreshService-help.xml
Module Name: Larner.FreshService
online version: https://api.freshservice.com/#create_service_request
schema: 2.0.0
---

# New-FSTicket

## SYNOPSIS

{{ Fill in the Synopsis }}

## SYNTAX

### PhoneAndName

```text
New-FSTicket -Name <String> -Phone <String> -Subject <String> [-Status <String>] [-Priority <String>]
 -Description <String> [-ResponderID <Int64>] [-Attachments <FileInfo[]>] [-CcEmails <String[]>]
 [-CustomFields <Hashtable>] [-DueBy <DateTime>] [-EmailConfigID <Int64>] [-FrDueBy <DateTime>]
 -GroupId <Int64> [-Source <String>] [-Tags <String[]>] [-DepartmentID <Int64>] [-DepartmentName <String>]
 -Category <String> [-SubCategory <String>] [-ItemCategory <String>] [-Assets <Hashtable>] [-Urgency <String>]
 [-Impact <String>] [-Problem <Hashtable>] [-ChangeInitiatingTicket <Hashtable>]
 [-ChangeInitiatedByTicket <Hashtable>] [-EnableException] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### ID

```text
New-FSTicket -RequesterID <Int64> -Subject <String> [-Status <String>] [-Priority <String>]
 -Description <String> [-ResponderID <Int64>] [-Attachments <FileInfo[]>] [-CcEmails <String[]>]
 [-CustomFields <Hashtable>] [-DueBy <DateTime>] [-EmailConfigID <Int64>] [-FrDueBy <DateTime>]
 -GroupId <Int64> [-Source <String>] [-Tags <String[]>] [-DepartmentID <Int64>] [-DepartmentName <String>]
 -Category <String> [-SubCategory <String>] [-ItemCategory <String>] [-Assets <Hashtable>] [-Urgency <String>]
 [-Impact <String>] [-Problem <Hashtable>] [-ChangeInitiatingTicket <Hashtable>]
 [-ChangeInitiatedByTicket <Hashtable>] [-EnableException] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### PhoneAndEmail

```text
New-FSTicket -Email <String> -Phone <String> -Subject <String> [-Status <String>] [-Priority <String>]
 -Description <String> [-ResponderID <Int64>] [-Attachments <FileInfo[]>] [-CcEmails <String[]>]
 [-CustomFields <Hashtable>] [-DueBy <DateTime>] [-EmailConfigID <Int64>] [-FrDueBy <DateTime>]
 -GroupId <Int64> [-Source <String>] [-Tags <String[]>] [-DepartmentID <Int64>] [-DepartmentName <String>]
 -Category <String> [-SubCategory <String>] [-ItemCategory <String>] [-Assets <Hashtable>] [-Urgency <String>]
 [-Impact <String>] [-Problem <Hashtable>] [-ChangeInitiatingTicket <Hashtable>]
 [-ChangeInitiatedByTicket <Hashtable>] [-EnableException] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### Email

```text
New-FSTicket -Email <String> -Subject <String> [-Status <String>] [-Priority <String>] -Description <String>
 [-ResponderID <Int64>] [-Attachments <FileInfo[]>] [-CcEmails <String[]>] [-CustomFields <Hashtable>]
 [-DueBy <DateTime>] [-EmailConfigID <Int64>] [-FrDueBy <DateTime>] -GroupId <Int64> [-Source <String>]
 [-Tags <String[]>] [-DepartmentID <Int64>] [-DepartmentName <String>] -Category <String>
 [-SubCategory <String>] [-ItemCategory <String>] [-Assets <Hashtable>] [-Urgency <String>] [-Impact <String>]
 [-Problem <Hashtable>] [-ChangeInitiatingTicket <Hashtable>] [-ChangeInitiatedByTicket <Hashtable>]
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

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CcEmails

{{ Fill CcEmails Description }}

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

### -DepartmentID

{{ Fill DepartmentID Description }}

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

### -DepartmentName

{{ Fill DepartmentName Description }}

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

### -Description

{{ Fill Description Description }}

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

### -EmailConfigID

{{ Fill EmailConfigID Description }}

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

### -GroupId

{{ Fill GroupId Description }}

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

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResponderID

{{ Fill ResponderID Description }}

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

Required: True
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

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

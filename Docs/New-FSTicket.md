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

List of assets associated with the ticket

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

Ticket attachments. The total size of these attachments cannot exceed 15MB. This currently gives a HTTP 400 error with a `It should contain elements of type valid file format only","code":"datatype_mismatch"`

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

Ticket category. The API documentation is incorrect, this is in fact a mandatory field, per the API `Validation Failed` response when one is not specified.

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

Email address added in the 'cc' field of the incoming ticket email.

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

Change causing the ticket that needs to be associated with ticket (change display id)

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

Change needed for the ticket to be fixed that needs to be associated with ticket (change display id)

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

Key value pairs containing the names and values of custom fields.

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

Department ID of the requester. Not needed if `DepartmentName` is used.

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

Department name of the requester. Not needed if `DepartmentID` is used.

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

HTML content of the ticket. The API documentation is incorrect, this is in fact a mandatory field, per the API error response when one is not specified, or when the specified one is a blank string.

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

Timestamp that denotes when the ticket is due to be resolved.

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

Email address of the requester. If no contact exists with this email address in Freshservice, it will be added as a new contact.

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

ID of email config which is used for this ticket. (i.e., `support@yourcompany.com`/`sales@yourcompany.com`)

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

Timestamp that denotes when the first response is due

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

ID of the group to which the ticket has been assigned. The default value is the ID of the group that is associated with the given `email_config_id`.

This is mandatory due to copmany policy, not manufacturer's policy.

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

Ticket impact

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

Ticket item category

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

Name of the requester

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

Phone number of the requester. If no contact exists with this phone number in Freshservice, it will be added as a new contact. If the phone number is set and the email address is not, then the name attribute is mandatory.

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

Priority of the ticket.

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

Problem that needs to be associated with ticket (problem display id)

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

User ID of the requester. For existing contacts, the requester_id can be passed instead of the requester's email.

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

ID of the agent to whom the ticket has been assigned

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

The channel through which the ticket was created. The default value is 2.

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

Status of the ticket.

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

Ticket sub category

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

Subject of the ticket. The default value is null. The API documentation is incorrect, this is in fact a mandatory field, per the API error response when one is not specified, or when the specified one is a blank string.

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

Tags that have been associated with the ticket

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

Ticket urgency

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

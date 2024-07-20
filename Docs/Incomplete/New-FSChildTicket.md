---
external help file: Larner.FreshService-help.xml
Module Name: Larner.FreshService
online version: https://api.freshservice.com/#create_child_ticket
schema: 2.0.0
---

# New-FSChildTicket

## SYNOPSIS

## SYNTAX

### PhoneAndName

```text
New-FSChildTicket -ParentID <Int64> -Name <String> -Phone <String> -Subject <String> [-Type <String>]
 [-Status <String>] [-Priority <String>] -Description <String> [-ResponderId <Int64>]
 [-Attachments <FileInfo[]>] [-CcEmails <String[]>] [-CustomFields <Hashtable>] [-DueBy <DateTime>]
 [-EmailConfigId <Int64>] [-FrDueBy <DateTime>] [-GroupId <Int64>] [-Source <String>] [-Tags <String[]>]
 [-DepartmentId <Int64>] [-DepartmentName <String>] -Category <String> [-SubCategory <String>]
 [-ItemCategory <String>] [-AssociateCi <Hashtable>] [-Urgency <String>] [-Impact <String>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### ID

```text
New-FSChildTicket -ParentID <Int64> -RequesterID <Int64> -Subject <String> [-Type <String>] [-Status <String>]
 [-Priority <String>] -Description <String> [-ResponderId <Int64>] [-Attachments <FileInfo[]>]
 [-CcEmails <String[]>] [-CustomFields <Hashtable>] [-DueBy <DateTime>] [-EmailConfigId <Int64>]
 [-FrDueBy <DateTime>] [-GroupId <Int64>] [-Source <String>] [-Tags <String[]>] [-DepartmentId <Int64>]
 [-DepartmentName <String>] -Category <String> [-SubCategory <String>] [-ItemCategory <String>]
 [-AssociateCi <Hashtable>] [-Urgency <String>] [-Impact <String>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### PhoneAndEmail

```text
New-FSChildTicket -ParentID <Int64> -Email <String> -Phone <String> -Subject <String> [-Type <String>]
 [-Status <String>] [-Priority <String>] -Description <String> [-ResponderId <Int64>]
 [-Attachments <FileInfo[]>] [-CcEmails <String[]>] [-CustomFields <Hashtable>] [-DueBy <DateTime>]
 [-EmailConfigId <Int64>] [-FrDueBy <DateTime>] [-GroupId <Int64>] [-Source <String>] [-Tags <String[]>]
 [-DepartmentId <Int64>] [-DepartmentName <String>] -Category <String> [-SubCategory <String>]
 [-ItemCategory <String>] [-AssociateCi <Hashtable>] [-Urgency <String>] [-Impact <String>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Email

```text
New-FSChildTicket -ParentID <Int64> -Email <String> -Subject <String> [-Type <String>] [-Status <String>]
 [-Priority <String>] -Description <String> [-ResponderId <Int64>] [-Attachments <FileInfo[]>]
 [-CcEmails <String[]>] [-CustomFields <Hashtable>] [-DueBy <DateTime>] [-EmailConfigId <Int64>]
 [-FrDueBy <DateTime>] [-GroupId <Int64>] [-Source <String>] [-Tags <String[]>] [-DepartmentId <Int64>]
 [-DepartmentName <String>] -Category <String> [-SubCategory <String>] [-ItemCategory <String>]
 [-AssociateCi <Hashtable>] [-Urgency <String>] [-Impact <String>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
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

### -ParentID

Parent ticket ID

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: True (ByPropertyName, ByValue)
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

### -RequesterID

*User ID of the requester.
For existing contacts, the requester_id can be passed instead of the requester's email.

```yaml
Type: Int64
Parameter Sets: ID
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Email

*Email address of the requester.
If no contact exists with this email address in Freshservice, it will be added as a new contact.

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

### -Phone

*Phone number of the requester.
If no contact exists with this phone number in Freshservice, it will be added as a new contact.
If the phone number is set and the email address is not, then the name attribute is mandatory.

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

### -Subject

Subject of the ticket.
The default value is null.
The API documentation is incorrect, this is in fact a mandatory field, per the API error response when one is not specified, or when the specified one is a blank string.

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

### -Type

Helps categorize the ticket according to the different kinds of issues your support team deals with.
The default Value is incident.*As of now, API v2 supports only type incident

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

*Status of the ticket.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Open
Accept pipeline input: False
Accept wildcard characters: False
```

### -Priority

*Priority of the ticket.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Low
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description

HTML content of the ticket.
The API documentation is incorrect, this is in fact a mandatory field, per the API error response when one is not specified, or when the specified one is a blank string.

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

### -ResponderId

ID of the agent to whom the ticket has been assigned

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Attachments

Ticket attachments.
The total size of these attachments cannot exceed 15MB.

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

### -CustomFields

Key value pairs containing the names and values of custom fields.
Read morehere.

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

### -EmailConfigId

ID of email config which is used for this ticket.
(i.e., support@yourcompany.com/sales@yourcompany.com)

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
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

ID of the group to which the ticket has been assigned.
The default value is the ID of the group that is associated with the given email_config_id

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Source

*The channel through which the ticket was created.
The default value is 2.

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

### -DepartmentId

Department ID of the requester.

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -DepartmentName

Department name of the requester.
Not needed if DepartmentID is used.

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

### -Category

Ticket category.
The API documentation is incorrect, this is in fact a mandatory field, per the API "Validation Failed" response when one is not specified.

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

### -AssociateCi

Search for asset and associate with ticket

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

From API Help:

1.
Association of child tickets is not available in the Sprout plan.
2.
Association of child tickets to a service request is not possible.
3.
Association of child tickets to a deleted or a spammed ticket is not allowed.
4.
Nesting of a child ticket under another child ticket is not supported.

## RELATED LINKS

[https://api.freshservice.com/#create_child_ticket](https://api.freshservice.com/#create_child_ticket)


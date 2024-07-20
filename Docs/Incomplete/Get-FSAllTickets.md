---
external help file: Larner.FreshService-help.xml
Module Name: Larner.FreshService
online version: https://api.freshservice.com/#view_all_ticket
schema: 2.0.0
---

# Get-FSAllTickets

## SYNOPSIS

## SYNTAX

```text
Get-FSAllTickets [[-Filter] <String>] [[-RequesterID] <Int64>] [[-Email] <String>] [[-UpdatedSince] <DateTime>]
 [[-Type] <String>] [[-OrderType] <String>] [[-Include] <String[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION

{{ Fill in the Description }}

## EXAMPLES

### Example 1

```PowerShell
Get-FSALlTickets
```

## PARAMETERS

### -Filter

The filters available are new_and_my_open, watching, spam, deleted.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RequesterID

{{ Fill RequesterID Description }}

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Email

{{ Fill Email Description }}

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

### -UpdatedSince

By default only tickets that have been created within the past 30 days will be returned.
For older tickets, use this filter.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type

For Incidents: /api/v2/tickets?type=Incident
For Service Requests: /api/v2/tickets?type=Service+Request
The API response mentions an alert option

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OrderType

Default sort order type is Descending

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: Descending
Accept pipeline input: False
Accept wildcard characters: False
```

### -Include

Stats: Will return the tickets closed_at, resolved_at and first_responded_at time.
Requester: Will return the requester's email, id, mobile, name, and phone.
Requested_For: Will return details of the user on behalf of whom the request has been raised
Tags and department are not listed in the documentation, but are listed in the error response if you use an invalid value for this.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### String, Long, DateTime

## OUTPUTS

## NOTES

## RELATED LINKS

[https://api.freshservice.com/#view_all_ticket](https://api.freshservice.com/#view_all_ticket)


---
external help file: Larner.FreshService-help.xml
Module Name: Larner.FreshService
online version: https://api.freshservice.com/#create_service_request
schema: 2.0.0
---

# New-FSServiceRequest

## SYNOPSIS

## SYNTAX

### ChildItems (Default)

```text
New-FSServiceRequest [-Quantity <Int32>] [-RequestedFor <String>] -Email <String> [-ChildItems <Hashtable[]>]
 -Category <String> [-CustomFields <Hashtable>] [-PassThru] [-EnableException]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### ID

```text
New-FSServiceRequest -DisplayID <Int32> [-Quantity <Int32>] [-RequestedFor <String>] -Email <String>
 [-ChildItems <Hashtable[]>] -Category <String> [-CustomFields <Hashtable>] [-PassThru] [-EnableException]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Name

```text
New-FSServiceRequest -ServiceItemName <String> [-Quantity <Int32>] [-RequestedFor <String>] -Email <String>
 [-ChildItems <Hashtable[]>] -Category <String> [-CustomFields <Hashtable>] [-PassThru] [-EnableException]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION

{{ Fill in the Description }}

## EXAMPLES

### Example 1

```PowerShell

```

## PARAMETERS

### -DisplayID

The display ID of the service item

```yaml
Type: Int32
Parameter Sets: ID
Aliases: ServiceItemID

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -ServiceItemName

Name of the service item template to create the request from.
Must be the name of an existing Service Item.
You can see all the available options by running Get-FSServiceItem

```yaml
Type: String
Parameter Sets: Name
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Quantity

Quantity needed by the requested

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -RequestedFor

Email id of the requester on whose behalf the service request is created

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

### -Email

Email id of the requester

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

### -ChildItems

-and $_.ContainsKey('email')
Service items that are included as child items.
Provide the display id as service_item_id for each child item.

```yaml
Type: Hashtable[]
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

### -CustomFields

Values of custom fields present in the service item form
You can use Get-FSServiceItem to see the custom fields, i.e.
(Get-FSServiceItem -SearchTerm 'VPN Access Request').Custom_fields

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

### -PassThru

{{ Fill PassThru Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
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
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://api.freshservice.com/#create_service_request](https://api.freshservice.com/#create_service_request)


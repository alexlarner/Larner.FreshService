---
external help file: Larner.FreshService-help.xml
Module Name: Larner.FreshService
online version: https://api.freshservice.com/#view_service_item
schema: 2.0.0
---

# Get-FSServiceItem

## SYNOPSIS

Get a service item or all service items

## SYNTAX

### All (Default)

```text
Get-FSServiceItem [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Filter By Category Name

```text
Get-FSServiceItem -ServiceCategoryName <String[]> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Filter By Category ID

```text
Get-FSServiceItem -ServiceCategoryID <Int64[]> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Display ID

```text
Get-FSServiceItem -DisplayID <Int32[]> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Search

```text
Get-FSServiceItem -SearchTerm <String[]> [-UserEmail <String>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION

Get a service item that matches a display ID, search term, or service category, or get all service items.

Returns all the details of a service item/s, i.e.
Name, Display ID, required fields, etc.

Use to get the display ID of an item to create a new service request (using New-FSServiceRequest) or to see all the available service items

## EXAMPLES

### Example 1

```PowerShell
Get-FSServiceItem -ServiceCategoryName 'Hardware Provisioning'
```

id                       : 18000578715
created_at               : 4/22/2021 4:43:42 PM
updated_at               : 4/22/2021 4:43:42 PM
name                     : Laptop - 2 in 1 Convertible
delivery_time            :
display_id               : 64
category_id              : 18000094430
product_id               :
quantity                 :
deleted                  : False
icon_name                : service-catalog-services-default
group_visibility         : 1
agent_group_visibility   : 1
item_type                : 1
ci_type_id               :
visibility               : 2
cost_visibility          : True
delivery_time_visibility : False
botified                 : False
allow_attachments        : False
allow_quantity           : False
is_bundle                : False
create_child             : False
configs                  : @{attachment_mandatory=False; subject=Request for {{requested_for}} : {{item.name}}}

### Example 2

```PowerShell
Get-FSServiceItem -ServiceCategoryID 18000162285
```

id                       : 18000764406
created_at               : 2/7/2022 3:29:50 PM
updated_at               : 2/7/2022 3:32:35 PM
name                     : Security Posture Review
delivery_time            :
display_id               : 69
category_id              : 18000162285
product_id               :
quantity                 :
deleted                  : False
icon_name                : service-catalog-services-default
group_visibility         : 2
agent_group_visibility   : 1
item_type                : 1
ci_type_id               :
visibility               : 1
cost_visibility          : False
delivery_time_visibility : False
botified                 : False
allow_attachments        : True
allow_quantity           : False
is_bundle                : False
create_child             : False
configs                  : @{attachment_mandatory=False; subject=Request for {{requested_for}} : {{item.name}}}

## PARAMETERS

### -ServiceCategoryName

Name of the category that you want all the service items from.
You can get them all from Get-FSAllServiceCategories.

```yaml
Type: String[]
Parameter Sets: Filter By Category Name
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ServiceCategoryID

Unique ID of the category of the service item

```yaml
Type: Int64[]
Parameter Sets: Filter By Category ID
Aliases: category_id

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -DisplayID

Unique ID of the service item specific to your account

```yaml
Type: Int32[]
Parameter Sets: Display ID
Aliases: display_id

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -SearchTerm

The keywords for which the solution articles have to be searched.

```yaml
Type: String[]
Parameter Sets: Search
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -UserEmail

By default, the API will search the articles for the user whose API key is provided.
If you want to search articles for a different user, please provide their user_email.

```yaml
Type: String
Parameter Sets: Search
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

### String, Int

## OUTPUTS

## NOTES

The All and Filter* parameter sets do not include these properties on the returned object:
	child_items
	cost
	custom_fields
	description
	icon_url
	short_description

All the other property sets ('Display ID' and 'Search'), do include those properties in the returned object

## RELATED LINKS

[https://api.freshservice.com/#view_service_item](https://api.freshservice.com/#view_service_item)

[https://api.freshservice.com/#list_all_service_items](https://api.freshservice.com/#list_all_service_items)

[https://api.freshservice.com/#search_service_item](https://api.freshservice.com/#search_service_item)


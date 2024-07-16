function Get-FSServiceItem {
	<#
	.SYNOPSIS
		Get a service item or all service items
	.DESCRIPTION
		Get a service item that matches a display ID, search term, or service category, or get all service items.

		Returns all the details of a service item/s, i.e. Name, Display ID, required fields, etc.

		Use to get the display ID of an item to create a new service request (using New-FSServiceRequest) or to see all the available service items
	.INPUTS
		String, Int
	.EXAMPLE
		PS C:\> Get-FSServiceItem -ServiceCategoryName 'Hardware Provisioning'

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
	.EXAMPLE
		PS C:\> Get-FSServiceItem -ServiceCategoryID 18000162285

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
	.LINK
		https://api.freshservice.com/#view_service_item
	.LINK
		https://api.freshservice.com/#list_all_service_items
	.LINK
		https://api.freshservice.com/#search_service_item
	.NOTES
		The All and Filter* parameter sets do not include these properties on the returned object:
			child_items
			cost
			custom_fields
			description
			icon_url
			short_description

		All the other property sets ('Display ID' and 'Search'), do include those properties in the returned object
	#>
	[CmdletBinding(DefaultParameterSetName = 'All')]
	param (
		[Parameter(
			Mandatory,
			ParameterSetName = 'Filter By Category Name',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		[PsfValidateSet(TabCompletion = 'FreshService.ServiceCategoryNames')]
		#Name of the category that you want all the service items from. You can get them all from Get-FSAllServiceCategories.
		[string[]]$ServiceCategoryName,

		[Parameter(
			Mandatory,
			ParameterSetName = 'Filter By Category ID',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		[Alias('category_id')]
		#Unique ID of the category of the service item
		[long[]]$ServiceCategoryID,

		[Parameter(
			Mandatory,
			ParameterSetName = 'Display ID',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		[Alias('display_id')]
		#Unique ID of the service item specific to your account
		[int[]]$DisplayID,

		[Parameter(
			Mandatory,
			ParameterSetName = 'Search',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		#The keywords for which the solution articles have to be searched.
		[string[]]$SearchTerm,

		[Parameter(ParameterSetName = 'Search')]
		[ValidatePattern('^[A-Z0-9+_.-]+@[A-Z0-9.-]+$')]
		#By default, the API will search the articles for the user whose API key is provided. If you want to search articles for a different user, please provide their user_email.
		[string]$UserEmail
	)
	begin {
		Write-PSFMessage -Target $PSBoundParameters -Level Debug -Message "Running $($MyInvocation.MyCommand) using parameter set $($PSCmdlet.ParameterSetName) with these parameters"
		$WrapperProperty = if ($PSCmdlet.ParameterSetName -eq 'Display ID') {
			'service_item'
		} else { 'service_items' }

		$URISuffix = '/service_catalog/items'
	}
	process {
		$FullResult = switch -wildcard ($PSCmdlet.ParameterSetName) {
			'All' { Invoke-FSAPI -URISuffix $URISuffix }
			'Filter By Category Name' {
				$ServiceCategoryID = Get-FSAllServiceCategories | Where-Object Name -in $ServiceCategoryName | Select-Object -ExpandProperty ID
			}
			'Filter By Category*' {
				$ServiceCategoryID | ForEach-Object {
					Invoke-FSAPI -URISuffix $URISuffix -Body @{ category_id = $_ }
				}
			}
			'Display ID' {
				$DisplayID | ForEach-Object {
					$UriIdSuffix = $URISuffix + "/$_"
					Invoke-FSAPI -URISuffix $UriIdSuffix
				}
			}
			'Search' {
				$UriSearchSuffix = $URISuffix + '/search'
				$Body = ConvertTo-FSNames -FrontEndParams $PSBoundParameters -PreserveStringValue * -ExcludeKey 'SearchTerm'
				$SearchTerm | ForEach-Object {
					$Body.search_term = $_
					#FollowRelLink does not work for this one
					$Result = Invoke-FSAPI -URISuffix $UriSearchSuffix -Body $Body
					$Result
					for (; $Result.meta.current_page -le $Result.meta.total_pages; ) {
						$Body.page = $Result.meta.current_page + 1
						$Result = Invoke-FSAPI -URISuffix $UriSearchSuffix -Body $Body
						$Result
					}
				}
			}
		}

		Write-Output $FullResult.$WrapperProperty
	}
}

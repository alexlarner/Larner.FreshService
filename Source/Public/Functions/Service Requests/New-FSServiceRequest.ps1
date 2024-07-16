function New-FSServiceRequest {
	<#
	.SYNOPSIS

	.DESCRIPTION

	.INPUTS

	.OUTPUTS

	.EXAMPLE
		PS C:\>
	.LINK
		https://api.freshservice.com/#create_service_request
	.NOTES

	#>
	[CmdletBinding(DefaultParameterSetName = 'ChildItems')]
	param (
		[Parameter(
			Mandatory,
			ParameterSetName = 'ID'
		)]
		[Alias('ServiceItemID')]
		#The display ID of the service item
		[int]$DisplayID,

		[Parameter(
			Mandatory,
			ParameterSetName = 'Name'
		)]
		[PsfValidateSet(TabCompletion = 'FreshService.ServiceItemNames')]
		<#
		Name of the service item template to create the request from.
		Must be the name of an existing Service Item.
		You can see all the available options by running Get-FSServiceItem
		#>
		[string]$ServiceItemName,

		#Quantity needed by the requested
		[int]$Quantity,

		[ValidatePattern('^[A-Z0-9+_.-]+@[A-Z0-9.-]+$')]
		#Email id of the requester on whose behalf the service request is created
		[string]$RequestedFor,

		[Parameter(Mandatory)]
		[ValidatePattern('^[A-Z0-9+_.-]+@[A-Z0-9.-]+$')]
		#Email id of the requester
		[string]$Email,

		[ValidateScript({
			$_.ContainsKey('service_item_id')# -and $_.ContainsKey('email')
		})]
		#Service items that are included as child items. Provide the display id as service_item_id for each child item.
		[hashtable[]]$ChildItems,

		#Ticket category. The API documentation is incorrect, this is in fact a mandatory field, per the API "Validation Failed" response when one is not specified.
		[Parameter(Mandatory)]
		[PsfValidateSet(TabCompletion = 'FreshService.CategoryNames')]
		[string]$Category,

		#Values of custom fields present in the service item form
		#You can use Get-FSServiceItem to see the custom fields, i.e. (Get-FSServiceItem -SearchTerm 'VPN Access Request').Custom_fields
		[hashtable]$CustomFields,

		[switch]$PassThru,

		[switch]$EnableException
	)

	if ($PSCmdlet.ParameterSetName -eq 'Name') {
		$DisplayID = (Get-FSServiceItem -SearchTerm $ServiceItemName).display_id
	} else {
		$ServiceItemName = (Get-FSServiceItem -DisplayID $DisplayID).Name
	}

	$Splat = @{
		URISuffix = "/service_catalog/items/$DisplayID/place_request"
		Method = 'Post'
		Body = ConvertTo-FSNames -FrontEndParams $PSBoundParameters -PreserveStringValue * -ExcludeKey DisplayID, ServiceItemName, Category
	}

	Invoke-PSFProtectedCommand -Action "Create `"$ServiceItemName`" service request" -Target "$Email$(if ($RequestedFor) { ", on behalf of $RequestedFor" })" -ScriptBlock {
		$Result = Invoke-FSAPI @Splat
	} -EnableException $EnableException

	#This is because the request will block any update requests until it has a description.
	Invoke-PSFProtectedCommand -Action "Update service request to populate mandatory ticket fields (Description & Category)" -Target "$Result.service_request.id" -ScriptBlock {
		Update-FSTicket -ID $Result.service_request.id -Description $Result.service_request.subject -Category $Category
	} -EnableException $EnableException

	Write-PSFMessage "Created service request $($Result.service_request.id)"
	if ($PassThru) { Write-Output $Result.service_request }
}

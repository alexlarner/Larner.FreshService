function Get-FSServiceRequestItems {
	<#
	.SYNOPSIS
		Gets the requested items attached to service request
	.DESCRIPTION

	.INPUTS
		Long
	.LINK
		https://api.freshservice.com/#view_req_items_of_sr
	.NOTES
	#>
	[CmdletBinding()]
	param (
		[Parameter(
			Mandatory,
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		#Unique id of the service request
		[long[]]$ID
	)
	process {
		$ID | ForEach-Object {
			Write-Output (Invoke-FSAPI -URISuffix "/tickets/$_/requested_items").requested_items
		}
	}
}

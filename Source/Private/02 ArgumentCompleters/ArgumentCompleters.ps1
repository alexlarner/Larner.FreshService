$ScriptBlockToArgumentCompleterMapping = @{
	Agents = @(
		@{
			Command = 'Get-FSAgentBasic', 'New-FSTicketFilter', 'New-FSTimeEntry'
			Parameter = 'Agent'
		},
		@{
			Command = 'Get-FSAgent'
			Parameter = 'ID'
		},
		@{
			Command = 'New-FSNote'
			Parameter = 'User'
		},
		@{
			Command = 'New-FSChildTicket', 'New-FSTicket', 'Update-FSTicket'
			Parameter = 'Responder'
		}
	)
	AgentGroupNames = @{
		Command = 'New-FSTicketTask', 'Test-AgentGroupValidation', 'Update-FSTicketTask', 'Update-FSTicket'
		Parameter = 'Group'
	}
	CategoryNames = @{
		Command = 'New-FSTicket', 'New-FSChildTicket', 'New-FSServiceRequest', 'Update-FSTicket', 'Get-FSTicketSubCategories'
		Parameter = 'Category'
	}
	ClassNames = @{
		Command = 'New-FSClassInstance'
		Parameter = 'ClassName'
	}
	DepartmentNames = @{
		Command = 'Get-FSDepartment', 'New-FSChildTicket', 'New-FSTicket', 'Update-FSDepartment', 'Update-FSTicket'
		Parameter = 'DepartmentName'
	}
	FoodNames = @{
		Command = 'Test-FoodValidation'
		Parameter = 'Food'
	}
	ImpactNames = @{
		Command = 'New-FSChildTicket', 'New-FSTicket', 'Update-FSTicket'
		Parameter = 'Impact'
	}
	PriorityNames = @{
		Command = 'New-FSChildTicket', 'New-FSTicket', 'Update-FSTicket'
		Parameter = 'Priority'
	}
	ServiceCategoryNames = @{
		Command = 'Get-FSServiceItem'
		Parameter = 'ServiceCategoryName'
	}
	ServiceItemNames = @{
		Command = 'New-FSServiceRequest'
		Parameter = 'ServiceItemName'
	}
	SourceNames = @{
		Command = 'New-FSChildTicket', 'New-FSTicket', 'Update-FSTicket'
		Parameter = 'Source'
	}
	StatusNames = @{
		Command = 'Invoke-FSTicketTask', 'New-FSChildTicket', 'New-FSTicket', 'New-FSTicketFilter', 'New-FSTicketTagQuery', 'Update-FSTicket'
		Parameter = 'Status'
	}
	TaskStatusNames = @{
		Command = 'New-FSTicketTask', 'Update-FSTicketTask'
		Parameter = 'Status'
	}
	SubcategoryNames = @{
		Command = 'New-FSChildTicket', 'New-FSTicket', 'Update-FSTicket'
		Parameter = 'Subcategory'
	}
	TicketFieldsWithChoices = @{
		Command = 'Get-FSTicketFieldValues', 'Get-FSTicketFieldChoiceID'
		Parameter = 'Field'
	}
	Tickets = @(
		@{
			Command = 'Get-FSTicket', 'Get-FSTicketConversation', 'Update-FSTicket'
			Parameter = 'ID'
		},
		@{
			Command = 'Get-FSTicketTask'
			Parameter = 'TicketID'
		}
	)
	TicketTypeNames = @{
		Command = 'New-FSChildTicket', 'Update-FSTicket'
		Parameter = 'Type'
	}
	TicketTypeNamesAlt = @{
		Command = 'Get-FSAllTickets'
		Parameter = 'Type'
	}
	UrgencyNames = @{
		Command = 'New-FSChildTicket', 'New-FSTicket', 'New-FSTicketFilter', 'Update-FSTicket'
		Parameter = 'Urgency'
	}
}

foreach ($Mapping in $ScriptBlockToArgumentCompleterMapping.GetEnumerator()) {
	$Mapping | ForEach-Object {
		Register-PSFTeppArgumentCompleter -Parameter $_.Value.Parameter -Name "FreshService.$($_.Key)" -Command $_.Value.Command
	}
}

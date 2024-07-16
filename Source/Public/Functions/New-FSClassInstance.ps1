function New-FSClassInstance {
	[CmdletBinding(SupportsShouldProcess)]
	param (
		[Parameter(Mandatory)]
        [PsfValidateSet(TabCompletion = 'FreshService.ClassNames')]
		[string]$ClassName,

		[Parameter(
            Mandatory,
            ValueFromRemainingArguments
        )]
        $ArgumentList
	)
	process {
		Invoke-PSFProtectedCommand -Action "Create $ClassName instance" -Target $ArgumentList -ScriptBlock {
            New-Object -TypeName $ClassName -ArgumentList $ArgumentList
        } -Continue        
	}
}
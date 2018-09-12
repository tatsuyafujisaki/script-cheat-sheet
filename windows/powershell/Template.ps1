Set-StrictMode -Version Latest

$Host.UI.RawUI.WindowTitle = $MyInvocation.MyCommand.Path

SetCurDir(Split-Path $script:MyInvocation.MyCommand.Path -parent)

Set-Variable CONSTANT1 -Option Constant -Value 100

# If title is "", a blank line is NOT printed.
# If message is "", a blank line is printed.
# So, if you don't need both title and message, omit title.
# Yes = 0, No = 1
if ($host.ui.PromptForChoice("", "Do you wish to continue?", [System.Management.Automation.Host.ChoiceDescription[]]((New-Object System.Management.Automation.Host.ChoiceDescription "&Yes"), (New-Object System.Management.Automation.Host.ChoiceDescription "&No")), 1) -eq 1) { return }

Read-Host
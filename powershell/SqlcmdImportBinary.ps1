Set-StrictMode -Version Latest

function SetCurDir($path)
{
    Set-Location $path
    [System.IO.Directory]::SetCurrentDirectory($path)
}

function AddPsSnapInIfNotExist($snapIn)
{
    if (!(Get-PSSnapin | Where-Object { $_.Name -eq $snapIn })) { Add-PSSnapin $snapIn }
}
 
AddPsSnapInIfNotExist 'SqlServerCmdletSnapin100'
AddPsSnapInIfNotExist 'SqlServerProviderSnapin100'
 
$Host.UI.RawUI.WindowTitle = $MyInvocation.MyCommand.Path
SetCurDir(Split-Path $script:MyInvocation.MyCommand.Path -parent)

if ($host.ui.PromptForChoice("", "Do you wish to continue?", [System.Management.Automation.Host.ChoiceDescription[]]((New-Object System.Management.Automation.Host.ChoiceDescription "&Yes"), (New-Object System.Management.Automation.Host.ChoiceDescription "&No")), 1) -eq 1) { return }

function GetHex($binaryPath)
{
    # Strings without 0x prefix cannot be loaded into varbinary(max) fields of SQL Server.
    '0x' + [System.BitConverter]::ToString([System.IO.File]::ReadAllBytes($binaryPath)).Replace("-", "")
}

$server = 'server1'
$database = 'database1'
$username = 'username1'
$password = 'password1'
$binaryFile = 'foo.docx'
$hex = GetHex($binaryFile)
$query = "UPDATE Table1 SET Column1 = $hex WHERE Key = 'key1'"

Invoke-Sqlcmd -ServerInstance $server -Database $database -Username $username -Password $password -Query $query

Read-Host
# PowerShell Version
$PSVersionTable.PSVersion

# Grep
Get-ChildItem -Recurse | Select-String -Pattern FindMe

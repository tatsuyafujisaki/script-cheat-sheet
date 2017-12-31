$yyyymmdd = Get-Date -format "yyyyMMdd"

function CombineUri($uri1, $uri2)
{
    $uri1.TrimEnd('/') + '/' + $uri2.TrimStart('/')
}

function MakeDirIfNotExist($path)
{
    if (! (Test-Path $path)) { mkdir $path }
}

function SetCurDir($path)
{
    Set-Location $path
    [System.IO.Directory]::SetCurrentDirectory($path)
}

function GetCurDir()
{
    if ($pwd.Path -ne [System.IO.Directory]::GetCurrentDirectory())
    {
         throw '$pwd and [System.IO.Directory]::GetCurrentDirectory() should be kept the same.'
    }
    $pwd.Path
}

function GetScriptDir()
{
    Split-Path $script:MyInvocation.MyCommand.Path -parent
}

function GetTemporaryDir()
{
    Join-Path $Env:Temp ([system.guid]::newguid().tostring())
}

# Does not work when the desktop path is tinkered in registry.
function GetDesktopPath1()
{
    [Environment]::GetFolderPath('Desktop')
}

# Always works
function GetDesktopPath2()
{
    Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders' | Select -ExpandProperty Desktop
}

function ListSpecialFolders
{
    [enum]::GetNames([System.Environment+SpecialFolder]) | Sort
}

function GetRightmostDir([string]$path)
{
    Split-Path -Leaf $path
}

function GetRightmostDirOfUri([string]$uri)
{
    $url.Split('/')[-1]
}

function RemoveDirsWithoutPrompt([string]$dir)
{
    Remove-Item -Recurse $dir
}

function RemoveBlankLines($path)
{
    Get-Content $path | Where-Object {$_ -ne ""}
}

function RemoveDotFiles()
{
    Get-ChildItem -include .* -recurse -force | Remove-Item -force
}

function RemoveEmptyDirs([string]$root = '.')
{
    foreach($item in (Get-ChildItem $root))
    {
        if($item.PSIsContainer)
        {
            RemoveEmptyDirs $item.FullName
            if (!(Get-ChildItem $item.FullName))
            {
                Remove-Item $item.FullName -Confirm:$false
            }
        }
    }
}

function ReadFile([string]$path)
{
    Get-Content -Encoding UTF8 $path | Out-String
}

function WriteFile([string]$file, [string]$s)
{
    Set-Content -Encoding UTF8 -Path $file $s
}

# $dir = 'C:\dir1'
# $ext = '*.txt'
function DoSomethingWithFilesInDirectory([string]$dir, [string]$ext)
{
    foreach($file in [System.IO.Directory]::GetFiles($dir, $ext)) {}
}

# $old='.txt'
# $new='.ps1'
function ConvertExtensions($oldExt, $newExt)
{
    foreach($fileName in [System.IO.Directory]::GetFiles((Split-Path $MyInvocation.MyCommand.Path -Parent)))
    {
        if ([System.IO.Path]::GetExtension($fileName) -eq $oldExt)
        {
            Rename-Item $fileName ([System.IO.Path]::ChangeExtension($fileName, $newExt))
        }
    }
}

function ConvertMultipleSpacesToSingleSpace()
{
    foreach($file in [System.IO.Directory]::GetFiles((Split-Path $MyInvocation.MyCommand.Path -Parent)))
    {
        if ([System.IO.Path]::GetExtension($file) -eq '.txt')
        {
            $s = Get-Content $file
            while ($s.Contains('  ')){ $s = $s -replace '  ', ' ' }
            Set-Content -Encoding String $file $s
            # Use "Set-Content -Encoding String" to avoid mojibake
            # http://technet.microsoft.com/en-us/library/hh847827.aspx            
        }
    }
}

# AddPsSnapInIfNotExist 'SqlServerCmdletSnapin100'
# AddPsSnapInIfNotExist 'SqlServerProviderSnapin100'
function AddPsSnapInIfNotExist($snapIn)
{
    if (!(Get-PSSnapin | Where-Object { $_.Name -eq $snapIn })) { Add-PSSnapin $snapIn }
}
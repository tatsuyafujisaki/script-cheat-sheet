$extension = '.txt'

$dict = @{}
$dict.Add('old', 'new')

foreach($fileName in [System.IO.Directory]::GetFiles((Split-Path $MyInvocation.MyCommand.Path -Parent)))
{
    if ([System.IO.Path]::GetExtension($fileName) -eq $extension)
    {
        foreach($key in $dict.keys)
        {
            # "-Encoding String" is to avoid mojibake.
            # https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/set-content
            (Get-Content $fileName) -Replace $key, $dict.$key | Set-Content -Encoding String $fileName
        }
    }
}

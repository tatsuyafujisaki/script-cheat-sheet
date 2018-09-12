function export($ext) {
    $_.Export((Join-Path $outDir ([System.IO.Path]::GetFileName($filePath))) + "." + $_.Name + $ext + '.vb')
}

$outputPath = 'path\to\output\dir'
$excelExts='.xlam','.xlsm','.xla','.xls'

$Host.UI.RawUI.WindowTitle = $MyInvocation.MyCommand.Path

$curDir = Split-Path $MyInvocation.MyCommand.Path -parent
$outDir = Join-Path $curDir "output"

New-Item $outDir -itemType Directory -force | Out-Null

Stop-Process -processname 'Excel' -ErrorAction SilentlyContinue

$excel = New-Object -ComObject Excel.Application
$excel.DisplayAlerts = $false

foreach ($filePath in [System.IO.Directory]::GetFiles($curDir, "*", [System.IO.SearchOption]::AllDirectories)) {
    foreach ($excelExt in $excelExts) {
        if ([System.IO.Path]::GetExtension($filePath) -eq $excelExt) {
            $excel.Workbooks.Open($filePath) | % {
                $_.VBProject.VBComponents | % {
                    if ($_.Type -eq [Microsoft.Vbe.Interop.vbext_ComponentType]::vbext_ct_StdModule) {
                        export(".bas")
                    } elseif (($_.Type -eq [Microsoft.Vbe.Interop.vbext_ComponentType]::vbext_ct_Document) -or ($_.Type -eq [Microsoft.Vbe.Interop.vbext_ComponentType]::vbext_ct_ClassModule)) {
                        export(".cls")
                    } elseif ($_.Type -eq [Microsoft.Vbe.Interop.vbext_ComponentType]::vbext_ct_MSForm) {
                        export(".frm")
                    }
                }
            }
        }
    }
}

$excel.Quit()
[System.Runtime.InteropServices.Marshal]::ReleaseComObject($excel)
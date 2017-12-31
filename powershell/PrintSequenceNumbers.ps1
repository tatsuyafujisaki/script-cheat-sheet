$start = 1
$end = 10

$ns = ''
foreach ($n in $start..$end) { $ns = $ns + ',' + $n }
$ns.substring(1) # Skip first comma

Write-Host

foreach ($n in $start..$end) { $n }
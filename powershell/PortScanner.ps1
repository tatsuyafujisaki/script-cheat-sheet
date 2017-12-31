$tc = New-Object System.Net.Sockets.TcpClient
$tc.Connect("example.com", 443)
$tc.Connected
$tc.Close()

[System.Console]::ReadKey()

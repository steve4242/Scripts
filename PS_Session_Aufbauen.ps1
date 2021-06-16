# Baut eine PS-Session zum Server auf:

$server = "192.168.4.195"
$cred = $host.ui.PromptForCredential("Need credentials", "Please enter your user name and password.", "", "NetBiosUserName")
$s = New-PSSession -Get-CredentialcomputerName $server -credential $cred

# Führt den Befehl aus (im Scriptblock wird der gewünschte Befehl eingefügt):
Invoke-Command -Session $s -Scriptblock {



    Get-VM -ComputerName $hosts | Select-Object name, state 
    


}

# Remote Session beenden
Remove-PSSession $s
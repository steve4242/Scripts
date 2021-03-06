
# Angabe der Creds, am besten ein Domain Admin:
#$cred = Get-Credential

#$password = ConvertTo-SecureString “Ichwilldoch!1” -AsPlainText -Force
#$Cred = New-Object System.Management.Automation.PSCredential (“sal\biedstadm”, $password)
$cred = Get-Credential

# Auf welchen Servern soll das Script ausgeführt werden:
$servers = @("arnodc1", "chemdc1", "sa22dc1", "svatschidc1", "svatsmwdc1", "svatwmendc1", "svatumkldc1", "svatwmledc1", "svatwmlidc1", "svbudwdc1", "svrosmkrdc1", "svsksmskdc1", "szomdc1", "salsvattsadc1", "SVHRSMHRDC1")

# Schleife, welche alle Server durchgeht:
foreach($server in $servers) {

    # Baut eine PS-Session zum Server auf:
    $s = New-PSSession -computerName $server -credential $cred

        # Führt den Befehl aus (im Scriptblock wird der gewünschte Befehl eingefügt):
        Invoke-Command -Session $s -Scriptblock {
        
        Restart-Computer -Force


        }

    # Remote Session beenden
    Remove-PSSession $s
}






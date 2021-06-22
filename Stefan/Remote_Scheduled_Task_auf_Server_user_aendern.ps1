
# Angabe der Creds, am besten ein Domain Admin:
$cred = Get-Credential

# Auf welchen Servern soll das Script ausgeführt werden:
$servers = @("svatsmwdc1")

# Schleife, welche alle Server durchgeht:
foreach($server in $servers) {

    # Baut eine PS-Session zum Server auf:
    $s = New-PSSession -computerName $server -credential $cred

        # Führt den Befehl aus (im Scriptblock wird der gewünschte Befehl eingefügt):
        Invoke-Command -Session $s -Scriptblock {
        
        Add-WindowsFeature RSAT-AD-PowerShell 
        Install-ADServiceAccount -Identity "tasks_services" 

        schtasks /change /TN \AD_DPW_Import /RU SAL\tasks_services$ /RP




        }

    # Remote Session beenden
    Remove-PSSession $s
}






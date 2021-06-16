
# Angabe der Creds, am besten ein Domain Admin:
$cred = Get-Credential

# Auf welchen Servern soll das Script ausgeführt werden:
$servers = @("arnodc1", "smsdc1", "kramdc1", "SVATLEOGDC1", "SVATWMENDC1", "SVATUMKLDC1", "SVATINZDC1", "SVATWMLIDC1", "SVATSCHIDC1", "SVATWMLIDC1", "SVATGRAZDC1", "SVATUMKLDC1", "SVATLEOGDC1", "SVATWMLEDC1", "svatsawrdc1")

# Schleife, welche alle Server durchgeht:
foreach($server in $servers) {

    # Baut eine PS-Session zum Server auf:
    $s = New-PSSession -computerName $server -credential $cred

        # Führt den Befehl aus (im Scriptblock wird der gewünschte Befehl eingefügt):
        Invoke-Command -Session $s -Scriptblock {
        $Trigger= New-ScheduledTaskTrigger -At 10:00pm –Daily # Wann soll der Task ausgeführt werden
        $User= "NT AUTHORITY\SYSTEM" # Account mit welchen der Task ausgeführt wird
        $Action= New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "Invoke-DhcpServerv4FailoverReplication -force" # was soll ausgeführt werden (Code oder Script)
        Register-ScheduledTask -TaskName "DHCPFailoverSync" -Trigger $Trigger -User $User -Action $Action -RunLevel Highest –Force # Name vom Task

        ######################################
        # mit Set-ScheduledTask -TaskName "DHCPFailoverSync" -Trigger $Trigger -User $User -Action $Action # Name vom Task kann man einen bestehenden Task gearbeiten
        ######################################

        }

    # Remote Session beenden
    Remove-PSSession $s
}








while ($true) {
    if ((Get-Process -Name ebdfu -ErrorAction SilentlyContinue) -eq $null) {

        Write-Host -ForegroundColor Red "DFÜ Status: NICHT OK"
        Write-Host -ForegroundColor Red "DFÜ wird gestartet ..... "
        Start-Process -FilePath "ebankdfu.exe" -WorkingDirectory "C:\EBanking"
        

    }
    else {
        write-host -ForegroundColor Green "DFÜ Status: OK"
    }

    Start-Sleep -Seconds 300
}
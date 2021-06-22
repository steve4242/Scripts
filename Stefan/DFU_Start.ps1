If (-NOT (Get-Process -name "ebdfu" -ErrorAction SilentlyContinue)) { 
    Write-Host "Launch application"
    Start-Process -FilePath "ebankdfu.exe" -WorkingDirectory "C:\EBanking"
}
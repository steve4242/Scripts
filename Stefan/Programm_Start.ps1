$processToCheck = "ebdfu"
$process = Get-Process $processToCheck
If (!($process)) {
    Start-Process -FilePath "ebankdfu.exe" -WorkingDirectory "C:\EBanking"
}
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://smwmail2.sal.co.at/PowerShell/ -Authentication Kerberos
Import-PSSession $Session -DisableNameChecking - NoExit
#Write-Host " ";
#Write-Host "nach dem Arbeiten am Server mit " -NoNewline;
#Write-Host "Remove-PSSession `$Session" -ForegroundColor Red -NoNewline;
#Write-Host " aussteigen, erst dann Powershell schließen" -NoNewline;
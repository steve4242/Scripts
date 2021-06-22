$cred = Get-Credential
Get-ScheduledTask | Where-Object { $_.TaskName -eq "DFÜ-Modul"} | Set-ScheduledTask -User $cred.UserName -Password $cred.GetNetworkCredential().Password
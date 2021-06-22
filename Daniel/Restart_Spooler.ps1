Restart-Service -Name Spooler -Force -WhatIf
Get-Service Spooler | Select-Object -Expand dependentservices | Where-Object {$_.Status -eq "Stopped"} | Start-Service -WhatIf
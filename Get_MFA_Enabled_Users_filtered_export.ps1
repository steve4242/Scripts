# ! Voraussetzung für die Verwendung ist das MS Online Modul. Dieses kann mit "Install-Module MSOnline" als Admin installiert werden.
# mit MS Online verbinden > UPN, PW und MFA wird abgefragt
Connect-MsolService
# Abfrage der User und Authentifizierungsmethoden. Es wird nach aktiven Usern gefiltert.
Get-MsolUser -All -EnabledFilter EnabledOnly |
        Select-Object DisplayName, @{N = "MFAStatus"; E = {
                        if ( $_.StrongAuthenticationMethods.IsDefault -eq $true) {
                                ($_.StrongAuthenticationMethods | Where-Object IsDefault -EQ $True).MethodType
                        } else {
                                "Disabled" 
                        } 
                }
        } | Where-Object { ($_.MFAStatus -notlike "Disabled") } |
# Das Ergebnis wird mit aktuellem Datum in den Home Folder des Abfrageusers gespeichert.
        Export-Csv -NoTypeInformation -Delimiter ";" -Encoding Default $env:homedrive\MFA_enabled_Users_$((Get-Date).ToString('dd.MM.yyyy')).csv
# Hinweis, wo die Datei zu finden ist
Write-Output "Die Datei $env:homedrive\MFA_enabled_Users_$((Get-Date).ToString('dd.MM.yyyy')).csv wurde erstellt"
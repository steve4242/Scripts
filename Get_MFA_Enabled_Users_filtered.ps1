# ! Voraussetzung für die Verwendung ist das MS Online Modul. Dieses kann mit "Install-Module MSOnline" als Admin installiert werden.
# mit MS Online verbinden > UPN, PW und MFA wird abgefragt
Connect-MsolService
# Abfrage der User und Authentifizierungsmethoden. Es wird nach aktiven Usern gefiltert.
Get-MsolUser -All -EnabledFilter EnabledOnly |
Select-Object DisplayName, @{N = "MFAStatus"; E = { if ( $_.StrongAuthenticationMethods.IsDefault -eq $true) {
            ($_.StrongAuthenticationMethods |
                Where-Object IsDefault -eq $True).MethodType
        }
        else { "Disabled" } }
} |
Where-Object { ($_.MFAStatus -notlike "Disabled") } |
# Ergebnis wird als Tabelle formatiert ausgegeben.
Format-Table -AutoSize
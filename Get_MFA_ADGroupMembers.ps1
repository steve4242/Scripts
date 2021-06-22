# Sucht nach allen Mitgliedern in der Gruppe GG_Azure_MFA und piped das Ergebnis in Get-ADUser
Get-ADGroup -Identity GG_Azure_MFA -Properties members |
Select-Object -ExpandProperty members |
Get-ADUser -Properties DisplayName |
#Filtert nach aktivierten Objekten und wählt zur Anzeige nur den Displayname aus
Where-Object -Property enabled |
Select-Object DisplayName |
#Gibt das Ergebnis als Tabelle aus
Format-Table -AutoSize
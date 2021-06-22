# ! Muss als Admin auf einem PC mit RSAT Tools ausgeführt werden
# Es werden nur aktivierte Computerelemente zurückgegeben
(Get-ADComputer -Filter {(OperatingSystem -like "*windows*server*") -and (Enabled -eq "True") -and (Name -like"*fp*")}).Name
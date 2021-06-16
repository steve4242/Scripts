$Servers = (Get-ADComputer -Filter {(OperatingSystem -like "*windows*server*") -and (Enabled -eq "True")}).Name
    ForEach ($Server in $Servers) {
    schtasks.exe /query /s $Server /V /FO CSV | ConvertFrom-Csv | Where-Object {$_."Als Benutzer ausführen" -eq "sal\Administrator"} | select Hostname,Aufgabenname,"Status der geplanten Aufgabe","Als Benutzer ausführen"
    }
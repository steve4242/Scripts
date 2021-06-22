# Importiert die CSV Datei, diese muss zumindest die Spalte "samAccountname" beinhalten und dementsprechend angepasst werden.
$members = Import-CSV "H:\E3_lizenzierte_User_HQ22_edit.csv" -Encoding Default
# Die Schleife geht jede Zeile der CSV Datei durch und entfernt den User anhand des samAccountname aus der angegebenen Gruppe (muss angepasst werden).
$members | ForEach-Object {Remove-Adgroupmember -Identity "GG_Microsoft365E3-Lizenz" -members $_.samAccountname -Confirm:$false}
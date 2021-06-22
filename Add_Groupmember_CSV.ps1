# Importiert die CSV Datei, diese muss zumindest die Spalte "samAccountname" beinhalten und dementsprechend angepasst werden.
$members = Import-CSV "H:\E3_lizenzierte_User_HQ22_edit.csv" -Encoding Default
# Die Schleife geht jede Zeile der CSV Datei durch und fügt den User anhand des samAccountname der angegebenen Gruppe hinzu (muss angepasst werden).
$members | ForEach-Object {add-Adgroupmember -Identity "GG_Microsoft365E5-Lizenz" -members $_.samAccountname}
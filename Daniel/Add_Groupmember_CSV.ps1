$members = Import-CSV "H:\E3_lizenzierte_User_HQ22_edit.csv" -Encoding Default
$members | ForEach-Object {add-Adgroupmember -Identity "GG_Microsoft365E5-Lizenz" -members $_.samAccountname}
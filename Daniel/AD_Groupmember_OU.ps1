get-adgroupmember "GG_Microsoft365E3-Lizenz" |
Where-Object { $_.distinguishedName -like "*OU=SA14,OU=AT,DC=sal,DC=co,DC=at" } |
Select-Object Name, samAccountname |
Export-Csv -Encoding Default -NoTypeInformation -Path H:\E3_lizenzierte_User_HQ22.csv -Append
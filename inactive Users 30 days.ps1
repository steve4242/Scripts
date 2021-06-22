# Sucht nach allen aktivierten Usern in einer bestimmten OU (Searchbase muss angepasst werden).
Get-ADUser -SearchBase "OU=AT,dc=sal,dc=co,dc=at" -Filter * -Properties LastLogonDate,samaccountname,physicalDeliveryOfficeName |
Where-Object {$_.enabled} |
# ! AddDays mit Minus angeben.
Where-Object {$_.LastLogonDate -lt (Get-Date).AddDays(-30)} |
Select-Object givenname,surname,userprincipalname,samaccountname,physicalDeliveryOfficeName |
# Ergebnis wird als Tabelle formatiert ausgegeben.
Format-Table -AutoSize
<# das Ergebnis kann auch mit
Export-Csv -NoTypeInformation -Encoding UTF8 c:\Temp\inactive_Users_201023.csv
exportiert werden. Der Pfad und Dateiname muss dementsprechend angepasst werden. #>
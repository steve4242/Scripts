Get-ADUser -SearchBase "OU=AT,dc=sal,dc=co,dc=at" -Filter * -Properties LastLogonDate,samaccountname,physicalDeliveryOfficeName |
where {$_.enabled} |
Where-Object {$_.LastLogonDate -lt (Get-Date).AddDays(-30)} |
Select-Object givenname,surname,userprincipalname,samaccountname,physicalDeliveryOfficeName |
Export-Csv -NoTypeInformation -Encoding UTF8 c:\Temp\inactive_Users_201023.csv
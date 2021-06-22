Get-ADUser -Filter * -Properties title,givenname,surname,mobilephone,emailaddress,company,postalcode,city,streetaddress,officephone,pager,homepage,initials,department,office,country,state,fax,description,userprincipalname,DistinguishedName |
Where-Object {$_.Enabled -like "true"} |
Select-Object title,givenname,surname,mobilephone,emailaddress,company,postalcode,city,streetaddress,officephone,pager,homepage,initials,department,office,country,state,fax,description,userprincipalname,DistinguishedName |
Export-Csv -NoTypeInformation C:\temp\Userdaten.csv
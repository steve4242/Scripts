$OUpath = 'OU=Benutzer,OU=SMSK,OU=SK,DC=sal,DC=co,DC=at'
Get-ADUser -Filter 'enabled -eq $true' -SearchBase $OUpath | Select-object SamAccountname, Name
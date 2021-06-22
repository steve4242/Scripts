Import-Csv -Encoding UTF8 -Delimiter ";" -Path C:\Temp\Test_Replace.csv | ForEach {
  $csv = $_
  Get-ADUser -Filter "UserPrincipalName -eq '$($csv.UserPrincipalName)'" |
    Set-ADUser -Replace @{extensionattribute6="$($csv.extensionattribute6)"}
}
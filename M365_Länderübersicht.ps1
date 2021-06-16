function Show-Menu
{
     param (
           [string]$Title = 'M365 E3 + ATP Lizenzübersicht'
     )
     cls
     Write-Host "================ $Title ================"
    
     Write-Host "1: Übersicht"
     Write-Host "2: M365 Lizenzen AT Exportieren"
     Write-Host "3: M365 Lizenzen DE Exportieren"
     Write-Host "4: M365 Lizenzen HR Exportieren"
     Write-Host "5: M365 Lizenzen PL Exportieren"
     Write-Host "6: M365 Lizenzen RO Exportieren"
     Write-Host "7: M365 Lizenzen RS Exportieren"
     Write-Host "8: M365 Lizenzen SK Exportieren"
     Write-Host "9: M365 Lizenzen SLO Exportieren"
     Write-Host "10: M365 Lizenzen CZ Exportieren"
     Write-Host "11: M365 Lizenzen HU Exportieren"
     Write-Host "q: Beenden"
     Write-Host " "
}

do
{
     Show-Menu
     $input = Read-Host "Bitte eine Auswahl treffen"
     switch ($input)
     {
           '1' {
                cls
                Write-Host 'Bitte warten, die Berechnung dauert einen Moment'

$ht = [ordered]@{
  'Österreich' = (get-adgroupmember "GG_Microsoft365E3-Lizenz" | where {($_.distinguishedName -like "*OU=AT,DC=sal,DC=co,DC=at") -or ($_.distinguishedName -like "*OU=Externe Benutzer,DC=sal,DC=co,DC=at") -or ($_.distinguishedName -like "*OU=Admin,DC=sal,DC=co,DC=at") -or ($_.distinguishedName -like "*OU=ABS,DC=sal,DC=co,DC=at") -or ($_.distinguishedName -like "*OU=TSA,DC=sal,DC=co,DC=at") -or ($_.distinguishedName -like "*OU=Wozabal,DC=sal,DC=co,DC=at")} ).count
  'Deutschland' = (get-adgroupmember "GG_Microsoft365E3-Lizenz" | where {$_.distinguishedName -like "*OU=DE,DC=sal,DC=co,DC=at"} ).count
  'Kroatien' = (get-adgroupmember "GG_Microsoft365E3-Lizenz" | where {$_.distinguishedName -like "*OU=HR,DC=sal,DC=co,DC=at"} ).count
  'Polen' = (get-adgroupmember "GG_Microsoft365E3-Lizenz" | where {$_.distinguishedName -like "*OU=PL,DC=sal,DC=co,DC=at"} ).count
  'Rumänien' = (get-adgroupmember "GG_Microsoft365E3-Lizenz" | where {$_.distinguishedName -like "*OU=RO,DC=sal,DC=co,DC=at"} ).count
  'Serbien' = (get-adgroupmember "GG_Microsoft365E3-Lizenz" | where {$_.distinguishedName -like "*OU=SRB,DC=sal,DC=co,DC=at"} ).count
  'Slowakei' = (get-adgroupmember "GG_Microsoft365E3-Lizenz" | where {$_.distinguishedName -like "*OU=SK,DC=sal,DC=co,DC=at"} ).count
  'Slowenien' = (get-adgroupmember "GG_Microsoft365E3-Lizenz" | where {$_.distinguishedName -like "*OU=SLO,DC=sal,DC=co,DC=at"} ).count
  'Tschechien' = (get-adgroupmember "GG_Microsoft365E3-Lizenz" | where {$_.distinguishedName -like "*OU=CZ,DC=sal,DC=co,DC=at"} ).count
  'Ungarn' = (get-adgroupmember "GG_Microsoft365E3-Lizenz" | where {$_.distinguishedName -like "*OU=HUN,DC=sal,DC=co,DC=at"} ).count
  'Gesamt' = (get-adgroupmember "GG_Microsoft365E3-Lizenz" | where {$_.distinguishedName -like "*DC=sal,DC=co,DC=at"} ).count
}

$lizenzland = New-Object -Type PSObject -Property $ht

cls

Write-Host 'M365 Lizenzübersicht' $((Get-Date).ToString('dd.MM.yyy')) -NoNewline

$lizenzland

Write-Host 'AD Gruppe: GG_Microsoft365E3-Lizenz'
Write-Host ' '
           } '2' {
                cls
                Write-Host Userliste wird nach C:\Temp\M365_Lizenzen_AT_$((Get-Date).ToString('dd.MM.yyy')).csv exportiert
                Write-Host ' '
                get-adgroupmember "GG_Microsoft365E3-Lizenz" | where {($_.distinguishedName -like "*OU=AT,DC=sal,DC=co,DC=at") -or ($_.distinguishedName -like "*OU=Externe Benutzer,DC=sal,DC=co,DC=at") -or ($_.distinguishedName -like "*OU=Admin,DC=sal,DC=co,DC=at") -or ($_.distinguishedName -like "*OU=ABS,DC=sal,DC=co,DC=at") -or ($_.distinguishedName -like "*OU=TSA,DC=sal,DC=co,DC=at") -or ($_.distinguishedName -like "*OU=Wozabal,DC=sal,DC=co,DC=at")} | Get-ADUser -Properties * | Select-Object title,givenname,sn,personaltitle,description,emailaddress,telephonenumber,mobile | export-csv -NotypeInformation -Delimiter ";" -Encoding Default C:\Temp\M365_Lizenzen_AT_$((Get-Date).ToString('dd.MM.yyy')).csv
           } '3' {
                cls
                Write-Host Userliste wird nach C:\Temp\M365_Lizenzen_DE_$((Get-Date).ToString('dd.MM.yyy')).csv exportiert
                Write-Host ' '
                get-adgroupmember "GG_Microsoft365E3-Lizenz" | where {$_.distinguishedName -like "*OU=DE,DC=sal,DC=co,DC=at"} | Get-ADUser -Properties * | Select-Object title,givenname,sn,personaltitle,description,emailaddress,telephonenumber,mobile | export-csv -NotypeInformation -Delimiter ";" -Encoding Default C:\Temp\M365_Lizenzen_DE_$((Get-Date).ToString('dd.MM.yyy')).csv
           } '4' {
                cls
                Write-Host Userliste wird nach C:\Temp\M365_Lizenzen_HR_$((Get-Date).ToString('dd.MM.yyy')).csv exportiert
                Write-Host ' '
                get-adgroupmember "GG_Microsoft365E3-Lizenz" | where {$_.distinguishedName -like "*OU=HR,DC=sal,DC=co,DC=at"} | Get-ADUser -Properties * | Select-Object title,givenname,sn,personaltitle,description,emailaddress,telephonenumber,mobile | export-csv -NotypeInformation -Delimiter ";" -Encoding Default C:\Temp\M365_Lizenzen_HR_$((Get-Date).ToString('dd.MM.yyy')).csv
           } '5' {
                cls
                Write-Host Userliste wird nach C:\Temp\M365_Lizenzen_PL_$((Get-Date).ToString('dd.MM.yyy')).csv exportiert
                Write-Host ' '
                get-adgroupmember "GG_Microsoft365E3-Lizenz" | where {$_.distinguishedName -like "*OU=PL,DC=sal,DC=co,DC=at"} | Get-ADUser -Properties * | Select-Object title,givenname,sn,personaltitle,description,emailaddress,telephonenumber,mobile | export-csv -NotypeInformation -Delimiter ";" -Encoding Default C:\Temp\M365_Lizenzen_PL_$((Get-Date).ToString('dd.MM.yyy')).csv
           } '6' {
                cls
                Write-Host Userliste wird nach C:\Temp\M365_Lizenzen_RO_$((Get-Date).ToString('dd.MM.yyy')).csv exportiert
                Write-Host ' '
                get-adgroupmember "GG_Microsoft365E3-Lizenz" | where {$_.distinguishedName -like "*OU=RO,DC=sal,DC=co,DC=at"} | Get-ADUser -Properties * | Select-Object title,givenname,sn,personaltitle,description,emailaddress,telephonenumber,mobile | export-csv -NotypeInformation -Delimiter ";" -Encoding Default C:\Temp\M365_Lizenzen_RO_$((Get-Date).ToString('dd.MM.yyy')).csv
           } '7' {
                cls
                Write-Host Userliste wird nach C:\Temp\M365_Lizenzen_RS_$((Get-Date).ToString('dd.MM.yyy')).csv exportiert
                Write-Host ' '
                get-adgroupmember "GG_Microsoft365E3-Lizenz" | where {$_.distinguishedName -like "*OU=SRB,DC=sal,DC=co,DC=at"} | Get-ADUser -Properties * | Select-Object title,givenname,sn,personaltitle,description,emailaddress,telephonenumber,mobile | export-csv -NotypeInformation -Delimiter ";" -Encoding Default C:\Temp\M365_Lizenzen_RS_$((Get-Date).ToString('dd.MM.yyy')).csv
           } '8' {
                cls
                Write-Host Userliste wird nach C:\Temp\M365_Lizenzen_SK_$((Get-Date).ToString('dd.MM.yyy')).csv exportiert
                Write-Host ' '
                get-adgroupmember "GG_Microsoft365E3-Lizenz" | where {$_.distinguishedName -like "*OU=SK,DC=sal,DC=co,DC=at"} | Get-ADUser -Properties * | Select-Object title,givenname,sn,personaltitle,description,emailaddress,telephonenumber,mobile | export-csv -NotypeInformation -Delimiter ";" -Encoding Default C:\Temp\M365_Lizenzen_SK_$((Get-Date).ToString('dd.MM.yyy')).csv
           } '9' {
                cls
                Write-Host Userliste wird nach C:\Temp\M365_Lizenzen_SLO_$((Get-Date).ToString('dd.MM.yyy')).csv exportiert
                Write-Host ' '
                get-adgroupmember "GG_Microsoft365E3-Lizenz" | where {$_.distinguishedName -like "*OU=SLO,DC=sal,DC=co,DC=at"} | Get-ADUser -Properties * | Select-Object title,givenname,sn,personaltitle,description,emailaddress,telephonenumber,mobile | export-csv -NotypeInformation -Delimiter ";" -Encoding Default C:\Temp\M365_Lizenzen_SLO_$((Get-Date).ToString('dd.MM.yyy')).csv
           } '10' {
                cls
                Write-Host Userliste wird nach C:\Temp\M365_Lizenzen_CZ_$((Get-Date).ToString('dd.MM.yyy')).csv exportiert
                Write-Host ' '
                get-adgroupmember "GG_Microsoft365E3-Lizenz" | where {$_.distinguishedName -like "*OU=CZ,DC=sal,DC=co,DC=at"} | Get-ADUser -Properties * | Select-Object title,givenname,sn,personaltitle,description,emailaddress,telephonenumber,mobile | export-csv -NotypeInformation -Delimiter ";" -Encoding Default C:\Temp\M365_Lizenzen_CZ_$((Get-Date).ToString('dd.MM.yyy')).csv
           } '11' {
                cls
                Write-Host Userliste wird nach C:\Temp\M365_Lizenzen_HU_$((Get-Date).ToString('dd.MM.yyy')).csv exportiert
                Write-Host ' '
                get-adgroupmember "GG_Microsoft365E3-Lizenz" | where {$_.distinguishedName -like "*OU=HUN,DC=sal,DC=co,DC=at"} | Get-ADUser -Properties * | Select-Object title,givenname,sn,personaltitle,description,emailaddress,telephonenumber,mobile | export-csv -NotypeInformation -Delimiter ";" -Encoding Default C:\Temp\M365_Lizenzen_HU_$((Get-Date).ToString('dd.MM.yyy')).csv
           } 'q' {
                return
           }
     }
     pause
}
until ($input -eq 'q')
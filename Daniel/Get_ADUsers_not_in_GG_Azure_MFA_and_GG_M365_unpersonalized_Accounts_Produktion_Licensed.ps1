#Select the group you want
$group = get-adgroup GG_Azure_MFA
$group2 = get-adgroup GG_M365_unpersonalized_Accounts
$group3 = get-adgroup GG_Microsoft365E3-Lizenz
$group4 = get-adgroup GG_Microsoft365F3-Lizenz
$ou = "OU=AT,DC=sal,DC=co,DC=at"
#Get all the active users, with the memberof property, and filter with a Where-Object where the DN of the group does not appear in the MemberOf Property
$ergebnis = get-aduser -SearchBase $ou -Properties memberof,mail,description,whenCreated -filter {(ObjectClass -eq "user") -and (Name -notlike "DiscoverySearchMailbox*") -and (Enabled -eq $true)} | Where-Object {$group.DistinguishedName -notin $_.memberof -and $group2.DistinguishedName -notin $_.memberof -and $_.distinguishedName -like "*Benutzer*" -and $_.distinguishedName -notlike "*Buero*"} | Where-Object {$group3.DistinguishedName -in $_.memberof -or $group4.DistinguishedName -in $_.memberof} | ft -AutoSize Name,Mail,Description,whenCreated
$ergebnis
Echo "Summe:"
($ergebnis).Count - 4
Echo ""
Read-Host "Press Enter to Exit"
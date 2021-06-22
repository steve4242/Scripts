#Select the group you want
$group = get-adgroup GG_Azure_MFA
$group2 = get-adgroup GG_M365_unpersonalized_Accounts
$ou = "OU=AT,DC=sal,DC=co,DC=at"
#Get all the active users, with the memberof property, and filter with a Where-Object where the DN of the group does not appear in the MemberOf Property
$ergebnis = get-aduser -SearchBase $ou -Properties memberof,mail,description,whenCreated -filter {(ObjectClass -eq "user") -and (Name -notlike "DiscoverySearchMailbox*") -and (Enabled -eq $true)} | Where-Object {$group.DistinguishedName -notin $_.memberof -and $group2.DistinguishedName -notin $_.memberof -and $_.distinguishedName -like "*Benutzer*" -and $_.distinguishedName -notlike "*Buero*"} | ft -AutoSize Name,Mail,Description,whenCreated
$ergebnis
Echo "Summe:"
($ergebnis).Count - 4
Echo ""
Read-Host "Press Enter to Exit"
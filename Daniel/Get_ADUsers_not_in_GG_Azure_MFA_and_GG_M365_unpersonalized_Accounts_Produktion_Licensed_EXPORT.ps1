#Select the group you want
$group = get-adgroup GG_Azure_MFA
$group2 = get-adgroup GG_M365_unpersonalized_Accounts
$group3 = get-adgroup GG_Microsoft365E3-Lizenz
$group4 = get-adgroup GG_Microsoft365F3-Lizenz
$ou = "OU=AT,DC=sal,DC=co,DC=at"
#Get all the active users, with the memberof property, and filter with a Where-Object where the DN of the group does not appear in the MemberOf Property
get-aduser -SearchBase $ou -Properties memberof,mail,description,whenCreated,lastLogonTimestamp -filter {(ObjectClass -eq "user") -and (Name -notlike "DiscoverySearchMailbox*") -and (Enabled -eq $true)} | Where-Object {$group.DistinguishedName -notin $_.memberof -and $group2.DistinguishedName -notin $_.memberof -and $_.distinguishedName -like "*Benutzer*" -and $_.distinguishedName -notlike "*Buero*"} | Where-Object {$group3.DistinguishedName -in $_.memberof -or $group4.DistinguishedName -in $_.memberof} | select Name,Mail,Description,whenCreated,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}} | Export-Csv -NoTypeInformation -Encoding Default C:\temp\ADUsers_not_in_GG_Azure_MFA_and_GG_M365_unpersonalized_Accounts_Produktion_Licensed.csv
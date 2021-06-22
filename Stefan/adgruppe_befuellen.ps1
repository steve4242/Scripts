$users = Get-ADUser -SearchBase "OU=Benutzer,OU=MATT,OU=AT,DC=sal,DC=co,DC=at" -Filter * | select-object saMAccountName

FOREACH ($user in $users) {
    Add-ADGroupMember -Identity GG_MATT_ALLUSERS -Members $user
}


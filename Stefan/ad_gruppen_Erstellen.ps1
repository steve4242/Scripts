$groups = Import-Csv ‘c:\Temp\drucker.csv‘
$member = "GG_SAWR_ALLUSERS"

foreach ($group in $groups) {
    New-ADGroup -Name "GG_adv-prt_$($group.name)" -Path “OU=ADV_Drucker,OU=Gruppen,DC=sal,DC=co,DC=at” -Description “\\sawrfp1.sal.co.at\$($group.name)” -GroupCategory Security -GroupScope Global
    Add-ADGroupMember -Identity "GG_adv-prt_$($group.name)" -Members $member
}
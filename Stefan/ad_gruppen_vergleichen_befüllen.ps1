
$betr = "MATT"
$usergroup = Get-ADGroup -Filter {name -like '*_ALLUSERS**'} | select-object saMAccountName
#$prtgroup = Get-ADGroup -Filter {name -like '*GG_adv-prt_**'} | select-object saMAccountName
#$prtgroup

#$prtgroup = Get-ADGroup -Filter {name -like '*GG_adv-prt_**'} | select-object saMAccountName


FOREACH($group in $usergroup){

    $prtgroup = Get-ADGroup -Filter {name -like '*GG_adv-prt_**'} | select-object saMAccountName

    if ($group.saMAccountName -match $prtgroup){
    write-host "PASST"
    }

}
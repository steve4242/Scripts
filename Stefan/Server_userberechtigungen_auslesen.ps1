$strLocalMachine = $env:computername

$arrLocalGroups = Get-CimInstance -ClassName Win32_Group -filter "Domain = '$strLocalMachine'"
$arrDomainGroups = Get-CimInstance -ClassName Win32_Group -filter "Domain = '[YOUR DOMAIN NAME HERE]'"

ECHO ""
ECHO "Local Groups"
ECHO ""

foreach($objLocalGroup in $arrLocalGroups)
{
$groupname = $objLocalGroup.Name

$group = [ADSI]"WinNT://./$groupname"
ECHO "-----$($objLocalGroup.caption)-----"
@($group.Invoke("Members")) | foreach {$_.GetType().InvokeMember("Name", 'GetProperty', $null, $_, $null)}
}


ECHO ""
ECHO "Domain Groups"
ECHO ""


foreach($objDomainGroup in $arrDomainGroups)
{
$groupname = $objDomainGroup.name

$groupmembers = Get-QADGroupMember $groupname
ECHO "-----$groupname-----"
foreach($entry in $groupmembers)
    {
    IF($entry.type -eq 'group')
        {
        Echo "$($entry.name)`n    GROUP MEMBERS"
        $subgroupmembers = Get-QADGroupMember $($entry.name)
        foreach($member in $subgroupmembers){ECHO "    $($member.name)"}
        }
    else{echo "$($entry.name)"}
    $entry = $null
    }
}
﻿# RemoveGroupMembership.ps1
# This script removes all disabled users from all security and distribution groups in specific OU


Import-Module ActiveDirectory

$searchOU = 'OU=Disabled,DC=company,DC=com'

Get-ADGroup -Filter 'GroupCategory -eq "Security" -or GroupCategory -eq "Distribution"' -SearchBase $searchOU | ForEach-Object{ $group = $_
	Get-ADGroupMember -Identity $group -Recursive | %{Get-ADUser -Identity $_.distinguishedName -Properties Enabled | ?{$_.Enabled -eq $false}} | ForEach-Object{ $user = $_
		$uname = $user.Name
		$gname = $group.Name
		Write-Host "Removing $uname from $gname" -Foreground Yellow
		Remove-ADGroupMember -Identity $group -Member $user -Confirm:$false
	}
}
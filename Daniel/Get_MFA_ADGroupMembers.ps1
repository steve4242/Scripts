Get-ADGroup -Identity GG_Azure_MFA -Properties members |
Select-Object -ExpandProperty members |
Get-ADUser -Properties DisplayName |
Where-Object -Property enabled |
Select-Object DisplayName |
Format-Table -AutoSize
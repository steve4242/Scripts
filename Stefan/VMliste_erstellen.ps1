$hosts = "192.168.4.195"
Get-VM -ComputerName $hosts | select name, state | Export-Csv -Path C:\temp\vmlist.csv -NoTypeInformation


Get-VM | select name, state | Export-Csv -Path C:\temp\vmlist.csv -NoTypeInformation
$DaysInactive = 90
$time = (Get-Date).Adddays(-($DaysInactive))

$computer = Get-ADComputer -Filter {LastLogonTimeStamp -lt $time} -ResultPageSize 2000 -resultSetSize $null -Properties Name, OperatingSystem, SamAccountName, DistinguishedName | export-csv C:\temp\oldpcs.csv
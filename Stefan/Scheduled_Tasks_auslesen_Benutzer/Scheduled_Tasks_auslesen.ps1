#servers = Get-ADComputer -filter * -SearchBase 'ou=Member Servers,ou=Site,dc=domain,dc=local' | Select -ExpandProperty dnshostname

cd c:\temp\tasks
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
$servers = Get-content C:\temp\tasks\servers.txt

foreach ($server in $servers){

.\Get-ScheduledTask.ps1 -computername $server  | Where-Object {$_.Author -like '*Administrator*'} | select author,name | Out-file -FilePath C:\temp\tasks\$server-tasks.txt -append

}
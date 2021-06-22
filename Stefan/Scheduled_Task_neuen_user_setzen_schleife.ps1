$tasks = Get-content C:\temp\tasks\taskname.txt

foreach ($task in $tasks) {

Get-ScheduledTask | Where-Object { $_.TaskName -eq $task} | Set-ScheduledTask -User $cred.UserName -Password $cred.GetNetworkCredential().Password

}
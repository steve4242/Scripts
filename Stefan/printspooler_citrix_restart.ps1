do
{
Write-Host 'Select destination server:'
Write-Host "0 - SRV1 `n1 - SRV2 `n2 - SRV3 `n3 - SRV4"
$optionSelected = Read-Host 'Do you want to use server?[0-19]'
Write-Host 'Are you sure you want to proceed? Write [Y] if you sure, press any key(witchout [Y]) if you wont to change choise.'
$wybor = Read-Host
}while($wybor -ne 'Y');
switch ($optionSelected) {

  { '0' -contains $_ } { $comp = 'SRV1' }
  { '1' -contains $_ } { $comp = 'SRV2' }
  { '2' -contains $_ } { $comp = 'SRV3' }
  { '3' -contains $_ } { $comp = 'SVR4' }
}

Invoke-Command -ComputerName $comp -ScriptBlock {
Get-WmiObject -Class Win32_PerfFormattedData_Spooler_PrintQueue | Select-Object -Property Name, @{
    Expression = {$_.jobs}
    Label      = 'Current Jobs'
} | Format-Table -AutoSize
$tekst = 'Service was restarted on {0}' -f $ServiceName
$ServiceName = 'Print Spooler'
$CitrixServiceName = 'CitrixXTEServer'
$arrService = Get-Service -Name $ServiceName
if (Get-Service $CitrixServiceName -ErrorAction SilentlyContinue){
    Write-Host 'Services CitrixXTEServer was stopped.'
    Stop-Service "CitrixXTEServer" -Force
    Write-Host 'Services UpSvc was stopped.'
    Stop-Service UpSvc -Force
    Write-Host 'Services Print Spooler was stopped.'
    Stop-Service Spooler -Force
    Start-Sleep -Seconds 5
    Start-Service Spooler
    Write-Host 'Services Print Spooler was started.'
    Start-Service CitrixXTEServer
    Write-Host 'Services CitrixXTEServer was started.'
    Start-Service UpSvc
    Write-Host 'Services UpSvc was started.'
}
else{
Write-Host $tekst
Restart-Service $ServiceName
Write-Host 'Service was restarted.'
}
if ($arrService.Status -eq 'Running')
{
    Write-Host 'Service is running.'
}
else
{
    Write-Host 'Service was stopped.'
    if ($arrService.Status -eq 'Stopped')
    {
    Start-Service $ServiceName
    Write-Host 'Service is running.'
    }
}
Write-Host "Script was stopped on 20 sec to correct check spooler."
Start-Sleep -Seconds 20
Get-WmiObject -Class Win32_PerfFormattedData_Spooler_PrintQueue | Select-Object -Property Name, @{
    Expression = {$_.jobs}
    Label      = 'Current Jobs'
} | Format-Table -AutoSize
}
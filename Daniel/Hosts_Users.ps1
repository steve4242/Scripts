Get-ADComputer -Filter {samaccountname -like "*NB*"} |
Select-Object -ExpandProperty name |
ForEach-Object {
    $computer = $_

    $pingme = Test-Connection -ComputerName $computer -Quiet -count 1
    
    if ($pingme -eq $true)
    {
        Get-UserSession $computer
    }
    else
    {
        Write-Host "computer '$computer' is offline"
    }
} |
#Format-Table
Export-Csv -Path "C:\Users\schoda\Documents\Hosts_Users.csv"
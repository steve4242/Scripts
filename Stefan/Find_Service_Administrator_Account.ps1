$head = @'
<style>
BODY{background-color:#012456;}
H2{color:White;}
TABLE{border-width: 2px;border-style: solid;border-color:white;border-collapse: collapse;}
TH{border-width: 2px;padding: 10px;border-style: solid;border-color:white;color:#FFFFFF;}
TD{border-width: 2px;padding: 10px;border-style: solid;border-color: white;color:white}
</style>
'@

$ifeverything_ok = $true

Get-Content C:\temp\Allwindows.csv |
ForEach-Object {
    $comp = $_
    try {
        $ErrorActionPreference = "Stop"
        
        $properties = @(
            @{Expression = { $_.systemName }; Label = "Server Name" },
            @{Expression = { $_.DisplayName }; Label = "Service Name" },
            @{Expression = { $_.Name }; Label = "Service" },
            @{Expression = { $_.StartName }; Label = "Account" },
            'State'
        )

        Get-WmiObject win32_service -ComputerName $comp -filter "StartName Like '%Administrator%'" |
        Select-Object -Property $Properties
        
        $comp | Out-File C:\Temp\Logs.txt -Append -Encoding ascii

    }
    Catch [system.exception] {
        $ifeverything_ok = $false
        $comp | Out-File C:\Temp\Logs.txt -Append -encoding ASCII
        Add-Content -Value $_.Exception -Path C:\Temp\Logs.txt
    }
} |
ConvertTo-Html -Head $head -Body "<H2>Service Accounts Running As Domain Administrator</H2>" |
Out-File C:\temp\ServerList.htm

Invoke-Expression C:\temp\ServerList.htm
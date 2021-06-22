[string[]]$servers = (Get-ADComputer -SearchBase "OU=Server, OU=Admin, DC=sal, DC=co, DC=at" -Filter * -Properties name).Name


foreach ($server in $servers) {    
    Get-CimInstance -ClassName SoftwareLicensingProduct -ComputerName $server |
        Where-Object PartialProductKey |
        Select-Object Pscomputername, Name, @{Name = 'LicenseStatus'; Exp = {
                switch ($_.LicenseStatus) {
                    0 { 'Unlicensed' }
                    1 { 'licensed' }
                    2 { 'OOBGrace' }
                    3 { 'OOTGrace' }
                    4 { 'NonGenuineGrace' }
                    5 { 'Notification' }
                    6 { 'ExtendedGrace' }
                    Default { 'Undetected' }
                }
                #EndOfCaltulatedProperty
            }
        }
}
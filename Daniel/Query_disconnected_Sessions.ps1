﻿param (
        #get current logged on username
        [string]$UserName = "baseadmin"
    )

    # Import the Active Directory module for the Get-ADComputer CmdLet
    Import-Module ActiveDirectory


    # Query Active Directory for enabled windows servers computer accounts and sort by name
    $Servers = Get-ADComputer -Filter {(OperatingSystem -like "*windows*server*") -and (Enabled -eq "True")} | Sort Name

    # Initiating variables
    $SessionList = $NULL
    $queryResults = $NULL
    $SError = $null
    $SDown = $null
    $z = 0

    # Get total number of servers
    $count = $Servers.count 


    # Start looping through each server at a time
    ForEach ($Server in $Servers) {    

        # initiate counter for showing progress
        $z = $z + 1

        $ServerName = $Server.Name

        # Start writing progress 
        Write-Progress -Activity "Processing Server: $z out of $count servers." -Status " Progress" -PercentComplete ($z/$Servers.count*100)

        # check if server is pingable before running the query on the server
        if (Test-Connection $Server.Name -Count 1 -Quiet) {  

            Write-Host "`n`n$ServerName is online!" -BackgroundColor Green -ForegroundColor Black

            Write-Host ("`nQuerying Server: `"$ServerName`" for disconnected sessions under UserName: `"" + $UserName.ToUpper() + "`"...") -BackgroundColor Gray -ForegroundColor Black

            # Store results in array
            [array]$queryResults += (

                # Query server for specific username
                query user $UserName /server:$ServerName | 
                foreach {
                    # Look for lines with Disc string to filter out active sessions
                    if ($_ -match "Disc") {

                        # format the output in CSV by replacing more than 2 spaces with a comman
                        write-output ("`n$ServerName," + (($_.trim() -replace ' {2,}', ',')))
                    }
                }
            )
        }
        # If server is not pingable show error message
        else {
            # Make list of server that are down.
            [array]$SDown += ($ServerName)
            Write-Host "`nError: Unable to connect to $ServerName!" -BackgroundColor red -ForegroundColor white
            Write-Host "Either the $ServerName is down or check for firewall settings on server $ServerName!" -BackgroundColor Yellow -ForegroundColor black
        }
    }

    # If there are some non pingable server then display the list
    if ($SDown -ne $null -and $SDown) {
            Write-Host "`nScript was unable to connect to the following server:" -ForegroundColor White -BackgroundColor Red
            $SDown
    }

    # Check if any disconnected session are stored in the array
    if ($queryResults -ne $null -and $queryResults) {

        # Convert the CSV fromat to table format with headers
        $QueryResultsCSV = $queryResults | ConvertFrom-Csv -Delimiter "," -Header "ServerName","UserName","SessionID","CurrentState","IdealTime","LogonTime"

        # Show the results on console
        $QueryResultsCSV |ft -AutoSize

        # Go through each Disconnected session stored in the array
        $QueryResultsCSV | foreach {

            # Grabb session ID and ServerName
            $Sessionl = $_.SessionID
            $Serverl = $_.ServerName

            # Show message on the console
            Write-Host "`nLogging off"$_.username"from $serverl..." -ForegroundColor black -BackgroundColor Gray
            sleep 2

            # Logout user using session ID
            logoff $Sessionl /server:$Serverl /v

        }
    }
    else {
        # if array is empty display message that no session were found
        Write-Host `n`n`n`n("*" * $LineSize)
        Write-Host "You are all good! No ghost sessions found!" -BackgroundColor Green -ForegroundColor Black
        Write-Host ("*" * $LineSize)
    }

    # Pause at the end so you can capture the output
    $null = Read-Host "`n`nScript execution finished, press enter to exit!"
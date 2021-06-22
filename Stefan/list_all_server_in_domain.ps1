#auflisten aller Server in der Domäne
Get-ADComputer -Filter {OperatingSystem -like "*windows*server*"} -Properties * | sort DNSHostname | ft DNSHostName, OperatingSystem -Wrap -Auto

#Exportieren eine Liste aller Server in der Domäne
Get-ADComputer -Filter {OperatingSystem -like "*windows*server*"} -Properties * | sort DNSHostname | select DNSHostName, OperatingSystem | Export-Csv -Path "$home\Desktop\ADServers.csv"
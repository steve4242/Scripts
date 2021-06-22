REM Befehlszeile wird verwendet, um einen Task auf den tasks_services User umzustellen. 
schtasks /change /TN "\Restart Spooler" /RU sal.co.at\tasks_services$ /RP
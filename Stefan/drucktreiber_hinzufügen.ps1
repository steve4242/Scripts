#Compa
pnputil.exe -i -a C:\Temp\drucker\compa\*.inf
Add-PrinterDriver -Name "Compa II 106/12"

#HPUniversial
pnputil.exe -i -a C:\Temp\drucker\hpuniversal\*.inf

Add-PrinterDriver -Name "HP Universal Printing PCL 6 (v6.6.5)"

#generic/text only
pnputil.exe -i -a C:\Temp\drucker\text\*.inf

Add-PrinterDriver -Name "Generic / Text Only"

Get-PrinterDriver

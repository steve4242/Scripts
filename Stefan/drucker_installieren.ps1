# Umdie CSV korrekt zu erstellen, muss man im Windows unter Systemsteuerung --> Region die Spracheinstellung auf "Englisch (Vereinigte Staaten)" setzen
# Damit speichert Excel die CSV Datei mit Beistrich anstatt mit Semikolon

# Links:
# https://stackoverflow.com/questions/54928690/adding-printer-to-print-server-via-powershell
# https://community.spiceworks.com/topic/1041578-powershell-script-to-add-port-and-create-share-printer-on-server-2012-r2
# https://www.action1.com/kb/working-with-printers-through-windows-powershell.html


#Importieren der CSV mit den Druckern
$PrinterList=IMPORT-CSV C:\temp\printer\printers.csv

FOREACH ($Printer in $PrinterList) { 

#Abfragen der bereits vorhandenen Drucker
$var = Get-Printer
    #Abfrage ob der Drucker bereits vorhanden ist
    If (($var.name -contains $Printer.Printername)-and ($var.portname -contains 
   $printer.IPAddress))
    {

        Write-Host "Drucker" $printer.PrinterName"bereits vorhanden!" -ForegroundColor Blue

    }
    Else
    {
        #Anlagen des Drucker mit den angaben in der CSV
        Add-PrinterPort -Name $Printer.PortName -PrinterHostAddress $Printer.PrinterIP
        Add-Printer -Name $Printer.PrinterName -DriverName $Printer.PrintDriver -PortName $Printer.PortName -Shared -ShareName $Printer.ShareName -Location $Printer.Location -Comment $Printer.Comment
    }
}


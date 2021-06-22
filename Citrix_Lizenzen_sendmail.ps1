#Filtert nach der neuesten CSV und schreibt den Pfad in eine Variable
$filename = Get-ChildItem -Path \\salctxfil1.salres.com\citrix$\DataTransfer\Licensing\ -File -Filter *.csv | 
Sort-Object LastWriteTime -Descending | Select-Object -First 1 -ExpandProperty FullName

#Import der CSV und letzte Zeile ausgeben
$file = Import-Csv $Filename -Header "DateTime", "Installed", "InUse", "Overdraft", "UsagePercent" -Delimiter ";" | Select-Object -Last 1



$MailParams = @{
    To = "s.biedermann@salesianer.com"
    From = "citrixlizenzen@salesianer.com"
    SmtpServer = "smwmail2.sal.co.at"
    Subject = "Citrix Lizenzen"
    }
     
     
       $mailParams.body = $File |out-string
       Send-MailMessage @MailParams
    
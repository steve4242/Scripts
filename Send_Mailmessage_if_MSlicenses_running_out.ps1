<# Hier werden die Maileinstellungen gesetzt.
Es können auch mehrere Empfänger mit Beistrich angegeben werden. z.B.:
To = "d.schober@salesianer.com, it.tn@salesianer.com" #>
$MailParams = @{
To = "d.schober@salesianer.com"
From = "report@salesianer.com"
SmtpServer = "smwmail2.sal.co.at"
Subject = "Microsoft365 E3 Lizenzwarnung!"
}
<# Gesamt ist die Gesamtanzahl der verfügbaren Lizenzen
Treshold kann angepasst werden und bestimmt, wieviele Lizenzen noch übrig sein dürfen bevor eine Warnung ausgeschickt wird.
Onlineonly gibt die rein online vergebenen Lizenzen an, die nicht über die Gruppe erfasst werden können
Groupname wird zur Berechnung der Lizenzen verwendet.#>
$gesamt = 935
$treshold = 20
$onlineonly = 5
$groupname = "GG_Microsoft365E3-Lizenz"
# Die User werden abgefragt und das Ergebnis wird berechnet.
$users = Get-ADGroupMember -Identity $groupname | ? {$_.objectclass -eq "user"}
$ergebniss = foreach ($activeusers in $users) { Get-ADUser -Identity $activeusers | select Name, userprincipalname, Enabled }
$summe= ($ergebniss | Measure-Object).Count + $onlineonly
$rest = $gesamt - $summe
 # Wenn der Schwellwert erreicht wird, wird mit dieser Befehlszeile ein Mail versandt.
  if ( $summe -and ($summe -gt $gesamt - $treshold) ) {
   $mailParams.body = "
   $summe Microsoft 365 E3 Lizenzen von $gesamt verbraucht!
   Es sind nur noch $rest übrig.

   Bitte prüfen, ob User bereinigt werden können. Sonst müssen Lizenzen nachbestellt werden!
   
   LG Daniel"
   Send-MailMessage @MailParams -Encoding "UTF8"
  }
  else {
    echo "alles gut :)"
  }
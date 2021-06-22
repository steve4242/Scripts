$MailParams = @{
To = "d.schober@salesianer.com"
From = "report@salesianer.com"
SmtpServer = "smwmail2.sal.co.at"
Subject = "Microsoft365 E3 Lizenzwarnung!"
}

$gesamt = 935
$treshold = 20
$onlineonly = 5
$groupname = "GG_Microsoft365E3-Lizenz"

$users = Get-ADGroupMember -Identity $groupname | ? {$_.objectclass -eq "user"}
$ergebniss = foreach ($activeusers in $users) { Get-ADUser -Identity $activeusers | select Name, userprincipalname, Enabled }
$summe= ($ergebniss | Measure-Object).Count + $onlineonly
$rest = $gesamt - $summe
 
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
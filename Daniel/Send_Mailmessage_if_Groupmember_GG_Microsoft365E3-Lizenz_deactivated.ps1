$MailParams = @{
To = "d.schober@salesianer.com"
From = "lizenzwarnung@salesianer.com"
SmtpServer = "smwmail2.sal.co.at"
Subject = "Deaktivierte User in Gruppe GG_Microsoft365E3-Lizenz"
}

$groupname = "GG_Microsoft365E3-Lizenz"
$users = Get-ADGroupMember -Identity $groupname | ? {$_.objectclass -eq "user"}
$ergebniss = foreach ($activeusers in $users) { Get-ADUser -Identity $activeusers | ? {$_.enabled -ne $true} | select Name, userprincipalname, Enabled }
$summe= ($ergebniss | Measure-Object).Count
 
  if ( $summe -and ($summe -gt 0) ) {
   $mailParams.body = $ergebniss |out-string
   Send-MailMessage @MailParams
  }
  else {
    echo "kein Ergebnis"
  }
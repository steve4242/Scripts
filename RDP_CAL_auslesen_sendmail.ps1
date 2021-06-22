
$fileName = (Invoke-WmiMethod Win32_TSLicenseReport -Name GenerateReportEx).FileName
$summaryEntries = (Get-WmiObject Win32_TSLicenseReport|Where-Object FileName -eq $fileName).FetchReportSummaryEntries(0,0).ReportSummaryEntries
$rds = $summaryEntries|ForEach {write-output $_.ProductVersion $_.TSCALType "Installed:" $_.InstalledLicenses "Issued:" $_.IssuedLicenses}



$MailParams = @{
To = "s.biedermann@salesianer.com"
From = "lizenzwarnung@salesianer.com"
SmtpServer = "smwmail2.sal.co.at"
Subject = "RDS Lizenzen"
}
 
 
   $mailParams.body = $rds |out-string
   Send-MailMessage @MailParams

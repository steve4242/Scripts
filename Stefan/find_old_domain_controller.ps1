
Get-ADDomainController -filter * | Select-Object name | out-GridView


$dnsrecords = Get-DnsServerResourceRecord -ZoneName “sal.co.at”
$deadDC = $dnsrecords | Where-Object { $_.RecordData.NameServer -eq “kramdc1.sal.co.at” -or $_.RecordData.DomainName -eq “kramdc1.sal.co.at” }

$deadDC
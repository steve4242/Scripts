
$file = Import-Csv \\salctxfil1.salres.com\citrix$\DataTransfer\Licensing\license_report_2021-06.csv -Header "DateTime", "Installed", "InUse", "Overdraft", "UsagePercent" -Delimiter ";"
$file | Select-Object -Last 1

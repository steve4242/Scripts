# beim .csv file muss jedes Monat das Datum angepasst werden z.B.: license_report_2021-06.csv --> license_report_2021-07.csv

#Import der CSV
$file = Import-Csv \\salctxfil1.salres.com\citrix$\DataTransfer\Licensing\license_report_2021-06.csv -Header "DateTime", "Installed", "InUse", "Overdraft", "UsagePercent" -Delimiter ";"

# Letzte Zeile ausgeben
$file | Select-Object -Last 1

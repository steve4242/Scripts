

$filename = Get-ChildItem -Path \\salctxfil1.salres.com\citrix$\DataTransfer\Licensing\ -File -Filter *.csv | 
Sort-Object LastWriteTime -Descending | Select-Object -First 1 -ExpandProperty FullName

$filename
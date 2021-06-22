$test = get-acl \\smrofp1\Daten\SMRO\Contracte_Clienti
$test



$test.Access | export-csv C:\temp\nfts.csv

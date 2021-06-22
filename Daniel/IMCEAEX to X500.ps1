$Direction = Read-Host “ENTER IMCEAEX”
$Replacement= @(@(“_”,”/”), @(“\+20”,” ”), @(“\+28”,”(“), @(“\+29”,”)”), @(“\+2C”,”,”), @(“\+3F”,”?”), @(“\+5F”, “_” ), @(“\+40”, “@” ), @(“\+2E”, “.” ))
$Replacement | ForEach { $Direction = $Direction -replace $_[0], $_[1] }
$Direction = “X500:$Direction” -replace “IMCEAEX-“,”” -replace “@.*$”, “”
Write-Host $Direction
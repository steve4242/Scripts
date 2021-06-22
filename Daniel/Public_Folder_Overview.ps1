$OutputFile = "PublicFolderLists_" + (Get-Date -UFormat "%Y%m%d%_%H%M%S") + ".csv"
 
Write "Writing to file: $OutputFile"
 
Out-File -FilePath $OutputFile -InputObject "Public Folder path;Mail enabled;Mail address;Folder Class;Folder last modified;Folder Size;Number of items;Top 1 object creation time" -Encoding UTF8 
$objPFs = Get-PublicFolder -Recurse
Foreach ($objPF in $objPFs) 
{ 
$objPFitemstats = PublicFolderItemStatistics -Identity $($objPF.Identity)|Sort-Object CreationTime -Descending|Select-Object -First 1 #|ft CreationTime,LastModificationTime 
$strMailAddreess = ""
if ($objPF.MailEnabled -eq $true)
{
$objPFmail = Get-MailPublicFolder -Identity $($objPF.Identity)
$strMailAddreess = $objPFmail.PrimarySmtpAddress
} 
$objPFstats = Get-PublicFolderStatistics -Identity $($objPF.Identity)
$strOutLine = "$($objPF.Identity);$($objPF.MailEnabled);$strMailAddreess;$($objPF.FolderClass);$($objPFstats.LastModificationTime);$($objPF.FolderSize);$($objPFstats.ItemCount);$($objPFitemstats.CreationTime)"
Out-File -FilePath $OutputFile -InputObject "$strOutLine" -Encoding UTF8 -append 
Write-Host "`t$strOutLine"
} 
#Get-PublicFolder -Recurse | Get-PublicFolderItemStatistics | Group-Object -Property ItemType -NoElement
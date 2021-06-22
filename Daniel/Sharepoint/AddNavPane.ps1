$adminSiteURL = "https://salesianer0-admin.sharepoint.com"
$title = "Salesianer Navigationsleiste"
$Description = "Salesianer Navigationsleiste wird hinzugefügt"
$siteScriptFile = "C:\Kunden\Salesianer\SharePointProject\JsonFiles\NAVBarV02.json"
$webTemplate = "68" #68= community Site
$PreviewImageURL = "https://salesianer0.sharepoint.com/:i:/r/sites/Testseite/Shared%20Documents/MicroLogo2.png?csf=1&web=1&e=SWgbdO"

Connect-sposervice $adminsiteurl

$jsonfilecontent = get-content $siteScriptFile -raw
$siteScript = Add-SpoSiteScript -title $title -content $JsonFileContent | select -first 1 ID

set-SpoSiteDesign -identity 340ef9d4-75d4-4651-a77a-11788203e4f7 -sitescripts $siteScript.ID -title $title -webTemplate $webtemplate -Description $description -previewImageURL $PreviewImageURL

#add-SpoSiteDesign -sitescripts $siteScript.ID -title $title -webTemplate $webtemplate -Description $description -previewImageURL $PreviewImageURL

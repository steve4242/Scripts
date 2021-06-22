$adminSiteURL = "https://salesianer0-admin.sharepoint.com"
$title = "Salesianer Design And Branding Blue"
$Description = "Salesianer Design und Branding Farbe Blau"
$siteScriptFile = "C:\Kunden\Salesianer\SharePointProject\JsonFiles\DesignAndBrandingBlue.json"
$webTemplate = "68" #68= community Site
$PreviewImageURL = "https://salesianer0.sharepoint.com/:i:/r/sites/Testseite/Shared%20Documents/MicroLogo2.png?csf=1&web=1&e=SWgbdO"

Connect-sposervice $adminsiteurl

$jsonfilecontent = get-content $siteScriptFile -raw
$siteScript = Add-SpoSiteScript -title $title -content $JsonFileContent | select -first 1 ID




set-SpoSiteDesign -identity 21d13cdb-dc13-4022-ac79-bbdd23370d16 -sitescripts $siteScript.ID -title $title -webTemplate $webtemplate -Description $description -previewImageURL $PreviewImageURL

#add-SpoSiteDesign -sitescripts $siteScript.ID -title $title -webTemplate $webtemplate -Description $description -previewImageURL $PreviewImageURL

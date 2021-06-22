$adminSiteURL = "https://salesianer0-admin.sharepoint.com"
$title = "Salesianer Disable External Sharing"
$Description = "Die externe Freigabe von Daten auf dieser SharePoint Seite wird deaktiviert"
$siteScriptFile = "C:\Kunden\Salesianer\SharePointProject\JsonFiles\DisableExternalSharing.json"
$webTemplate = "68" #68= community Site
$PreviewImageURL = "https://salesianer0.sharepoint.com/:i:/r/sites/Testseite/Shared%20Documents/MicroLogo2.png?csf=1&web=1&e=SWgbdO"

Connect-sposervice $adminsiteurl

$jsonfilecontent = get-content $siteScriptFile -raw
$siteScript = Add-SpoSiteScript -title $title -content $JsonFileContent | select -first 1 ID

set-SpoSiteDesign -identity f112c5cf-664a-4dda-a5a9-e33921298402 -sitescripts $siteScript.ID -title $title -webTemplate $webtemplate -Description $description -previewImageURL $PreviewImageURL

#add-SpoSiteDesign -sitescripts $siteScript.ID -title $title -webTemplate $webtemplate -Description $description -previewImageURL $PreviewImageURL

#Load SharePoint CSOM Assemblies
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"
 
Function Disable-SPOSyncButton([String]$SiteURL)
{ 
    Try{
        #Setup the context
        $Ctx = New-Object Microsoft.SharePoint.Client.ClientContext($SiteURL)
        $Ctx.Credentials = $Credentials
 
        #Get the Web and Sub Sites
        $Web = $Ctx.Web
        $Ctx.Load($Web)
        $Ctx.Load($Web.Webs)
        $Ctx.ExecuteQuery()
 
        $Web.ExcludeFromOfflineClient=$true
        $Web.Update()
        $Ctx.ExecuteQuery()
        Write-Host -f Green "Sync Button is Disabled for the Site:" $($SiteURL)
 
        #Iterate through each subsite of the current web
        ForEach ($Subweb in $Ctx.Web.Webs)
        {
            #Call the function recursively
            Disable-SPOSyncButton -SiteURL $Subweb.url
        }
    }
    Catch {
        write-host -f Red "Error Disabling Sync Button!" $_.Exception.Message
    }
}

#Get Credentials to connect
$Cred= Get-Credential
$Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Cred.Username, $Cred.Password)


$allsites = (get-sposite -limit all).url

foreach ($site in $allSites){

#Set parameter values

$site
Write-host "Adding Site Collection Admin for:"$Site
Set-SPOUser -site $Site -LoginName schodaadm@salesianer.com -IsSiteCollectionAdmin $True


Disable-SPOSyncButton -SiteURL $Site


}

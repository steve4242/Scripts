
$DomainName =  "sal.co.at"

#PFAD ANGABE:
$HomeDirectoryPath = "C:\Temp\ordner"
$SubDirectories = (Get-ChildItem $HomeDirectoryPath)

 
Foreach ($FolderName in $SubDirectories) {
    $owner = New-Object System.Security.Principal.NTAccount('sal\biedst')
    $objUser = New-Object System.Security.Principal.NTAccount("$DomainName","$FolderName")
     
    #setzt Parent Folder Ownership
    Get-Item -LiteralPath "$HomeDirectoryPath\$FolderName" -ErrorAction SilentlyContinue | Get-Acl |
    ForEach-Object {
        $_.SetOwner($owner) 
        Set-Acl -aclobject $_ -Path $_.PSPath
        $Path = Split-Path $_.Path -NoQualifier
        Write-Host $Path "Folder Owner Set -" $owner
        $acl = Get-Acl $Path
        $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("SAL\biedst","FullControl","Allow")
        $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("SYSTEM","FullControl","Allow")
        $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Domain Admins","FullControl","Allow")
        $acl.SetAccessRule($AccessRule)
        $acl | Set-Acl $Path
    }
    #setzt Child Item Ownership
    Get-ChildItem -LiteralPath "$HomeDirectoryPath\$FolderName" -Recurse –ErrorAction SilentlyContinue | Get-Acl | 
    ForEach-Object {
        $_.SetOwner($owner) 
        Set-Acl -aclobject $_ -Path $_.PSPath
        $Path = Split-Path $_.Path -NoQualifier
        Write-Host $Path "File Owner Set -" $owner
        $acl = Get-Acl $Path
        $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("SAL\biedst","FullControl","Allow")
        $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("SYSTEM","FullControl","Allow")
        $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Domain Admins","FullControl","Allow")
        $acl.SetAccessRule($AccessRule)
        $acl | Set-Acl $Path
        }
}
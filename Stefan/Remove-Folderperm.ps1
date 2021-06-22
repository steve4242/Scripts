<#
.Synopsis

   Remove user NTFS permission from the folders

.DESCRIPTION

   Remove user NTFS permission from the folders

 
.EXAMPLE

Remove-Folderperm -Folder c:\temp -user mydomain\user1


.EXAMPLE

Get-Help Remove-Folderperm

.INPUTS
   System.String
.OUTPUTS
   System.String
.NOTES
   General notes
.COMPONENT
   The component this cmdlet belongs to
.ROLE
   The role this cmdlet belongs to
.FUNCTIONALITY
   
#>

Function Remove-Folderperm

{

    [CmdletBinding()]
    [OutputType([int])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Valuefrompipeline = $true,
                   Position=0)]
       
        [string[]]$Folder,

                [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Valuefrompipeline = $true,
                   Position=1)]
       
        [string[]]$user

       
    )

$acl = Get-Acl $folder
$access = $acl.Access

foreach ($a in $access)

{

$ids = $a.IdentityReference.Value

foreach ($id in $ids)

{


if ($id -eq $user) 

{


$f = Convert-Path $acl.PSPath

$acl.RemoveAccessRule($a)

Set-Acl -path $f -aclObject $acl | Out-Null

}
}
}
}


# https://techibee.com/powershell/find-list-of-hyper-v-servers-in-domain-using-powershell/2100

function Get-HyperVServersInDomain {            
[cmdletbinding()]            
param(            
)            
try {            
 Import-Module ActiveDirectory -ErrorAction Stop            
} catch {            
 Write-Warning "Failed to import Active Directory module. Exiting"            
 return            
}            

try {            
 $Hypervs = Get-ADObject -Filter 'ObjectClass -eq "serviceConnectionPoint" -and Name -eq "Microsoft Hyper-V"' -ErrorAction Stop            
} catch {            
 Write-Error "Failed to query active directory. More details : $_"            
}            
foreach($Hyperv in $Hypervs) {            
 $temp = $Hyperv.DistinguishedName.split(",")            
 $HypervDN = $temp[1..$temp.Count] -join ","            
 $Comp = Get-ADComputer -Id $HypervDN -Prop *            
 $OutputObj = New-Object PSObject -Prop (            
 @{            
  HyperVName = $Comp.Name            
  OSVersion = $($comp.operatingSystem)            
 })            
 $OutputObj            
}            
}

Get-HyperVServersInDomain
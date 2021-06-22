Get-Content "C:\temp\sccm\server.txt" | foreach { Add-CMDeviceCollectionDirectMembershipRule -CollectionName "SU Server - manuell Base-IT" -ResourceID (Get-CMDevice -Name $_).ResourceID }


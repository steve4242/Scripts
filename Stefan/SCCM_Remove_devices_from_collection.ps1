﻿Get-Content “C:\temp\sccm\server.txt” | foreach { Remove-CMDeviceCollectionDirectMembershipRule -CollectionName “SU Server - manuell SAL” -ResourceID (Get-CMDevice -Name $_).ResourceID }
﻿Get-ChildItem –Path “C:\Windows\System32\spool\PRINTERS” –Recurse -File | Where-Object CreationTime –lt (Get-Date).AddDays(-2) | Remove-Item
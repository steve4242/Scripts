$acl = Get-Acl C:\temp\ordner
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("SAL\biedst","FullControl","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl C:\temp\ordner
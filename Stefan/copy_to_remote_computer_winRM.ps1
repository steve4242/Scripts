$session = New-PSSession –ComputerName SERVER1 -Credential (Get-Credential)
Copy-Item –Path C:\Folder1\file1.txt –Destination 'C:\' –ToSession $session
$session | Remove-PSSession
$users=IMPORT-CSV C:\temp\users.csv

foreach($user in $users){

    $password = “Start12345” | ConvertTo-SecureString -AsPlainText -Force
    $username = $user.username
    $vorname = $user.vorname
    $nachname = $user.nachname

    $name = $nachname.ToUpper() + " " + $vorname

    New-ADUser -Name $name -GivenName $vorname -Surname $nachname -DisplayName $name -SamAccountName $username -Path "OU=Benutzer,OU=AT,DC=sal,DC=co,DC=at" -AccountPassword $Password -ChangePasswordAtLogon $True -Enabled $True

}
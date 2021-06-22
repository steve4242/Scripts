# Get a list of every domain controller's name
$dcNames = Get-ADDomainController -Filter * |
  Select-Object -ExpandProperty Name |
  Sort-Object

# Get a collection of users in specified OU
$searchBase = "OU=Computer,OU=IT,OU=AT,DC=sal,DC=co,DC=at"
$users = Get-ADComputer -Filter * -SearchBase $searchBase

# Hashtable used for splatting for Get-ADComputer in loop
$params = @{
  "Properties" = "lastLogon"
}

foreach ( $user in $users ) {
  # Set LDAPFilter to find specific user
  $params.LDAPFilter = "(sAMAccountName=$($user.SamAccountName))"
  # Clear variables
  $latestLogonFT = $latestLogonServer = $latestLogon = $null
  # Iterate every DC name
  foreach ( $dcName in $dcNames ) {
    # Query specific DC
    $params.Server = $dcName
    # Get lastLogon attribute (a file time)
    $lastLogonFT = Get-ADComputer @params |
      Select-Object -ExpandProperty lastLogon
    # Remember most recent file time and DC name
    if ( $lastLogonFT -and ($lastLogonFT -gt $latestLogonFT) ) {
      $latestLogonFT = $lastLogonFT
      $latestLogonServer = $dcName
    }
  }
  if ( $latestLogonFT -and ($latestLogonFT -gt 0) ) {
    # If user ever logged on, get DateTime from file time
    $latestLogon = [DateTime]::FromFileTime($latestLogonFT)
  }
  else {
    # User never logged on
    $latestLogon = $latestLogonServer = $null
  }
  # Output user
  $user | Select-Object `
    SamAccountName,
    @{Name = "LatestLogon";       Expression = {$latestLogon}},
    @{Name = "LatestLogonServer"; Expression = {$latestLogonServer}}
}
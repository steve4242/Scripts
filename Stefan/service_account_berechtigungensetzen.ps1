# Note: to get current list of principals allowed to download the managed password
Get-ADServiceAccount tasks_services -Properties msDS-GroupMsaMembership | Select -Expand msDS-GroupMsaMembership | Select -Expand Access | Select -Expand IdentityReference

# Note: to set the new list of AD accounts allowed to retrieve the gMSA managed password
Get-ADServiceAccount tasks_services | Set-ADServiceAccount -PrincipalsAllowedToRetrieveManagedPassword 'svatsmwinfra1$', 'svatsmwdc1$', 'svatsmwdc2$','rztsdpw1$'
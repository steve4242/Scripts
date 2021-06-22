Get-MsolUser -all |
Select-Object DisplayName, @{N = "MFA Status"; E = { if ( $_.StrongAuthenticationMethods.IsDefault -eq $true) {
            ($_.StrongAuthenticationMethods |
                Where-Object IsDefault -eq $True).MethodType
        }
        else { "Disabled" } }
} |
Format-Table -AutoSize
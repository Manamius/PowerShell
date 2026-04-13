$StartDate = (Get-Date).AddDays(-7).ToString("yyyy-MM-ddTHH:mm:ssZ")
Get-MgAuditLogSignIn -Filter "createdDateTime ge $StartDate" -All |
Select-Object CreatedDateTime, UserDisplayName, UserPrincipalName, AppDisplayName, IPAddress, @{N='City';E={$_.Location.City}}, @{N='State';E={$_.Location.State}}, @{N='Country';E={$_.Location.CountryOrRegion}}, @{N='Status';E={$_.Status.errorcode} |
Export-Csv -Path "SignInsLast7Days.csv" -NoTypeInformation

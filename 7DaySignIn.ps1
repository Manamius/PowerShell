<#
Author: Manamius
Description: Get the last 7 days worth of Sign In Logs from Entra ID. Connect to Exchange Online and MgGraph prior to running script.
#>

# Set Time frame to last 7 days
$StartDate = (Get-Date).AddDays(-7).ToString("yyyy-MM-ddTHH:mm:ssZ")

# Select what data to include and export to a CSV file in the working directory
Get-MgAuditLogSignIn -Filter "createdDateTime ge $StartDate" -All |
Select-Object CreatedDateTime, UserDisplayName, UserPrincipalName, AppDisplayName, IPAddress, @{N='City';E={$_.Location.City}}, @{N='State';E={$_.Location.State}}, @{N='Country';E={$_.Location.CountryOrRegion}}, @{N='Status';E={$_.Status.errorcode} |
Export-Csv -Path "SignInsLast7Days.csv" -NoTypeInformation

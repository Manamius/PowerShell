<#
Author: Manamius
Description: Find all the distribution groups in AD and export a list of members to a CSV file in the temp directory
#>

$DistroGroups = Get-ADGroup -Filter 'GroupCategory -eq "Distribution"' | select-object name

foreach ($group in $DistroGroups)
{
    get-adgroupmember | select-object name, $group
}

Export-CSV -path c:\temp\DistroGroupTest.csv

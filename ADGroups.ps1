$DistroGroups = Get-ADGroup -Filter 'GroupCategory -eq "Distribution"' | select-object name

foreach ($group in $DistroGroups)
{
    get-adgroupmember -identity "Design Group" | select-object name, $group
}

Export-CSV -path c:\temp\DistroGroupTest.csv
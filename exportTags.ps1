$vcFQDN = "vcsa01-mgmt.vlabs.local"
$vcUser = "administrator@vsphere.local"
$vcPassword = "VMware1!"

$tagCategoriesFile = ".\" + $vcFQDN + "_vcTagCategories.csv"
$tagFile = ".\" + $vcFQDN + "_vcTags.csv"

# Connect to the source vCenter Server where you need to export the tags from
Connect-VIServer $vcFQDN -username $vcUser -password $vcPassword

# Export tag categories
Write-Host "Exporting tag categories to" $tagCategoriesFile
Get-TagCategory | Export-CSV $tagCategoriesFile

# Export tags
Write-Host "Exporting tag categories to" $tagFile
Get-Tag | Export-CSV $tagFile
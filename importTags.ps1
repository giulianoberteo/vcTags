$vcFQDN = "vcsa01-mgmt.vlabs.local"
$vcUser = "administrator@vsphere.local"
$vcPassword = "VMware1!"
$tagCategoriesFile = ".\" + $vcFQDN + "_vcTagCategories.csv"
$tagFile = ".\" + $vcFQDN + "_vcTags.csv"

# Connect to the target vCenter Server where you need to import the tags
Connect-VIServer $vcFQDN -username $vcUser -password $vcPassword

#  creating the categories first
$vcTagCategories = Import-Csv $tagCategoriesFile
Write-Host "Creating tag categories"
foreach ($category in $vcTagCategories) { 

    New-TagCategory -Name $category.Name -Description $category.Description -Cardinality $category.Cardinality | Out-Null

}

# creating the tags
$vcTags = Import-Csv $tagFile
Write-Host "Creating tags"
foreach ($tag in $vcTags) {

    New-Tag -Name $tag.Name -Description $tag.Description -Category $tag.Category | Out-Null

}

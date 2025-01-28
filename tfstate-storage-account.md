# Define variables 
$resourceGroupName = "tfstate-gademo-rg" 
$location = "CanadaCentral"
$storageAccountName = "tfstategademo" 
$containerName = "tfstate" 

# Create a new resource group 
New-AzResourceGroup -Name $resourceGroupName -Location $location 

# Create a new storage account within the resource group 
## Register the storage provider if not already registered
Register-AzResourceProvider -ProviderNamespace Microsoft.Storage
New-AzStorageAccount -ResourceGroupName $resourceGroupName  -Name $storageAccountName  -Location $location  -SkuName Standard_LRS  -Kind StorageV2 

# Retrieve the storage account context
 $storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName 
$context = $storageAccount.Context 

# Create a blob container within the storage account 
New-AzStorageContainer -Name $containerName -Context $context
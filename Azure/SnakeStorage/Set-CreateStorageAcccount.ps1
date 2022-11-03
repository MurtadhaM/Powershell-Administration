<# Author: Murtada Marzouq#>

$RandomSuffix = Get-Random -Minimum 1000 -Maximum 9999

<# Parameters#>
$Parameters = @(
    @{
        Name = "ResourceGroupName"
        Type = "String"
        Value = "SnakeStorage-rg"
    },
    @{
        Name = "StorageAccountName"
        Type = "String"
        Value = "snakestorage"
    },
    @{
        Name = "Location"
        Type = "String"
        Value = "eastus2"
    },
    @{
        Name = "AccountType"
        Type = "String"
        Value = "Standard_LRS"
    }
)





<#-----   INTERACTIVE  ------#>
Parameters.$Parameters = Read-Host -Prompt "Enter the Resource Group name"
$StorageAccountName = Read-Host -Prompt "Enter the Storage Account Name"
$Location = Read-Host -Prompt "Location of the Network (Default: East US)"
$AccountType = Read-Host -Prompt "Enter the Account Type (Default: Standard_LRS)"


<#----- CODE EXECUTION -------#>
cNew-AzStorageAccount -ResourceGroupName $con -Name $StorageAccountName -Location $Location -SkuName $AccountType

<# Author: Murtadha Marzouq#>


<#-------- AUTO-FILLED VNET DEPLOY ----------#>


$DefaultRegion = "eastus2"
$ResourceGroupNameqq = "SnakeVNET-rg"
$DefaultVNETName = "SnakeVNET"
$DefaultSubnet1Name = "SnakeSubnet_Local"
$DefaultSubnet2Name = "SnakeSubnet_Remote"
$DefaultSubnet1Prefix = "192.168.100.0/24"
$DefaultSubnet2Prefix = "192,168.200.0/24"
$DefaultSuperNetAddressPrefix = "192.168.0.0/16"
$DefaultSubnet1SecurityGroup = "SnakeSubnet_Local_SG"
$DefaultSubnet2SecurityGroup = "SnakeSubnet_Remote_SG"
$DefaultSecuirtyRule = New-AzNetworkSecurityRuleConfig -Name rdp-rule -Description "Allow RDP" -Access Allow -Protocol Tcp -Direction Inbound -Priority 100 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 3389
$DefaultSubnet1SecurityGroup = New-AzNetworkSecurityGroup -Name $DefaultSubnet1SecurityGroup -ResourceGroupName $DefaultResourceGroup -Location $DefaultRegion -SecurityRules $DefaultSecuirtyRule
$DefaultSubnet1 = New-AzVirtualNetworkSubnetConfig -Name $DefaultSubnet1Name  -AddressPrefix $DefaultSubnet1Prefix -NetworkSecurityGroup $DefaultSubnet2SecurityGroup
$DefaultSubnet2 =  New-AzVirtualNetworkSubnetConfig -Name $DefaultSubnet2Name  -AddressPrefix $DefaultSubnet2Prefix -NetworkSecurityGroup $DefaultSubnet2SecurityGroup
New-AzVirtualNetwork -Name $DefaultVNETName -ResourceGroupName $DefaultResourceGroup -Location $DefaultRegion -AddressPrefix $DefaultSuperNetAddressPrefix -Subnet $DefaultSubnet1, $DefaultSubnet2


<#-----   INTERACTIVE  ------#>
$ResourceGroupName = Read-Host -Prompt "Enter the Resource Group name"
$Param.$VNETName = Read-Host -Prompt "Enter the VNET Name"
$Location = Read-Host -Prompt "Location of the Network (Default: East US)"
$SuperNetAddressPrefix = Read-Host -Prompt "Enter the Supernet (MUST INCLUDE THE TWO) CIDR (Default: 10.0.0.0/16)"
$Subnet1Name = Read-Host -Prompt "Enter the First Subnet Name"
$Subnet1AddressPrefix = Read-Host -Prompt "Enter the First Subnet Address Prefix"
$Subnet2Name = Read-Host -Prompt "Enter the Second Subnet Name"
$Subnet2AddressPrefix = Read-Host -Prompt "Enter the Second Subnet Address Prefix"
$NSG1Name = $Subnet1Name + "-NSG"


<#----- CODE EXECUTION -------#>
New-AzResourceGroup -Name $ResourceGroupName -Location $Location
$rdpRule = New-AzNetworkSecurityRuleConfig -Name rdp-rule -Description "Allow RDP" -Access Allow -Protocol Tcp -Direction Inbound -Priority 100 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 3389
$httpRule = New-AzNetworkSecurityRuleConfig -Name rdp-rule -Description "Allow HTTP" -Access Allow -Protocol Tcp -Direction Inbound -Priority 200 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 80-443
$networkSecurityGroup = New-AzNetworkSecurityGroup -ResourceGroupName $ResourceGroupName -Location $Location -Name $NSG1Name -SecurityRules $rdpRule  
$Subnet1 = New-AzVirtualNetworkSubnetConfig -Name $Subnet1Name -AddressPrefix $Subnet1AddressPrefix -NetworkSecurityGroup $networkSecurityGroup
$Subnet2 = New-AzVirtualNetworkSubnetConfig -Name $Subnet2Name  -AddressPrefix $Subnet2AddressPrefix -NetworkSecurityGroup $networkSecurityGroup
New-AzVirtualNetwork -Name $VNETName -ResourceGroupName $ResourceGroupName -Location $Location -AddressPrefix $SuperNetAddressPrefix -Subnet $Subnet1, $Subnet2
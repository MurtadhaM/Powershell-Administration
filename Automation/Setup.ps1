<# Author: Murtadha Marzouq#>



# import the module
Import-Module ActiveDirectory

# Get the domain name
$domain = (Get-ADDomain).Name

# Get the domain controller name
$domainController = (Get-ADDomainController).Name



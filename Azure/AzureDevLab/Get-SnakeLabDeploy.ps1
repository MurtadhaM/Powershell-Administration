<# Author: Murtadha Marzouq #>


$LabName = Read-Host -Prompt "Enter the Lab Name"
$ResourceGroup = Read-Host -Prompt "Enter the Resource Group"
$ShutdownTime = Read-Host -Prompt "Enter the Shutdown Time in Military Time (HH:MM) format, e.g. 17:00"
$THREASHOLD = Read-Host -Prompt "Enter the number allowed VMs in the labs (Default: 1)"

Set-AzDtlAutoShutdownPolicy -Enable -LabName $LabName -ResourceGroupName $ResourceGroup -Time $ShutdownTime
Set-AzDtlVMsPerLabPolicy -LabName $LabName -ResourceGroupName $ResourceGroup -Threshold $THREASHOLD


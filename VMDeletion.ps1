<#
 # PowerShell script to delete all VM's created under a Cloud Service.
 It also delete the VHDs from the storage
#>


$subscription = Read-Host "Enter your Subscription Name"
Select-AzureSubscription �Default $subscription
Get-AzureService | 
Select-Object @{"Label"="ServiceName";Expression={$_.Label}} | 
Out-GridView -Title "Select VM Deployments to Remove" -PassThru |
ForEach-Object { Remove-AzureDeployment -ServiceName $_.ServiceName -Slot Production -DeleteVHD -Force 
Remove-AzureService -ServiceName $_.ServiceName -Force }
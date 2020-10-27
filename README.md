Cleanup Services, VM's &amp; VHD's deployed under a Cloud Service
=================================================================

            

** **

**

PowerShell
Edit|Remove
powershell
<#
 # PowerShell script to delete all VM's created under a Cloud Service.
 It also delete the VHDs from the storage
#>


$subscription = Read-Host 'Enter your Subscription Name'
Select-AzureSubscription –Default $subscription
Get-AzureService | 
Select-Object @{'Label'='ServiceName';Expression={$_.Label}} | 
Out-GridView -Title 'Select VM Deployments to Remove' -PassThru |
ForEach-Object { Remove-AzureDeployment -ServiceName $_.ServiceName -Slot Production -DeleteVHD -Force 
Remove-AzureService -ServiceName $_.ServiceName -Force }

<# 
 # PowerShell script to delete all VM's created under a Cloud Service. 
 It also delete the VHDs from the storage 
#> 
 
 
$subscription = Read-Host 'Enter your Subscription Name' 
Select-AzureSubscription –Default $subscription 
Get-AzureService |  
Select-Object @{'Label'='ServiceName';Expression={$_.Label}} |  
Out-GridView -Title 'Select VM Deployments to Remove' -PassThru | 
ForEach-Object { Remove-AzureDeployment -ServiceName $_.ServiceName -Slot Production -DeleteVHD -Force  
Remove-AzureService -ServiceName $_.ServiceName -Force }


**

**


Description: 

**




Using this script you can delete all the VM's, linked VHD's and other deployments under the specific cloud service.


The script will use the subscription details and list all the Cloud services in a Grid.


You can select the cloud service under which you have your VM's created and click ok and it will clean up all the VHD's from storage and then get rid of the cloud service as well.






**Prerequisites:**


  *  Azure Powershell Module installed in the machine.

  *  Subscription Name 

    
TechNet gallery is retiring! This script was migrated from TechNet script center to GitHub by Microsoft Azure Automation product group. All the Script Center fields like Rating, RatingCount and DownloadCount have been carried over to Github as-is for the migrated scripts only. Note : The Script Center fields will not be applicable for the new repositories created in Github & hence those fields will not show up for new Github repositories.

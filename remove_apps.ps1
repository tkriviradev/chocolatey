#   Description:
# This script removes unwanted Apps that come with Windows. If you  do not want
# to remove certain Apps comment out the corresponding lines below.

#$CheckFile="C:\Users\Public\store_remove"

#if ($CheckFile) {continue} else {exit}

Get-AppxPackage -allusers *3dbuilder* | Remove-AppxPackage
Get-AppxPackage -allusers *officehub* | Remove-AppxPackage
Get-AppxPackage -allusers *skypeapp* | Remove-AppxPackage
Get-AppxPackage -allusers *getstarted* | Remove-AppxPackage
Get-AppxPackage -allusers *ZuneMusic* | Remove-AppxPackage
Get-AppxPackage -allusers *ZuneVideo* | Remove-AppxPackage
Get-AppxPackage -allusers *solitairecollection* | Remove-AppxPackage
Get-AppxPackage -allusers *XboxApp* | Remove-AppxPackage
Get-AppxPackage -allusers *OneConnect* | Remove-AppxPackage
Get-AppxPackage -allusers *XboxIdentity* | Remove-AppxPackage
Get-AppxPackage -allusers *Office.sway* | Remove-AppxPackage
Get-AppxPackage -allusers *Office.OneNote* | Remove-AppxPackage
Get-AppxPackage -allusers *WindowsFeedbackHub* | Remove-AppxPackage
Get-AppxPackage -allusers *Advertising* | Remove-AppxPackage



# Prevents "Suggested Applications" returning
mkdir "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Cloud Content"
sp "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Cloud Content" "DisableWindowsConsumerFeatures" 1

# Prevents "Suggested Applications" returning
#mkdir $CheckFile

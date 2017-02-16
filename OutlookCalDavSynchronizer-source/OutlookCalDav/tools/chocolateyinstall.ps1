$ErrorActionPreference = 'Stop';

$packageName  = 'outlookcaldav'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#Based on NO DETECTION IN PRO
$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'OutlookCalDavSynchronizer*'
  fileType      = 'zip'
  silentArgs    = "/quiet"
  validExitCodes= @(0) #please insert other valid exit codes here
  url           = "https://github.com/aluxnimm/outlookcaldavsynchronizer/releases/download/v2.16.0/OutlookCalDavSynchronizer-2.16.0.zip"  #download URL, HTTPS preferrred
  destination   = $toolsDir
  file			= "$(Split-Path -parent $MyInvocation.MyCommand.Definition)\\CalDavSynchronizer.Setup.msi"
}

Install-ChocolateyZipPackage @packageArgs 
$packageArgs.fileType = 'msi'
Install-ChocolateyInstallPackage @packageArgs
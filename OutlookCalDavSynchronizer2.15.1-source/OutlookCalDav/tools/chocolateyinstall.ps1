$ErrorActionPreference = 'Stop';

$packageName  = 'outlook-caldav-synchronizer'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#Based on NO DETECTION IN PRO
$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'OutlookCalDav*'
  fileType      = 'zip'
  silentArgs    = "/qn" # NSIS
  validExitCodes= @(0) #please insert other valid exit codes here
  url           = "https://github.com/aluxnimm/outlookcaldavsynchronizer/releases/download/v2.15.1/OutlookCalDavSynchronizer-2.15.1.zip"  #download URL, HTTPS preferrred
  destination   = $toolsDir
  file			= "$(Split-Path -parent $MyInvocation.MyCommand.Definition)\\CalDavSynchronizer.Setup.msi"
}

Install-ChocolateyZipPackage @packageArgs 
$packageArgs.fileType = 'msi'
Install-ChocolateyInstallPackage @packageArgs
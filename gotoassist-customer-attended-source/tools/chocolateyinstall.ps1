﻿Get-ChocolateyWebFile -PackageName 'gotoassist-customer-attended' -FileFullPath "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\gotoassist.exe" -Url 'https://www.fastsupport.com/download/attended-app-download'

<#
Clears the damn cache
#>

$appDataDir = "C:\Users\$($_.Name)\AppData"

$tempfolders = @(
  # General cache
  “C:\Windows\Temp\*”,
  “C:\Windows\Prefetch\*”,
  “C:\Documents and Settings\*\Local Settings\temp\*”,
  “$appDataDir\Local\Temp\*”,

  # Firefox cache
  "$appDataDir\Local\Mozilla\Firefox\Profiles\*.default\cache\*",
  "$appDataDir\Local\Mozilla\Firefox\Profiles\*.default\cache2\entries\*.*",
  "$appDataDir\Local\Mozilla\Firefox\Profiles\*.default\thumbnails\*",
  "$appDataDir\Local\Mozilla\Firefox\Profiles\*.default\webappsstore.sqlite",
  
  # Brave cache
  "$appDataDir\Local\BraveSoftware\User Data\Default\*"
)

Remove-Item $tempfolders -Force -Recurse -Verbose -EA SilentlyContinue
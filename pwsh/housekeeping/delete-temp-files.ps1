$appDataDir = "C:\Users\*\AppData"

$firefoxPath = "$appDataDir\Local\Mozilla\Firefox\Profiles"
$bravePath = "$appDataDir\Local\BraveSoftware\Brave-Browser\User Data"

$firefoxDefault = "*.default"
$firefoxDefaultRelease = "*.default-release"

$tempfolders = @(
  # General cache
  “C:\Windows\Temp\*”,
  “C:\Windows\Prefetch\*”,
  “C:\Documents and Settings\*\Local Settings\temp\*”,
  “$appDataDir\Local\Temp\*”,

  # Firefox cache
  "$firefoxPath\$firefoxDefault\cache\*",
  "$firefoxPath\$firefoxDefault\cache2\entries\*.*",
  "$firefoxPath\$firefoxDefault\thumbnails\*",
  "$firefoxPath\$firefoxDefault\webappsstore.sqlite",
  "$firefoxPath\$firefoxDefaultRelease\cache\*",
  "$firefoxPath\$firefoxDefaultRelease\cache2\entries\*.*",
  "$firefoxPath\$firefoxDefaultRelease\thumbnails\*",
  "$firefoxPath\$firefoxDefaultRelease\webappsstore.sqlite",
  
  # Brave cache
  "$bravePath\Default\Cache\*",
  "$bravePath\Default\Code Cache\*"
)

foreach ($folder in $tempFolders) {
  Remove-Item $folder -Force -Recurse -Verbose
}
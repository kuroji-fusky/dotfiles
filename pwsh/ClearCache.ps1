$appDataDir = "C:\Users\*\AppData"

$firefoxPath = "Local\Mozilla\Firefox\Profiles"
$bravePath = "Local\BraveSoftware\Brave-Browser\User Data"

$tempfolders = @(
  # General cache
  “C:\Windows\Temp\*”,
  “C:\Windows\Prefetch\*”,
  “C:\Documents and Settings\*\Local Settings\temp\*”,
  “$appDataDir\Local\Temp\*”,

  # Firefox cache
  "$appDataDir\$firefoxPath\*.default\cache\*",
  "$appDataDir\$firefoxPath\*.default\cache2\entries\*.*",
  "$appDataDir\$firefoxPath\*.default\thumbnails\*",
  "$appDataDir\$firefoxPath\*.default\webappsstore.sqlite",
  "$appDataDir\$firefoxPath\*.default-release\cache\*",
  "$appDataDir\$firefoxPath\*.default-release\cache2\entries\*.*",
  "$appDataDir\$firefoxPath\*.default-release\thumbnails\*",
  "$appDataDir\$firefoxPath\*.default-release\webappsstore.sqlite",
  
  # Brave cache
  "$appDataDir\$bravePath\Default\Cache\*",
  "$appDataDir\$bravePath\Default\Code Cache\*"
)

Clear-RecycleBin -Force

foreach ($folder in $tempFolders) {
  Remove-Item $folder -Force -Recurse -Verbose
}

cd ~\GitHub\; Get-ChildItem -Recurse -Directory -Hidden -Filter .git | ForEach-Object { & git --git-dir="$($_.FullName)" --work-tree="$(Split-Path $_.FullName -Parent)" pull -v }; cd -

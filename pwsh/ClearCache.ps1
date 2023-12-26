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

## Update stuff
yt-dlp --update
pip install -U yt-dlp --verbose
python -m pip install --upgrade pip --verbose
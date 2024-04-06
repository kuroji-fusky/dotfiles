$appDataDir = "C:\Users\*\AppData"

$firefoxPath = "$appDataDir\Local\Mozilla\Firefox\Profiles"
$bravePath = "$appDataDir\Local\BraveSoftware\Brave-Browser\User Data"

$tempfolders = @(
  # General cache
  “C:\Windows\Temp\*”,
  “C:\Windows\Prefetch\*”,
  “C:\Documents and Settings\*\Local Settings\temp\*”,
  “$appDataDir\Local\Temp\*”,

  # Firefox cache
  "$firefoxPath\*.default\cache\*",
  "$firefoxPath\*.default\cache2\entries\*.*",
  "$firefoxPath\*.default\thumbnails\*",
  "$firefoxPath\*.default\webappsstore.sqlite",
  "$firefoxPath\*.default-release\cache\*",
  "$firefoxPath\*.default-release\cache2\entries\*.*",
  "$firefoxPath\*.default-release\thumbnails\*",
  "$firefoxPath\*.default-release\webappsstore.sqlite",
  
  # Brave cache
  "$bravePath\Default\Cache\*",
  "$bravePath\Default\Code Cache\*"
)

Clear-RecycleBin -Force

foreach ($folder in $tempFolders) {
  Remove-Item $folder -Force -Recurse -Verbose
}

## Update stuff
yt-dlp --update
pip install -U yt-dlp --verbose
python -m pip install --upgrade pip --verbose
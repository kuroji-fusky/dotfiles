
Clear-RecycleBin -Force
& "$PSScriptRoot\housekeeping\delete-temp-files.ps1"


Write-Output "Pinging for an internet connection..."
$HasConnection = & Test-Connection -Ping google.com -Quiet

If ($HasConnection) {
  ## Update stuff
  python -m pip install --upgrade pip --verbose
  
  yt-dlp --update
  pip install -U yt-dlp --verbose
}
Else {
  Write-Output "No TCP response; exiting..."
}
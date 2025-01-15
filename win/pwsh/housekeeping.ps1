$HasConnection = Test-Connection -Ping google.com -Quiet &

Clear-RecycleBin -Force

# Clear temp files
& "$PSScriptRoot\housekeeping\delete-temp-files.ps1"

If ($HasConnection) {
  ## Update stuff
  python -m pip install --upgrade pip --verbose
  
  yt-dlp --update
  pip install -U yt-dlp --verbose
}
Else {
  Write-Output "No TCP response; exiting..."
}
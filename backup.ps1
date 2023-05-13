$userDirs = @(
  "$env:userprofile\Desktop",
  "$env:userprofile\Downloads",
  "$env:userprofile\Documents",
  "$env:userprofile\Pictures",
  "$env:userprofile\Videos"
)

$backupDir = "D:\kuro-backup-$(Get-Date -Format 'yyyy-MM-dd')"

# Create the backup directory if it doesn't exist
if (!(Test-Path $backupDir)) {
  New-Item -ItemType Directory -Path $backupDir
}

foreach ($userDir in $userDirs) {
  $dirName = Split-Path $userDir -Leaf
  
  # Check if the directory name contains "GitHub" or if it has no files
  if (($dirName -notmatch "GitHub") -and (Get-ChildItem -Path $userDir -Recurse -File | Measure-Object).Count -gt 0) {
    $destDir = Join-Path $backupDir $dirName

    Write-Progress -Activity "Copying $dirName" -Status "Progress" -PercentComplete 0
    Copy-Item -Path $userDir -Destination $destDir -Recurse -Force -Verbose |
    ForEach-Object {
      $percentComplete = [Math]::Round($_.BytesTransferred / $_.TotalBytes * 100)
      Write-Progress -Activity "Copying $dirName" -Status "Progress" -PercentComplete $percentComplete
    }
  }
}

Write-Host "All done!"
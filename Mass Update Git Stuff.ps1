$dDrive = "D:\GitHub"

function PushToUranus($dir) {
  Set-Location -Path "$dir"
  Write-Output =======================
  Write-Output "Pushing to $dir"
  Write-Output =======================
  git status
  git push -f origin
}

function UpdateRepos($dir) {
  Set-Location -Path "$dir"
  Write-Output =======================
  Write-Output "Fetching and pulling to $dir"
  Write-Output =======================
  git fetch
  git pull -force
}

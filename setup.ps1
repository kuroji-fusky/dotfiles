# Stuff that requires screwing around with the registry


# Install the shit I need lol
function SetupShit {
  winget import .\winget-programs.json
  Write-Output "yes"
}

if (Get-Command winget -ErrorAction SilentlyContinue) {
  SetupShit
}
else {
  Add-AppXPackage -Path .\MicrosoftDesktopAppInstaller_8wekyb3d8bbwe.msixbundle
  SetupShit
} 

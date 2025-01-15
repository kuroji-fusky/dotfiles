# =================================================
# ALIASES

Set-Alias -Name cdi -Value 'code-insiders'

function ~ { Set-Location ~ }
function .. { Set-Location .. }
function ... { Set-Location ../.. }
function .... { Set-Location ../../.. }
function crb { Clear-RecycleBin -Force }

Set-Alias -Name c -Value Clear-Host

# =================================================
# Navigate directories

Set-Alias -Name touch -Value New-Item

# =================================================
# Register `mkcd` command for Windows
function mkcd {
  # Check if the path already exists
  if (!(Test-Path -Path $args[0])) {
    mkdir $args[0]
  }

  Set-Location $args[0] -PassThru
}

# =================================================
# Toggle theme alias
function ToggleTheme {
  $regDir = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
  $appKey = "AppsUseLightTheme"
  $sysKey = "SystemUsesLightTheme"

  $currentValue = Get-ItemProperty -Path $regDir -Name $appKey | Select-Object -exp $appKey
  $newValue = !$currentValue + 0
  
  Set-ItemProperty -Path $regDir -Name $appKey -Value $newValue -Type Dword -Force
  Set-ItemProperty -Path $regDir -Name $sysKey -Value $newValue -Type Dword -Force

  Get-Process -Name "explorer" | Stop-Process -PassThru -Force

  if (Get-Process -Name "taskmgr" -ErrorAction SilentlyContinue) {
    Stop-Process -Name "taskmgr" -PassThru -Force
    Start-Sleep -Seconds 0.33
    Start-Process -FilePath "taskmgr.exe"
  }
}

Set-Alias -Name tt -Value ToggleTheme

function Stop-DefinedProcesses {
  param (
    [String[]] $ListOfProcesses
  )
  
  foreach ($process in $ListOfProcesses) {
    Get-Process $process -ErrorAction SilentlyContinue | Stop-Process -PassThru -Force
  }
}

$processesToClose = @(
  "AutoHotkey*",
  "Figma*",
  "Telegram*",
  "Discord*",
  "Notion*",
  "brave*",
  "firefox*",
  "thunderbird*",
  "steam*",
  "adobe*",
  "cc*",
  "google*",
  "GitHubDesktop*",
  "AfterFX*",
  "Code*",
  "photos*",
  "everything*"
)

# =================================================
# Restart alias
function rst { 
  Stop-DefinedProcesses -ListOfProcesses $processesToClose
  Restart-Computer -Force
}

# =================================================
# Shutdown alias
function sst { 
  Stop-DefinedProcesses -ListOfProcesses $processesToClose
  Stop-Computer -Force
}

function Set-KillPort {
  $portProcesses = Get-NetTCPConnection -LocalPort $args[0] -ErrorAction Stop

  foreach ($port in $portProcesses) {
    Stop-Process -Force -Id $port
  }
}

Set-Alias -Name kp -Value Set-KillPort
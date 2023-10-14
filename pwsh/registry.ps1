$GameModePath = "HKCU:\Software\Microsoft\GameBar"

$Registries = @(
  # Enable verbose mode
  @("HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System", "verbosestatus", "1"),
  # Shwo file extensions
  @("HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "HideFileExt", "0"),
  # Disable Game Overlay Shits
  @($GameModePath, "AllowAutoGameMode", "0"),
  @($GameModePath, "AutoGameModeEnabled", "0"),
  @("HKCU:\System\GameConfigStore", "GameDVR_Enabled", "0")
)

foreach ($regItem in $Registries) {
  $_path, $_key, $_val = $regItem

  New-ItemProperty -Path $_path -Name $_key -Value $_val -Type Dword -Force
}

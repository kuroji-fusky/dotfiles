#Requires -RunAsAdministrator

$GameModePath = "HKCU:\Software\Microsoft\GameBar"

$ExplorerAdvancedPath = "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"

$Registries = @(
  # Enable verbose mode when shutting down, restarting, etc.
  @("HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System", "verbosestatus", "1"),

  # Show file extensions
  @("HKCU:\$ExplorerAdvancedPath", "HideFileExt", "0"),

  # Disable Game Overlay
  @($GameModePath, "AllowAutoGameMode", "0"),
  @($GameModePath, "AutoGameModeEnabled", "0"),
  @("HKCU:\System\GameConfigStore", "GameDVR_Enabled", "0"),

  # Windows 11: Removes Widgets and Chat from the Taskbar
  @("HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer", "TaskbarDa", "0"),
  @("HKLM:\Default\$ExplorerAdvancedPath", "TaskbarDa", "0"),
  @("HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer", "TaskbarMn", "0"),
  @("HKLM:\Default\$ExplorerAdvancedPath", "TaskbarMn", "0"),

  # Windows 11: Remove "Snap layout" features
  @("HKCU:\$ExplorerAdvancedPath", "EnableSnapBar", "0"),
  @("HKCU:\$ExplorerAdvancedPath", "EnableSnapAssistFlyout", "0"),

  # Windows 11: Remove that horrid "Copilot" button
  @("HKCU:\$ExplorerAdvancedPath", "ShowCopilotButton", "0")
)

foreach ($regItem in $Registries) {
  $_path, $_key, $_val = $regItem

  New-ItemProperty -Path $_path -Name $_key -Value $_val -PropertyType Dword -Force
}

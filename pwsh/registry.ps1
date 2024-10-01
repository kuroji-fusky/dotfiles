#Requires -RunAsAdministrator

$GameModePath = "HKCU:\Software\Microsoft\GameBar"
$ExplorerAdvancedPath = "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"

$HKEY_LOCAL_MACHINE = "HKLM:"
$HKEY_CURRENT_USER = "HKCU:"

$Registries = @(
  # Enable verbose mode when shutting down, restarting, etc.
  @("$HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System", "verbosestatus", "1"),

  # Show file extensions
  @("$HKEY_CURRENT_USER\$ExplorerAdvancedPath", "HideFileExt", "0"),

  # Disable Game Overlay
  @($GameModePath, "AllowAutoGameMode", "0"),
  @($GameModePath, "AutoGameModeEnabled", "0"),
  @("$HKEY_CURRENT_USER\System\GameConfigStore", "GameDVR_Enabled", "0"),

  # Windows 11: Removes Widgets and Chat from the Taskbar
  @("$HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer", "TaskbarDa", "0"),
  @("$HKEY_LOCAL_MACHINE\Default\$ExplorerAdvancedPath", "TaskbarDa", "0"),
  @("$HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer", "TaskbarMn", "0"),
  @("$HKEY_LOCAL_MACHINE\Default\$ExplorerAdvancedPath", "TaskbarMn", "0"),

  # Windows 11: Remove "Snap layout" features
  @("$HKEY_CURRENT_USER\$ExplorerAdvancedPath", "EnableSnapBar", "0"),
  @("$HKEY_CURRENT_USER\$ExplorerAdvancedPath", "EnableSnapAssistFlyout", "0"),

  # Windows 11: Remove that horrid "Copilot" button
  @("$HKEY_CURRENT_USER\$ExplorerAdvancedPath", "ShowCopilotButton", "0")
)

foreach ($regItem in $Registries) {
  $_path, $_key, $_val = $regItem

  New-ItemProperty -Path $_path -Name $_key -Value $_val -PropertyType Dword -Force
}

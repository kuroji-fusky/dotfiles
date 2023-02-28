$regDir = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$appKey = "AppsUseLightTheme"
$sysKey = "SystemUsesLightTheme"
$currentValue = Get-ItemProperty -Path $regDir -Name $appKey | Select-Object -exp $appKey
$newValue = !$currentValue + 0;

Set-ItemProperty -Path $regDir -Name $appKey -Value $newValue -Type Dword -Force
Set-ItemProperty -Path $regDir -Name $sysKey -Value $newValue -Type Dword -Force

Stop-Process -Name "explorer"
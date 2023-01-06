$REG_DIR = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$APP_KEY = "AppsUseLightTheme"
$SYS_KEY = "SystemUsesLightTheme"
$CURRENT_VALUE = Get-ItemProperty -Path $REG_DIR -Name $APP_KEY | Select-Object -exp $APP_KEY
$NEW_VALUE = !$CURRENT_VALUE + 0;

Set-ItemProperty -Path $REG_DIR -Name $APP_KEY -Value $NEW_VALUE -Type Dword -Force;
Set-ItemProperty -Path $REG_DIR -Name $SYS_KEY -Value $NEW_VALUE -Type Dword -Force;
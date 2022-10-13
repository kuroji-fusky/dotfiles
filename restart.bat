:: Kill all common programs
taskkill /f /im Microsoft.Photos.exe
taskkill /f /im firefox.exe
taskkill /f /im brave.exe /t
taskkill /f /im BraveCrashHandler.exe
taskkill /f /im BraveCrashHandler64.exe
taskkill /f /im Discord.exe /t
taskkill /f /im Code - Insiders.exe
taskkill /f /im Notion.exe /t
taskkill /f /im WindowsTerminal.exe
taskkill /f /im Everything.exe

:: Kill Steam processes
taskkill /f /im steam.exe
taskkill /f /im steamwebhelper.exe /t
taskkill /f /im SteamService.exe

:: Kill Adobe processes
taskkill /f /im Adobe Desktop Service.exe
taskkill /f /im Adobe Installer.exe
taskkill /f /im AdobeIPCBroker.exe
taskkill /f /im CCLibrary.exe
taskkill /f /im CCXProcess.exe
taskkill /f /im CoreSync.exe
taskkill /f /im CEPHtmlEngine.exe /t
taskkill /f /im Creative Cloud Helper.exe /t

taskkill /f /im illustrator.exe
taskkill /f /im Adobe Premiere Pro.exe
taskkill /f /im AfterFX.exe

:: Kill all uncommon programs
taskkill /f /im GitHubDesktop.exe
taskkill /f /im Figma.exe
taskkill /f /im Telegram.exe

:: After all running processes are terminated, force restart the system uwu
shutdown /r /f /t 0

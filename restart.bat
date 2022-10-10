@rem Kill all common programs
taskkill /f /im Microsoft.Photos.exe
taskkill /f /im firefox.exe
taskkill /f /im Discord.exe /t
taskkill /f /im Code - Insiders.exe
taskkill /f /im Notion.exe /t
taskkill /f /im WindowsTerminal.exe
taskkill /f /im Everything.exe

@rem Kill Steam processes
taskkill /f /im steam.exe
taskkill /f /im steamwebhelper.exe /t
taskkill /f /im SteamService.exe

@rem Kill Adobe processes
taskkill /f /im SteamService.exe

@rem Kill all uncommon programs
taskkill /f /im GitHubDesktop.exe
taskkill /f /im Figma.exe
taskkill /f /im Telegram.exe

@rem After all running processes are terminated,
@rem force restart the system uwu
shutdown /r /f /t 0

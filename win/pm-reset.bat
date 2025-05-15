@echo off
@rem A script to kill and relaunch Portmaster
@rem Why? Sometimes, any network activity won't go through due to some issues with PM
@rem in particular. So this script does the usual "turn on and turn off" method.
@rem 
@rem It also contains safeguards to force kill if `sc` couldn't kill it.
setlocal

title Reinit Portmaster

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script requires admin privilages, please re-run this script. *puppy eyes*
    echo.
    goto term
)

if "%PROGRAMDATA%" == "" (
    echo ERROR: %PROGRAMDATA% is not set.
    goto term
)

set "PM_DIR=%PROGRAMDATA%\Safing\Portmaster"
set "PM_SC=PortmasterCore"

set "TIMEOUT_SEC=6"

:: Stop the process gently, if it's being stubborn, then cut it's throat
sc stop %PM_SC% >nul

set "retry_count=0"
:CheckStopped
if %retry_count% geq 3 (
    echo Service failed to stop after 3 attempts. Force killing Portmaster processes...
    taskkill /f /im "portmaster*" >nul
    goto StartPMService
)

if %retry_count% equ 0 (
    echo Stopping process...
) else (
    echo Stopping process - attempt %retry_count%...
)

set /a retry_count+=1
timeout %TIMEOUT_SEC% /nobreak >nul

:: If it's truly dead, we can now resurrect that bitch from the dead
call :CheckProcessStatus "STOPPED"
if %errorlevel% neq 0 goto StartPMService

:StartPMService
sc start %PM_SC% >nul

:: reset counter
set "retry_count=0"
:CheckRunning
if %retry_count% geq 10 (
    echo Failed to start the Portmaster service after 10 times
    goto term
)

if %retry_count% equ 0 (
    echo Service stopped; starting process...
) else (
    echo Starting process - attempt %retry_count%...
)

set /a retry_count+=1
timeout %TIMEOUT_SEC% /nobreak >nul

call :CheckProcessStatus "RUNNING"
if %errorlevel% neq 0 goto :CheckRunning

:: Once everything's started, we can kill the frontend since it launches by default
set "PM_FRONTEND_PROCESS=portmaster-app*"
cmd.exe /c start "" "%PM_DIR%\portmaster-start.exe" app --data=%PM_DIR%

:CheckFrontend
timeout 1 /nobreak >nul
tasklist | findstr /I %PM_FRONTEND_PROCESS% >nul

if %errorlevel% equ 0 (
    taskkill /f /im %PM_FRONTEND_PROCESS%
    goto CheckFrontend
)

:CheckProcessStatus
sc query %PM_SC% | findstr /C:"STATE" | findstr /C:%~1 >nul

exit /b 0
endlocal

:term
echo Press any key to exit...
pause >nul
exit /b
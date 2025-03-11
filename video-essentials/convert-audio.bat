@echo off
setlocal disableDelayedExpansion

:: Check if FFmpeg is installed
where /Q ffmpeg
if errorlevel 1 (
    echo FFmpeg is not installed 
    pause
    goto ExitMeBaby
)

:ProcessFiles
if "%~1"=="" (
    echo FEED ME A PRECIOUS VIDEO FILE PLZ
    pause
    goto ExitMeBaby
)

:ConvertFile
for %%F in (%*) do (
  set "inputFile=%%~F"
  set "outputFile=%%~dpnF.wav"

  setlocal enableDelayedExpansion
    ffmpeg -i "!inputFile!" "!outputFile!" -y -hide_banner
  endlocal
)

echo.
echo.
echo Conversion complete!
echo.
echo.
pause
goto ExitMeDaddy

:ExitMeDaddy
exit /b

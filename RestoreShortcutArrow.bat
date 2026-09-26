@echo off
chcp 65001 >nul
title Restore Windows Shortcut Overlay Arrow
:: Check administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Please right‑click and run this script as Administrator!
    pause
    exit /b
)
echo Restoring shortcut overlay arrow...
:: Delete value 29 under Shell Icons to restore system default arrow
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /f >nul 2>&1
:: Refresh icon cache and restart Explorer
ie4uinit.exe -show >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 1 /nobreak >nul
start explorer.exe
echo Done! Shortcut overlay arrow has been restored.
pause

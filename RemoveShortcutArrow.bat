@echo off
chcp 65001 >nul
title Remove Windows Shortcut Overlay Arrow
:: Check administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Please right‑click and run this script as Administrator!
    pause
    exit /b
)
echo Removing shortcut overlay arrow...
:: Use expanded absolute path (single %% removed, use %windir%)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /t REG_SZ /d "%windir%\System32\imageres.dll,197" /f >nul
:: Refresh icon cache and restart Explorer
ie4uinit.exe -show >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 1 /nobreak >nul
start explorer.exe
echo Done! Shortcut overlay arrow has been removed.
pause

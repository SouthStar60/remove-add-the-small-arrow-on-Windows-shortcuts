@echo off
chcp 65001 >nul
title 去除Windows快捷方式小箭头

:: 检查管理员权限
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo 请右键以"管理员身份运行"此脚本！
    pause
    exit /b
)

echo 正在去除快捷方式小箭头...

:: 添加/覆盖 Shell Icons 中的 29 号图标为空白图标
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /t REG_SZ /d "%%windir%%\System32\imageres.dll,197" /f >nul

:: 清理图标缓存
ie4uinit.exe -show >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 1 /nobreak >nul
start explorer.exe

echo 完成！快捷方式小箭头已去除。
pause

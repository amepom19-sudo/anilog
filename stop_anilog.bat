@echo off
powershell -NoProfile -Command "$c = Get-NetTCPConnection -LocalPort 8765 -State Listen -ErrorAction SilentlyContinue; if ($c) { $c | ForEach-Object { Stop-Process -Id $_.OwningProcess -Force }; 'ANI:LOG server stopped.' } else { 'ANI:LOG server is not running.' }; Start-Sleep -Seconds 2"

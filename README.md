# System Info Script

Этот скрипт собирает подробную информацию о системе: процессор, память, видеокарту, диски, сеть и многое другое. Подходит для диагностики проблем или инвентаризации ПК.

## Как использовать

1. Откройте PowerShell.
2. Скопируйте и вставьте следующую команду в консоль:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex "&{$((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/koshidance/GetSystemInfo/refs/heads/main/Get-SystemInfo.ps1'))}"
```
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex "&{$((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/koshidance/GetSystemInfo/refs/heads/main/Get-FullSystemInfo.ps1'))}"
```

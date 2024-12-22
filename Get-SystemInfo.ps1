# Получить информацию о процессоре
Write-Host "Процессор:" -ForegroundColor Cyan
Get-WmiObject Win32_Processor | ForEach-Object { Write-Host "Имя: $($_.Name)"; Write-Host "Частота: $($_.MaxClockSpeed) МГц"; Write-Host "Количество ядер: $($_.NumberOfCores)"; Write-Host "Количество логических процессоров: $($_.NumberOfLogicalProcessors)"; Write-Host "---" }

# Получить информацию об оперативной памяти
Write-Host "Оперативная память:" -ForegroundColor Cyan
Get-WmiObject Win32_PhysicalMemory | ForEach-Object { Write-Host "Модуль: $($_.Manufacturer) $($_.PartNumber)"; Write-Host "Объем: $([math]::Round($_.Capacity / 1GB, 2)) ГБ"; Write-Host "Частота: $($_.Speed) МГц"; Write-Host "Тип памяти: $($_.MemoryType)"; Write-Host "---" }

# Получить информацию о видеокарте
Write-Host "Видеокарта:" -ForegroundColor Cyan
Get-WmiObject Win32_VideoController | ForEach-Object { Write-Host "Имя: $($_.Name)"; Write-Host "Память: $([math]::Round($_.AdapterRAM / 1MB, 2)) МБ"; Write-Host "Разрешение: $($_.VideoModeDescription)"; Write-Host "---" }

# Общая информация о системе
Write-Host "Системная информация:" -ForegroundColor Cyan
Get-ComputerInfo | Select-Object CsName, WindowsVersion, WindowsBuildLabEx, OsArchitecture, BiosVersion | ForEach-Object { Write-Host "Имя компьютера: $($_.CsName)"; Write-Host "Версия Windows: $($_.WindowsVersion)"; Write-Host "Сборка Windows: $($_.WindowsBuildLabEx)"; Write-Host "Архитектура ОС: $($_.OsArchitecture)"; Write-Host "Версия BIOS: $($_.BiosVersion)"; Write-Host "---" }

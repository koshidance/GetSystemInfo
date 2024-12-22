# Get CPU information
Write-Host "Processor:" -ForegroundColor Cyan
Get-WmiObject Win32_Processor | ForEach-Object { Write-Host "Name: $($_.Name)"; Write-Host "Clock Speed: $($_.MaxClockSpeed) MHz"; Write-Host "Cores: $($_.NumberOfCores)"; Write-Host "Logical Processors: $($_.NumberOfLogicalProcessors)"; Write-Host "---" }

# Get RAM information
Write-Host "Memory:" -ForegroundColor Cyan
Get-WmiObject Win32_PhysicalMemory | ForEach-Object { Write-Host "Module: $($_.Manufacturer) $($_.PartNumber)"; Write-Host "Capacity: $([math]::Round($_.Capacity / 1GB, 2)) GB"; Write-Host "Speed: $($_.Speed) MHz"; Write-Host "Memory Type: $($_.MemoryType)"; Write-Host "---" }

# Get GPU information
Write-Host "GPU:" -ForegroundColor Cyan
Get-WmiObject Win32_VideoController | ForEach-Object { Write-Host "Name: $($_.Name)"; Write-Host "Memory: $([math]::Round($_.AdapterRAM / 1MB, 2)) MB"; Write-Host "Resolution: $($_.VideoModeDescription)"; Write-Host "---" }

# Get system information
Write-Host "System Information:" -ForegroundColor Cyan
Get-ComputerInfo | Select-Object CsName, WindowsVersion, WindowsBuildLabEx, OsArchitecture, BiosVersion | ForEach-Object { Write-Host "Computer Name: $($_.CsName)"; Write-Host "Windows Version: $($_.WindowsVersion)"; Write-Host "Windows Build: $($_.WindowsBuildLabEx)"; Write-Host "OS Architecture: $($_.OsArchitecture)"; Write-Host "BIOS Version: $($_.BiosVersion)"; Write-Host "---" }

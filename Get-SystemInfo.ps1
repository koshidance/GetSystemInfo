# Get CPU information
Write-Host "=== Processor Information ===" -ForegroundColor Cyan
Get-WmiObject Win32_Processor | ForEach-Object {
    Write-Host "Name: $($_.Name)"
    Write-Host "Manufacturer: $($_.Manufacturer)"
    Write-Host "Clock Speed: $($_.MaxClockSpeed) MHz"
    Write-Host "Cores: $($_.NumberOfCores)"
    Write-Host "Logical Processors: $($_.NumberOfLogicalProcessors)"
    Write-Host "---"
}

# Get RAM information
Write-Host "=== Memory Information ===" -ForegroundColor Cyan
Get-WmiObject Win32_PhysicalMemory | ForEach-Object {
    Write-Host "Manufacturer: $($_.Manufacturer)"
    Write-Host "Part Number: $($_.PartNumber)"
    Write-Host "Capacity: $([math]::Round($_.Capacity / 1GB, 2)) GB"
    Write-Host "Speed: $($_.Speed) MHz"
    Write-Host "Memory Type: $($_.MemoryType)"
    Write-Host "---"
}
# Get GPU information
Write-Host "=== GPU Information ===" -ForegroundColor Cyan
Get-WmiObject Win32_VideoController | ForEach-Object {
    Write-Host "Name: $($_.Name)"
    Write-Host "Driver Version: $($_.DriverVersion)"
    Write-Host "Memory: $([math]::Round($_.AdapterRAM / 1MB, 2)) MB"
    Write-Host "Video Mode: $($_.VideoModeDescription)"
    Write-Host "---"
}
# Get system information
Write-Host "=== Operating System Information ===" -ForegroundColor Cyan
Get-CimInstance Win32_OperatingSystem | ForEach-Object {
    Write-Host "Name: $($_.Caption)"
    Write-Host "Version: $($_.Version)"
    Write-Host "Build Number: $($_.BuildNumber)"
    Write-Host "Install Date: $($_.InstallDate)"
    Write-Host "Last Boot Up Time: $($_.LastBootUpTime)"
    Write-Host "Architecture: $($_.OSArchitecture)"
    Write-Host "Serial Number: $($_.SerialNumber)"
    Write-Host "---"
}

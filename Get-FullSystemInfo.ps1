[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
chcp 65001

# Processor Information
Write-Host "=== Processor Information ===" -ForegroundColor Cyan
Get-WmiObject Win32_Processor | ForEach-Object {
    Write-Host "Name: $($_.Name)"
    Write-Host "Manufacturer: $($_.Manufacturer)"
    Write-Host "Clock Speed: $($_.MaxClockSpeed) MHz"
    Write-Host "Cores: $($_.NumberOfCores)"
    Write-Host "Logical Processors: $($_.NumberOfLogicalProcessors)"
    Write-Host "---"
}

# Memory Information
Write-Host "=== Memory Information ===" -ForegroundColor Cyan
Get-WmiObject Win32_PhysicalMemory | ForEach-Object {
    Write-Host "Manufacturer: $($_.Manufacturer)"
    Write-Host "Part Number: $($_.PartNumber)"
    Write-Host "Capacity: $([math]::Round($_.Capacity / 1GB, 2)) GB"
    Write-Host "Speed: $($_.Speed) MHz"
    Write-Host "Memory Type: $($_.MemoryType)"
    Write-Host "---"
}

# GPU Information
Write-Host "=== GPU Information ===" -ForegroundColor Cyan
Get-WmiObject Win32_VideoController | ForEach-Object {
    Write-Host "Name: $($_.Name)"
    Write-Host "Driver Version: $($_.DriverVersion)"
    Write-Host "Memory: $([math]::Round($_.AdapterRAM / 1MB, 2)) MB"
    Write-Host "Video Mode: $($_.VideoModeDescription)"
    Write-Host "---"
}

# Disk Information
Write-Host "=== Disk Information ===" -ForegroundColor Cyan
Get-WmiObject Win32_DiskDrive | ForEach-Object {
    Write-Host "Model: $($_.Model)"
    Write-Host "Interface Type: $($_.InterfaceType)"
    Write-Host "Size: $([math]::Round($_.Size / 1GB, 2)) GB"
    Write-Host "Partitions: $($_.Partitions)"
    Write-Host "---"
}

# Network Information
Write-Host "=== Network Information ===" -ForegroundColor Cyan
Get-WmiObject Win32_NetworkAdapterConfiguration | Where-Object {$_.IPEnabled -eq $true} | ForEach-Object {
    Write-Host "Description: $($_.Description)"
    Write-Host "MAC Address: $($_.MACAddress)"
    Write-Host "IP Address: $($_.IPAddress)"
    Write-Host "Subnet Mask: $($_.IPSubnet)"
    Write-Host "Default Gateway: $($_.DefaultIPGateway)"
    Write-Host "---"
}

# OS Information
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

# BIOS Information
Write-Host "=== BIOS Information ===" -ForegroundColor Cyan
Get-WmiObject Win32_BIOS | ForEach-Object {
    Write-Host "Manufacturer: $($_.Manufacturer)"
    Write-Host "Name: $($_.Name)"
    Write-Host "Version: $($_.Version)"
    Write-Host "Release Date: $($_.ReleaseDate)"
    Write-Host "---"
}

# Logical Drive Information
Write-Host "=== Logical Drives Information ===" -ForegroundColor Cyan
Get-WmiObject Win32_LogicalDisk | ForEach-Object {
    Write-Host "Drive: $($_.DeviceID)"
    Write-Host "Volume Name: $($_.VolumeName)"
    Write-Host "File System: $($_.FileSystem)"
    Write-Host "Size: $([math]::Round($_.Size / 1GB, 2)) GB"
    Write-Host "Free Space: $([math]::Round($_.FreeSpace / 1GB, 2)) GB"
    Write-Host "---"
}

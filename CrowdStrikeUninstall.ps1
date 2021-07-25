# Simple script to uninstall CrowdStrike Windows Censor
# Uses Windows registry data to find uninstall filepath argument
# Passes this as a process to Start-Process command
# Could potentially be used for other software

$cswin = Get-ChildItem HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ | Get-ItemProperty | Where-Object {$_.DisplayName -match "CrowdStrike Windows Sensor"} | Select-Object -ExpandProperty BundleCachePath

Start-Process -filepath $cswin -argumentlist '/quiet /uninstall'

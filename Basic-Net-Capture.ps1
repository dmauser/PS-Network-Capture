#Create new session redirecting ETL to c:\ps-netcapture.etl and maximum 512MB size
New-NetEventSession -Name session1 -LocalFilePath c:\ps-netcapture.etl -MaxFileSize 512
#Adding provider "Microsoft-Windows-NDIS-PacketCapture" provider {2ED6006E-4729-4609-B423-3EE7BCD678EF} similar to netsh trace capture=yes 
Add-NetEventProvider -Name "{2ED6006E-4729-4609-B423-3EE7BCD678EF}" -SessionName session1
#Start a Capture Session
Start-NetEventSession -Name session1 
#Check Status of capture
Get-NetEventSession
#Stop a Capture Session 
Stop-NetEventSession -Name session1
#Remove Capture Session
Remove-NetEventSession -Name session1 

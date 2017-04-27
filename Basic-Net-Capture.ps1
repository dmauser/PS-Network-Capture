# This a simple demo Powershell script on how perform a Network Capture (similar to netsh trace start capture=yes) 
# saving ETL file using computername and adding timestamp to the output file on this format
# c:\computername-netcap-yyyy-MM-dd_HH-mm-ss.etl
# This ouput capture can be opened in Network Monitor 3.4 and Message Analyzer
#
# It works on Windows 8.1/Windows Server 2012 R2 and after.
#
################################################################################# 
#  
# This script is not officially supported by Microsoft, use it at your own risk.  
# Microsoft has no liability, obligations, warranty, or responsibility regarding  
# any result produced by use of this file. 
# 
################################################################################# 
# 
#Create new session redirecting ETL with timestamp and maximum 512MB of size
$timestamp = Get-Date -f yyyy-MM-dd_HH-mm-ss
New-NetEventSession -Name session1 -LocalFilePath c:\$env:computername-netcap-$timestamp.etl  -MaxFileSize 512
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

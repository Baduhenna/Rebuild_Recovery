#This is the start of the script to rebuild windows 10 recovery partitions.

#Launch Elevated PowerShell Prompt
#Start-Process PowerShell -Verb RunAs

#Allow Scripts to run on local machine
#Set-ExecutionPolicy -ExecutionPolicy Undefined LocalMachine

#Check for Windows 10 
function Get-OS {
    (Get-ComputerInfo | Select-Object windowsproductname)
    }

$OSversion = Get-OS

if ($OSversion -match 'Windows 10 pro') {
    Write-Host "This is a Windows 10 Pro computer"
}
else {
    Write-Host "This is not a Windows 10 pro computer"
}
#Check if Recovery partition is enabled.
#reagentc /info
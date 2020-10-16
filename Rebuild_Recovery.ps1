#This is the start of the script to rebuild windows 10 recovery partitions.

#Launch Elevated PowerShell Prompt
#Requires -RunAsAdministrator

#Check for Windows 10 
function Get-OS {
    (Get-ComputerInfo | Select-Object windowsproductname)
    }

$OSversion = Get-OS

if ($OSversion -match 'Windows 10 pro') {
    Write-Host "This is a Windows 10 Pro computer"
}
else {
    Write-Host "Your operating system is not compatitable with this program"
    exit
}
#Check if Recovery partition is enabled.  
    reagentc /info > C:\Recovery.txt

$lines = Get-Content C:\Recovery.txt

if ($lines[3] -match ' Windows RE status:         Enabled') {
    Write-Host "The Recovery is enabled."
    exit
}
else {
    Write-Host "The Recovery is not enabled."
}

#Automating diskpart 
New-Item -Name listdisk.txt -ItemType File -Force | Out-Null 
Add-Content -path C:\listdisk.txt "list disk"

$listdisk=(diskpart.exe /s listdisk.txt)

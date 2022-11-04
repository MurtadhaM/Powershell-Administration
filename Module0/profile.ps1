#!/usr/bin/env pwsh

<#
Author: Murtadha Marzouq
Function: A test program for implementing prototypes for future projects
#>
 
<# --WINDOWS #>

# Download Tool:

Write-Host -Messsage "winget install JanDeDobbeleer.OhMyPosh -s winget" -ForegroundColor Yellow
<#-- Mac OS X #>
Write-Host -Messsage "brew install jandedobbeleer/oh-my-posh/oh-my-posh" -ForegroundColor Magenta

<#-- Linux #>
Write-Host -Messsage "brew install jandedobbeleer/oh-my-posh/oh-my-posh" -ForegroundColor Red



<#
 # This is to install the modules needed for my own prompt
 #>
function install_modules{
    Install-Module -Name DirColors -Scope CurrentUser -Force
    Install-Module posh-git -Scope CurrentUser -Force
    Install-Module oh-my-posh -Scope CurrentUser  -Force
    Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
    <# 
    # Loading The Modules 
    #>
    Import-Module oh-my-posh
    Import-Module DirColors
    Import-Module posh-git
    Import-Module PSReadLine
  }

function install_Powerline_fonts{

  powershell -command "& { iwr https://github.com/powerline/fonts/archive/master.zip -OutFile ~\fonts.zip }"
  Expand-Archive -Path ~\fonts.zip -DestinationPath ~
  Set-ExecutionPolicy Bypass -Scope CurrentUser -Force
  ~\fonts-master\install.ps1
  # Restoring the original execution policy
  Set-ExecutionPolicy Default
}
function download {
  param (
    $url ,
    $output
  ) 

  if (Test-Path $output) {
    Write-Host "File $output already exists"
    return
  }
  Write-Host "Downloading $url"
  (New-Object System.Net.WebClient).DownloadFile($url, $output)

  Write-Host "Downloaded $url to $output"

   
}
function download_powerline_go{
    # This is to download the files needed for my own prompt
    $path = "$env:HOMEPATH\powerline-go.exe"
    Set-Location $env:HOMEPATH
    download https://github.com/justjanne/powerline-go/releases/download/v1.21.0/powerline-go-windows-amd64  $path
   
}
function add_powerline-go{
# Load powerline-go rompt
  download_powerline_go

  $pwd = $ExecutionContext.SessionState.Path.CurrentLocation
  $startInfo = New-Object System.Diagnostics.ProcessStartInfo
  $startInfo.FileName = "powerline-go"
  $startInfo.Arguments = "-shell bare"
  $startInfo.Environment["TERM"] = "xterm-256color"
  $startInfo.CreateNoWindow = $true
  $startInfo.StandardOutputEncoding = [System.Text.Encoding]::UTF8
  $startInfo.RedirectStandardOutput = $true
  $startInfo.UseShellExecute = $false
  $startInfo.WorkingDirectory = $pwd
  $process = New-Object System.Diagnostics.Process
  $process.StartInfo = $startInfo
  $process.Start() | Out-Null
  $standardOut = $process.StandardOutput.ReadToEnd()
  $process.WaitForExit()
  $standardOut
}


function pretty_prompt{
  import-module dircolors
  Set-PoshPrompt -Theme agnoster
  import-module oh-my-posh
  
}

<# 
# This is a Welcome message for the user
#>
function welcome_prompt{

  $current_User =  $env:USER
  $currentComputer= $env:USERNAME
  
  Write-host  $current_User  + " on " + $currentComputer

}



function prompt{


  if (((Get-Item $pwd).parent.parent.name)) {
    $Path =(Get-Item $pwd).parent.name + '\' + (Split-Path $pwd -Leaf)
} else {
    $Path = $pwd.path
}


<#
 # This is the prompt for the shell that is being used
 #>
if($Script:IsAdmin) {
    Write-Host " $([char]0xE0A2)" -ForegroundColor Black -BackgroundColor Green -NoNewline
    Write-Host "$([char]0xE0B0)$([char]0xE0B1)" -ForegroundColor Green -BackgroundColor Red -NoNewline
}

Write-Host " $($MyInvocation.HistoryId)" -ForegroundColor white -BackgroundColor Red -NoNewline
Write-Host "$([char]0xE0B0)$([char]0xE0B1) " -ForegroundColor Red -BackgroundColor Yellow -NoNewline
Write-Host ($path).ToLower().TrimEnd('\') -ForegroundColor White -BackgroundColor Yellow -NoNewline
if ((Write-VcsStatus *>&1).Length -gt 0) {
    Write-Host "$([char]0xE0B0)$([char]0xE0B1)" -ForegroundColor Yellow -BackgroundColor Green -NoNewline
    Write-Host "$([char]0xE0B0)$("$([char]0xE0B1)" * $NestedPromptLevel)" -ForegroundColor Green -NoNewline
} else {
    Write-Host "$([char]0xE0B0)$("$([char]0xE0B1)" * $NestedPromptLevel)" -ForegroundColor Yellow -NoNewline
}

}




Write-Host -Messsage "winget install JanDeDobbeleer.OhMyPosh -s winget" -ForegroundColor Yellow
<#-- Mac OS X #>
Write-Host -Messsage "brew install jandedobbeleer/oh-my-posh/oh-my-posh" -ForegroundColor Magenta

<#-- Linux #>
Write-Host -Messsage "brew install jandedobbeleer/oh-my-posh/oh-my-posh" -ForegroundColor Red

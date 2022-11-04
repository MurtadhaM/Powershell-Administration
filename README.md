# ![logo][] PowerShell

Welcome to Murtadha's Bag of tricks for PowerShell. I am a PowerShell enthusiast and I love to share my knowledge with others. My focus is on Infrastructure Automation through IaC (Infrastructure as Code) and DevOps. I am a Microsoft Azure Certified Professional and I am also a fan of both Cisco & Fortinet networking -Love Cisco for the Documentation and Fortinet for the innovation and ease of use.


[logo]: https://raw.githubusercontent.com/PowerShell/PowerShell/master/assets/ps_black_64.svg?sanitize=true

## Windows PowerShell vs. PowerShell Core


| 👀  Windows PowerShell  👀 |  👀 PowerShell Core  👀 |
|:------------------:|:---------------:|
| ![Windows PowerShell][] | ![PowerShell Core][] |
source:

[Windows PowerShell]: https://raw.githubusercontent.com/PowerShell/PowerShell/master/assets/ps_black_64.svg?sanitize=true


[PowerShell Core]: https://raw.githubusercontent.com/PowerShell/PowerShell/master/assets/powershell_black_64.svg?sanitize=true


## Table of Contents

- [PowerShell Core](#powershell-installation)

- [PowerShell Core on Linux](#powershell-on-linux)

- [PowerShell Core on macOS](#powershell-on-macos)

- [PowerShell Core on Windows](#powershell-on-windows)



# powershell-installation



## Powershell Mac OS X
```sh
brew cask install powershell
```

## Powershell Linux
```sh
sudo apt-get install -y wget apt-transport-https software-properties-common
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo add-apt-repository universe
sudo apt-get update
sudo apt-get install -y powershell
```

## Powershell Windows
```sh
# Winget
winget install Microsoft.PowerShell

# Chocolatey
choco install powershell

# Scoop

scoop install powershell
```


## Legal and Licensing

PowerShell is licensed under the [MIT license][].

[MIT license]: https://github.com/MurtadhaM/Powershell-Administration/tree/master/LICENSE.txt

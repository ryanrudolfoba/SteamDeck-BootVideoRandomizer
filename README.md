BootVideoRandomizerForSteamDeck

About
This repository contains the scripts and tools that I use to play a random video on boot up.

Pre-requisites - What is needed for this to run correctly?
Skip the items if you have them installed already!
1. mpv - 
2. SWICD - 
3. Playnite - 


Optional - 
1. ExplorerPatcher
2. Bat To Exe Converter
3. Windows 10 / Windows 11 Enterprise or Education


How to Use the Scripts
1. Download and extract the mpv archive in C:\mpv
2. Create a folder called videos located in C:\mpv\videos
3. Download your favorite boot screen videos in steamdeckrepo and save them in C:\mpv\videos
4. Edit install.bat and look for the heading initialize variables. Edit that to reflect the correct username / password that will be used for autologin.
5. Right-click the install.bat script and select Run-As Admin. This sets the needed registry entries and Windows features.
6. Double check that this is how the directory structure looks like for C:\mpv
![image](https://user-images.githubusercontent.com/98122529/200135482-91019b4f-6fba-4bcc-8a04-9be160fe091d.png)
7. If everything looks good - reboot and enjoy the boot video! 
8. If not, carefully read the steps again and repeat steps 1-6.


Optional - Autohide the taskbar
1. Install ExplorerPatcher.
2. Right click Taskbar and select Properties.
3. Put a check mark on Automatically Hide the Taskbar.
![image](https://user-images.githubusercontent.com/98122529/200134999-fe166b1d-b3d7-4256-a36a-45dea032596a.png)

Optional - Install Windows 10 / Windows 11 Enterprise / Student version

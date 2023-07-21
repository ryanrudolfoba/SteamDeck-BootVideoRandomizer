# Boot Video Randomizer for Steam Deck Running on Windows 10 / Windows 11

This is only applicable for Steam Deck running on Windows 10 / Windows 11. \
This will play a random video during bootup similar to SteamOS.

> **NOTE**\
> If you are going to use this script for a video tutorial, PLEASE reference on your video where you got the script! This will make the support process easier!
> And don't forget to give a shoutout to [@10MinuteSteamDeckGamer](https://www.youtube.com/@10MinuteSteamDeckGamer/) / ryanrudolf from the Philippines!
>

<b> If you like my work please show support by subscribing to my [YouTube channel @10MinuteSteamDeckGamer.](https://www.youtube.com/@10MinuteSteamDeckGamer/) </b> <br>
<b> I'm just passionate about Linux, Windows, how stuff works, and playing retro and modern video games on my Steam Deck! </b>
<p align="center">
<a href="https://www.youtube.com/@10MinuteSteamDeckGamer/"> <img src="https://github.com/ryanrudolfoba/SteamDeck-Clover-dualboot/blob/main/10minute.png"/> </a>
</p>

## Disclaimer
1. Do this at your own risk!
2. This is for educational and research purposes only!

## Sample Video
https://user-images.githubusercontent.com/98122529/226190803-8873e038-2c2c-41e3-93d4-81cb18e6f315.mp4

## What's New (as of March 26 2023)
1. videos with spaces in the filenames are now parsed correctly
2. not limited to webm files

## Old Changelog
**March 19 2023**
1. Initial release


## Prerequisites for Windows 10 / Windows 11
1. Windows Enterprise / Education - this is needed if you want to take advantage of Custom Login which supresses the "Welcome" message at startup.
2. [p2exe](https://www.powershellgallery.com/packages/ps2exe/1.0.12) - compiles the PowerShell script into an executable.
3. [mpv](https://mpv.io/) - this will be used as the video player.
4. [7zip](https://www.7-zip.org/) or [winrar](https://www.win-rar.com/) - this will be used to extract the mpv archive.
5. [ExplorerPatcher (optional)](https://github.com/valinet/ExplorerPatcher) - autohide the taskbar for a seamless transition when playing the video.

## Part1 - Windows Preparation
1. Go to Control Panel > Programs and Features. Click Turn Windows Features On / Off.\
![image](https://user-images.githubusercontent.com/98122529/226112139-bd660191-1c53-44c4-b6fb-cbae8301c75c.png)

2. Expand the item - Device Lockdown and make sure this items are checked. If you dont have this items it means you are not using Enterprise / Education. This will still work but it will not be a smooth transition when playing the video. Press OK to apply the changes and reboot afterwards.\
![image](https://user-images.githubusercontent.com/98122529/226112214-7809f4d7-fadb-40cc-a355-b5e285165097.png)

4. Configure the unbranded boot. Open eleveated command prompt / run as admin and type the items -\
   a. reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Embedded\EmbeddedLogon" /f /v HideAutoLogonUI /t REG_DWORD /d 1 \
   b. reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Embedded\EmbeddedLogon" /f /v HideFirstLogonAnimation /t REG_DWORD /d 1 \
   c. reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Embedded\EmbeddedLogon" /f /v BrandingNeutral /t REG_DWORD /d 1 \
   d. bcdedit -set {globalsettings} bootuxdisabled on \
![image](https://user-images.githubusercontent.com/98122529/226112763-8a079244-a110-4502-862f-fdc5c787b80b.png)

   
5. Configure autologin. **Replace localname and localpassword accordingly. This is very important, if you make a mistake here Windows might not boot!** \
   a. Open eleveated command prompt / run as admin.\
   a. reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /v AutoAdminLogon /t REG_SZ /d 1 \
   b. reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /v DefaultUserName /t REG_SZ /d localname \
   c. reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /v DefaultPassword /t REG_SZ /d localpassword \
![image](https://user-images.githubusercontent.com/98122529/226112692-6be851dc-78dd-4400-89b2-18d5267073f4.png)

7. Reboot and Windows should automatically log you in!
8. Install the PowerShell module p2exe -\
   a. Open PowerShell as administrator.\
![image](https://user-images.githubusercontent.com/98122529/226184315-5ddefda1-b93b-4deb-ac0a-3d49f0c8833d.png)\
   b. Install-Module -Name ps2exe. Press Y on the additional prompts.\
![image](https://user-images.githubusercontent.com/98122529/226187699-71bbba2b-740e-4967-92cc-56351de5c648.png)\
   c. Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine \
![image](https://user-images.githubusercontent.com/98122529/226187992-6bcc4459-b445-461a-9ad3-e882336de71b.png)
   

## Part2 - mpv and using the script
1. Download mpv [here](https://sourceforge.net/projects/mpv-player-windows/files/)\
   a. Select the 64bit folder.\
   ![image](https://user-images.githubusercontent.com/98122529/226110260-fc01dda4-332e-4f82-bcdd-652cedc3f161.png)

   b. Select the first one on the list. This will change as weekly there are new binaries built.\
   ![image](https://user-images.githubusercontent.com/98122529/226110307-7ee336f8-9bcf-4854-9520-3449e2cd5d6a.png)

   c. Wait until the download is complete.\
   ![image](https://user-images.githubusercontent.com/98122529/226110358-c7638e17-08e3-4c2e-9dfd-7ff18d7b9be2.png)

2. Once the download is complete, extract it using 7zip / winrar and place it on C:\mpv. This is how the directory structure should look like -\
![image](https://user-images.githubusercontent.com/98122529/226110572-c5f223d1-d028-4949-98ac-8ba8cfbccce4.png)

3. Download your favorite boot screen videos from [steamdeckrepo](https://steamdeckrepo.com/) and save them in C:\mpv\videos
![image](https://user-images.githubusercontent.com/98122529/226110757-b83c7778-c12c-487b-880c-0b8cbe244519.png)

4. Place RandomVideo.ps1 on C:\mpv. The final directory structure will look like this. This is very important!\
![image](https://user-images.githubusercontent.com/98122529/226188657-63c5202c-399d-4db8-843d-a94b74562cd3.png)

5. Open PowerShell and "compile" RandomVideo.ps1 -\
   a. cd \mpv \
   b. ps2exe .\RandomVideo.ps1 -noConsole \
![image](https://user-images.githubusercontent.com/98122529/226188765-9f9fc12c-59ee-4bbe-9759-aa47a181a661.png)

6. Close the PowerShell window. Go to C:\mpv and there should be a file called RandomVideo.exe.\
![image](https://user-images.githubusercontent.com/98122529/226188912-a9cd6066-0b7d-4cfb-8a8a-b1c075d0f3eb.png)

7. Test that it is working - launch RandomVideo.exe and it should play a random boot video!

8. If everything looks good, final step is to set it as the shell. **This is very important. If you make a mistake here Windows might not boot!** \
   a. Open eleveated command prompt / run as admin.\
   b. reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /v Shell /t REG_SZ /d "C:\mpv\RandomVideo.exe" \
![image](https://user-images.githubusercontent.com/98122529/226189460-b5a09829-f009-44d8-b61f-a8cd00adc6dd.png)

9. Reboot and enjoy the random boot video!


## Optional - Autohide the taskbar
1. Download and install ExplorerPatcher from [here.](https://github.com/valinet/ExplorerPatcher/releases)
2. Right click Taskbar and select Properties.
3. Put a check mark on Automatically Hide the Taskbar.
![image](https://user-images.githubusercontent.com/98122529/200134999-fe166b1d-b3d7-4256-a36a-45dea032596a.png)

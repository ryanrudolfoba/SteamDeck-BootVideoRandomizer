<# 
Steam Deck Boot Video Randomizer script by ryanrudolf
https://github.com/ryanrudolfoba/SteamDeck-BootVideoRandomizer
Prerequisites:
1. Windows Enterprise / Education - this is needed if you want to take advantage of Custom Login which supresses the "Welcome" message at startup.
2. p2exe - compiles the PowerShell script into an executable.
3. mpv - this will be used as the video player.
4. 7zip or winrar - this will be used to extract the mpv archive.
5. ExplorerPatcher (optional) - autohide the taskbar for a seamless transition when playing the video.

"compile" this using ps2exe -
ps2exe Randomvideo.ps1 -noConsole
#>

# generate random video from c:\mpv\videos
$RandomVideo = Get-ChildItem -Path c:\mpv\videos\*.webm | Get-Random -count 1

# run explorer.exe
start-process -windowstyle hidden -filepath "explorer.exe"

# optional - run Playnite! 
# If you want to use Playnite, then uncomment the line below and  make sure to use the correct path!
# start-process -filepath "C:\playnite\Playnite.DesktopApp.exe" -argumentlist "--hidesplashscreen"

# run mpv and play the random video
start-process -wait -filepath "c:\mpv\mpv.exe" -argumentlist "--ontop --no-terminal --no-input-default-bindings --cursor-autohide=always --osc=no --fullscreen --on-all-workspaces $RandomVideo"

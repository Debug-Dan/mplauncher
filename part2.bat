@echo off
title Modpack Launcher
goto Start

:Start
cls
echo DebugDan's Modpack Launcher
echo.
echo Please select an option:
echo 1. Launch a modpack
echo 2. Update an existing modpack
echo 3. Install a new modpack
echo 4. Troubleshoot an issue
echo 5. Install/Update Prism Launcher
echo.
choice /c 12345 /n /m ">> "
if errorlevel 5 goto PrismLauncher
if errorlevel 4 goto Troubleshoot
if errorlevel 3 goto Install
if errorlevel 2 goto Update
if errorlevel 1 goto Launch

:PrismLauncher
cls
echo DebugDan's Modpack Launcher
echo.
echo Downloading Microsoft Visual C++....
echo.
curl.exe -o visualinstaller.exe https://aka.ms/vs/17/release/vc_redist.x64.exe
echo.
echo Installing Microsoft Visual C++....
echo.
start visualinstaller.exe
echo The installer should have opened. If it says 'Modify Setup', hit 'Close' and then 'Yes' because you already have this installed. If not, select that you 'agree to the license terms and conditions', and then select 'Install'. If User Account Control ever pops up throughout the rest of this process, hit 'Yes'.
echo.
pause
echo.
echo Once it says Setup Successful, hit 'Close' and proceed.
echo.
pause
echo.
echo Downloading Eclipse Adoptium....
echo.
curl.exe -o javainstaller.msi https://debug-dan.github.io/modpack-updater/javainstaller.msi
echo.
echo Installing Eclipse Adoptium....
echo.
start javainstaller.msi
echo.
echo The installer should have opened. Hit 'Next'. If it says 'Change, repair, or remove installation', hit 'Cancel', 'Yes', and then 'Finish'. If not, hit 'Next', and 'Install'. When it's done, hit 'Finish'.
echo.
pause
echo.
echo Downloading Prism Launcher....
echo.
curl.exe -o prisminstaller.exe https://github.com/PrismLauncher/PrismLauncher/releases/download/8.3/PrismLauncher-Windows-MSVC-Setup-8.3.exe
echo.
echo Installing Prism Launcher....
echo.
start prisminstaller.exe
echo The installer should have opened. Hit 'Next', 'Next', 'Install', and 'Finish'. When Prism Launcher opens, hit 'Next' and then proceed to the next step.
echo.
pause
echo.
echo Choose the version of Java you just installed. The version should start with '17', the architecture should be 'amd64', and the path should contain "Program Files/Eclipse Adoptium'. If you have 16gb or more of RAM on your computer, change the 'maximum memory allocation' to '8192 MiB'.
echo.
pause
echo.
echo Hit finish. Now you're done! You can now proceed to install a modpack!
echo.
pause
goto Start

:Troubleshoot
cls
echo DebugDan's Modpack Launcher
echo.
echo Having issues? If avaliable, select your issue below:
echo 1. Installation/Update/Launch fails or just isn't working
echo 2. Game keeps trying to launch in 'Offline Mode'
echo 3. Return to main menu
echo.
choice /c 123 /n /m ">> "
if errorlevel 3 goto Start
if errorlevel 2 goto Issue2
if errorlevel 1 goto Issue1

:Issue1
cls
echo DebugDan's Modpack Launcher
echo.
echo Prism Launcher must be installed to play, as this launcher uses it to launch your modpack instance. You can install Prism Launcher using the 5th option on the main menu. 
echo.
echo Additionally, Prism Launcher MUST be installed in its DEFAULT DIRECTORY or else this launcher will not work. If you previously installed Prism Launcher to any other location on your main drive, or any location on a secondary drive, it will not work. This is simple to fix, just uninstall your old version of Prism Launcher from windows settings and then use this launcher to install Prism using the 5th option on the main menu.
echo.
pause
goto Troubleshoot

:Issue2
cls
echo DebugDan's Modpack Launcher
echo.
echo Occasionally, you get signed out of your Microsoft Account automatically in Prism Launcher. This semi-automated guide will help you fix this issue. When you continue to the next step, Prism Launcher will open. Go back to this window to view the instructions on what to do.
echo.
pause
start part3.bat
echo.
echo Prism Launcher should have just opened. Hit the account name in the top right corner and select 'Manage Accounts'
echo.
pause
echo.
echo Select 'Add Microsoft' on the top right. It should automatically open a webpage, but if it doesn't, hit open page and copy code.
echo.
pause
echo.
echo Go to the browser window that just opened up. If the code is already in there, hit 'Next'. If the code is not in there, paste the code and then hit 'Next'.
echo.
pause
echo.
echo Sign into your Microsoft account (that has Minecraft on it). When it asks to let this app access your info, hit accept.
echo.
pause
echo.
echo You should now be signed in! You can close the browser window and Prism Launcher and re-attempt to launch the modpack.
echo.
pause
goto Troubleshoot

:Install
cls
echo DebugDan's Modpack Launcher
echo.
echo WARNING: This is only for first time use! Installing a new modpack instance will erase any existing instance by the same name, including any save data, user data, options, waypoints, etc.
echo.
echo Are you sure you want to proceed?
echo 1. Yes
echo 2. No
choice /c 12 /n /m ">> "
if errorlevel 2 goto Start
if errorlevel 1 goto ConfirmInstall

:ConfirmInstall
cls
echo DebugDan's Modpack Launcher
echo.
echo Which modpack would you like to install?
echo 1. Plasmatic Pack
choice /c 1 /n /m ">> "
if errorlevel 1 goto InstallPlasmatic

:InstallPlasmatic
cls
echo DebugDan's Modpack Launcher
echo.
echo Downloading Plasmatic Pack....
echo.
cd %appdata%
cd PrismLauncher
cd instances
rmdir /s /q PlasmaticPack
curl.exe -o installplasmatic.exe https://debug-dan.github.io/modpack-updater/installplasmatic.exe
echo.
echo Installing Plasmatic Pack....
echo.
start installplasmatic.exe
echo A 7-Zip window should have opened. Please select 'Extract' and then 'Yes to All' (if applicable)
pause
del /q installplasmatic.exe
echo.
echo Installation complete. Proceeding to update modpack....
pause
goto UpdatePlasmatic

:Update
cls
echo DebugDan's Modpack Launcher
echo.
echo Which modpack would you like to update?
echo 1. Plasmatic Pack
choice /c 1 /n /m ">> "
if errorlevel 1 goto UpdatePlasmatic

:UpdatePlasmatic
cls
echo DebugDan's Modpack Launcher
echo.
echo Downloading Plasmatic Pack....
echo.
cd %appdata%
cd PrismLauncher
cd instances
cd PlasmaticPack
rmdir /s /q mods
cd..
curl.exe -o updateplasmatic.exe https://debug-dan.github.io/modpack-updater/updateplasmatic.exe
echo.
echo Updating Plasmatic Pack....
echo.
start updateplasmatic.exe
echo A 7-Zip window should have opened. Please select 'Extract' and then 'Yes to All' (if applicable)
pause
del /q updateplasmatic.exe
echo.
echo Update complete. Returning to main menu....
pause
goto Start

:Launch
cls
echo DebugDan's Modpack Launcher
echo.
echo NOTE: If Prism Launcher tries to load your account in 'Offline Mode', then you need to re-add your Microsoft Account or else you won't be able to play online. If this happens, select 'troubleshoot an issue' on the main menu.
echo.
echo Select a modpack to launch:
echo 1. Plasmatic Pack
echo 2. Return to main menu
choice /c 12 /n /m ">> "
if errorlevel 2 goto Start
if errorlevel 1 goto StartPlasmatic

:StartPlasmatic
cls
cd %localappdata%
cd Programs
cd PrismLauncher
start prismlauncher.exe --launch "TST Modpack"
exit

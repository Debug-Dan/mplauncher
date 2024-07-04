@echo off
title MPLauncher
pushd
cd..
curl.exe -o MPLauncher.bat https://debug-dan.github.io/mplauncher/MPLauncher.bat
goto Start

:Start
popd
cls
echo MPLauncher  (L24.7.4h)
echo.
echo Please select an option:
echo 1. Launch an installed modpack
echo 2. Update an existing modpack
echo 3. Install a new modpack
echo 4. Link/re-link Microsoft Account
echo 5. Install/update Prism Launcher
echo 6. Open MC install directory
echo.
choice /c 123456 /n /m ">> "
if "%ERRORLEVEL%" == "1" goto Launch
if "%ERRORLEVEL%" == "2" goto Update
if "%ERRORLEVEL%" == "3" goto Install
if "%ERRORLEVEL%" == "4" goto MicrosoftAccount
if "%ERRORLEVEL%" == "5" goto PrismLauncher
if "%ERRORLEVEL%" == "6" goto Directory

:Directory
cls
start %windir%\explorer.exe "%appdata%\PrismLauncher\instances"
popd
goto Start

:PrismLauncher
cls
echo MPLauncher
echo.
echo The following guided setup will install the following:
echo Microsoft Visual C++ (dependency)
echo Eclipse Adoptium (Java) (dependency)
echo Prism Launcher (dependency)
echo.
echo Are you sure you want to proceed?
echo 1. Yes
echo 2. No
choice /c 12 /n /m ">> "
if "%ERRORLEVEL%" == "1" goto PrismLauncherConfirm
if "%ERRORLEVEL%" == "2" goto Start

:PrismLauncherConfirm
cls
echo MPLauncher
echo.
echo Downloading Microsoft Visual C++....
echo.
curl.exe -Lo visualinstaller.exe "https://aka.ms/vs/17/release/vc_redist.x64.exe"
echo.
echo Installing Microsoft Visual C++....
echo.
start visualinstaller.exe
echo The installer should have opened. 
echo If it says 'Modify Setup', hit 'Close' and then 'Yes' because you already have this installed.
echo If not, select that you 'agree to the license terms and conditions', and then select 'Install'. 
echo If User Account Control ever pops up throughout the rest of this process, hit 'Yes'.
echo.
pause
echo.
echo Once it says Setup Successful, hit 'Close' and proceed.
echo.
pause
del /q visualinstaller.exe
cls
echo MPLauncher
echo.
echo Downloading Eclipse Adoptium....
echo.
curl.exe -Lo javainstaller.msi "https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.11%2B9/OpenJDK17U-jdk_x64_windows_hotspot_17.0.11_9.msi"
echo.
echo Installing Eclipse Adoptium....
echo.
start javainstaller.msi
echo.
echo The installer should have opened. Hit 'Next'. 
echo If it says 'Change, repair, or remove installation', hit 'Cancel', 'Yes', and then 'Finish'. 
echo If not, hit 'Next', and 'Install'. When it's done, hit 'Finish'.
echo.
pause
del /q javainstaller.msi
cls
echo MPLauncher
echo.
echo Downloading Prism Launcher....
echo.
curl.exe -Lo prisminstaller.exe https://github.com/PrismLauncher/PrismLauncher/releases/download/8.3/PrismLauncher-Windows-MSVC-Setup-8.3.exe
echo.
echo Installing Prism Launcher....
echo.
start prisminstaller.exe
echo The installer should have opened. 
echo Hit 'Next', 'Next', 'Install', and 'Finish'. When Prism Launcher opens, hit 'Next' and then proceed to the next step.
echo.
pause
del /q prisminstaller.exe
cls
echo MPLauncher
echo.
echo Choose the version of Java you just installed. Tips:
echo The version should start with '17'
echo The architecture should be 'amd64'
echo The path should contain "Program Files/Eclipse Adoptium'
echo If you have 16gb or more of RAM on your computer, change the 'maximum memory allocation' to '8192 MiB'.
echo.
pause
echo.
echo Hit finish. Now you're done! You can now proceed to install a modpack!
echo.
pause
goto Start

:MicrosoftAccount
cls
echo MPLauncher
echo.
echo Upon proceeding, Prism Launcher will open automatically.
echo Please return to this window to view the instructions.
echo.
pause
popd
start part3.bat
echo Prism Launcher should have just opened. Follow these instructions:
echo 1 - Hit the account name in the top right corner and select 'Manage Accounts'
echo 2 - Select 'Add Microsoft' on the top right. 
echo 3 - It should automatically open a webpage; if it doesn't, hit open page and copy code.
echo 4 - Go to the browser window that just opened up. 
echo 5 - If the code is already in there, hit 'Next'. If the code is not in there, paste the code and then hit 'Next'.
echo 6 - Sign into your Microsoft account (that has Minecraft on it). When it asks to let this app access your info, hit accept.
echo 7 - You should now be signed in! You can close the browser window and Prism Launcher and re-attempt to launch the modpack.
echo.
pause
goto Start

:Install
cls
echo MPLauncher
echo.
echo WARNING: This is only for first time use! 
echo Installing a new modpack instance will erase any existing instance by the same name, including any save data, user data, options, waypoints, etc.
echo.
echo Are you sure you want to proceed?
echo 1. Yes
echo 2. No
choice /c 12 /n /m ">> "
if "%ERRORLEVEL%" == "1" goto ConfirmInstall
if "%ERRORLEVEL%" == "2" goto Start

:ConfirmInstall
cls
echo MPLauncher
echo.
echo Which modpack would you like to install?
echo 1. TSTPack
echo 2. Return to main menu
choice /c 12 /n /m ">> "
if "%ERRORLEVEL%" == "1" goto InstallTST
if "%ERRORLEVEL%" == "2" goto Start

:InstallTST
cls
echo MPLauncher
echo.
echo Downloading TSTPack....
echo.
cd %appdata%
cd PrismLauncher
cd instances
rmdir /s /q TSTPack
curl.exe -Lo installTST.exe "https://github.com/Debug-Dan/mplauncher/releases/download/TSTPack/installTST.exe"
echo.
echo Installing TSTPack....
echo.
start installTST.exe
echo A 7-Zip window should have opened. Please select 'Extract' and then 'Yes to All' (if applicable)
echo Please continue only once the extraction is completed.
pause
del /q installTST.exe
echo.
echo Installation complete. Proceeding to update modpack....
pause
goto UpdateTST

:Update
cls
echo MPLauncher
echo.
echo Which modpack would you like to update?
echo 1. TSTPack
echo 2. Return to main menu
choice /c 12 /n /m ">> "
if "%ERRORLEVEL%" == "1" goto UpdateTST
if "%ERRORLEVEL%" == "2" goto Start

:UpdateTST
cls
echo MPLauncher
echo.
echo Downloading TSTPack....
echo.
cd %appdata%
cd PrismLauncher
cd instances
cd TSTPack
cd .minecraft
rmdir /s /q mods
curl.exe -Lo updateTST.exe "https://github.com/Debug-Dan/mplauncher/releases/download/TSTPack/updateTST.exe"
echo.
echo Updating TSTPack....
echo.
start updateTST.exe
echo A 7-Zip window should have opened. Please select 'Extract' and then 'Yes to All' (if applicable).
echo Please continue only once the extraction is completed.
pause
del /q updateTST.exe
echo.
echo Update complete. Returning to main menu....
pause
goto Start

:Launch
cls
echo MPLauncher
echo.
echo NOTE: If a window pops up asking you to "Choose your offline mode player name", try relaunching.
echo If that doesn't work, you may need to re-link your Microsoft Account by hitting option 4 on the main menu.
echo.
echo Select a modpack to launch:
echo 1. TSTPack
echo 2. Return to main menu
choice /c 12 /n /m ">> "
if "%ERRORLEVEL%" == "1" goto StartTST
if "%ERRORLEVEL%" == "2" goto Start

:StartTST
cls
cd %localappdata%
cd Programs
cd PrismLauncher
start prismlauncher.exe --launch "TSTPack"
exit


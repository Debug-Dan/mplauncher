@echo off
title Modpack Launcher v1.9
pushd
goto Start

:Start
cls
echo DebugDan's Modpack Launcher
echo.
echo Please select an option:
echo 1. Launch a modpack
echo 2. Update an existing modpack
echo 3. Install a new modpack
echo 4. Link/re-link Microsoft Account
echo 5. Install/update Prism Launcher
echo.
choice /c 12345 /n /m ">> "
if errorlevel 5 goto PrismLauncher
if errorlevel 4 goto MicrosoftAccount
if errorlevel 3 goto Install
if errorlevel 2 goto Update
if errorlevel 1 goto Launch

:PrismLauncher
cls
echo DebugDan's Modpack Launcher
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
echo DebugDan's Modpack Launcher
echo.
echo Downloading Eclipse Adoptium....
echo.
curl.exe -Lo javainstaller.msi "https://drive.usercontent.google.com/download?id=16x2sVUWdGbz0Qdr2NBx5U5g11fmq70Ee&export=download&authuser=0&confirm=t&uuid=748b0b9f-842d-4653-a68f-b2551495c56e&at=APZUnTW7nrRwsfxinZveylGlHHzW:1714086765820"
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
echo DebugDan's Modpack Launcher
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
echo DebugDan's Modpack Launcher
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
echo DebugDan's Modpack Launcher
echo.
popd
curl.exe -Lo part3.bat https://debug-dan.github.io/modpack-updater/part3.bat
start part3.bat
cls
echo DebugDan's Modpack Launcher
echo.
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
curl.exe -Lo installplasmatic.exe "https://drive.usercontent.google.com/download?id=1kCPT8BDzPTv5Ic7ezvH6bMDs99JGWGbb&export=download&authuser=0&confirm=t&uuid=b84b92a0-414e-429e-85f9-78c781ea3dbb&at=APZUnTWK4QCi2mDi9jSYItqoLshZ:1714177195087"
echo.
echo Installing Plasmatic Pack....
echo.
start installplasmatic.exe
echo A 7-Zip window should have opened. Please select 'Extract' and then 'Yes to All' (if applicable)
echo Please continue only once the extraction is completed.
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
cd .minecraft
rmdir /s /q mods
curl.exe -Lo updateplasmatic.exe "https://drive.usercontent.google.com/download?id=1NzHtV0TxGyHJBc84kYRdl9tW83rFsCKe&export=download&authuser=0&confirm=t&uuid=92e8f110-ae7d-421e-b83b-03d24176c3a9&at=APZUnTUADRIXkssz22JAGi2caEin:1714177258648"
echo.
echo Updating Plasmatic Pack....
echo.
start updateplasmatic.exe
echo A 7-Zip window should have opened. Please select 'Extract' and then 'Yes to All' (if applicable).
echo Please continue only once the extraction is completed.
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
echo NOTE: If a window pops up asking you to "Choose your offline mode player name", try relaunching. If it says the same thing again, you have to hit 'Cancel' and re-link your Microsoft Account by selecting option 4 in the main menu!
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
start prismlauncher.exe --launch "PlasmaticPack"
exit

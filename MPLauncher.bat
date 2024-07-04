@echo off
title MPLauncher Updater
echo MPLauncher Updater  (U24.7.4b)
echo
echo Downloading newest version of launcher....
echo If no progress is being made, you may need to check your internet connection.
echo.
mkdir mplauncher-files
cd mplauncher-files
curl.exe -o part2.bat https://debug-dan.github.io/mplauncher/part2.bat
curl.exe -o part3.bat https://debug-dan.github.io/mplauncher/part3.bat
timeout /t 1 /nobreak > NUL
start part2.bat
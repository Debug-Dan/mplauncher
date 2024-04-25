@echo off
title Modpack Launcher Updater
echo Downloading newest version of launcher....
echo.
curl.exe -o part2.bat https://debug-dan.github.io/modpack-updater/part2.bat
curl.exe -o part3.bat https://debug-dan.github.io/modpack-updater/part3.bat
start part2.bat
@echo off
title Modpack Launcher Updater
echo Downloading newest version of launcher....
echo.
mkdir "modpack-launcher-files"
cd modpack-launcher-files
curl.exe -o part2.bat https://debug-dan.github.io/modpack-updater/part2.bat
start part2.bat
@echo off
:: 
:: Gallery Downloader Batch Script
:: Author: Benjamin Linsenmeyer
:: License: MIT License
:: 
:: This script allows for downloading images/videos from online galleries utilizing gallery-dl.
::
:: Permission is hereby granted, free of charge, to any person obtaining a copy
:: of this software and associated documentation files (the "Software"), to deal
:: in the Software without restriction, including without limitation the rights
:: to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
:: copies of the Software, and to permit persons to whom the Software is
:: furnished to do so, subject to the following conditions:

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: THIS FILE CANNOT BE GUARANTEED SAFE FOR ALL MACHINES
:: USE AT YOUR OWN RISK

:: TO USE:
:: COPY A URL TO THE CLIPBOARD AND RUN THE SCRIPT, THE USER WILL BE PROMPTED FOR A LOCATION TO SAVE THE GALLERY IMAGES
:: EXISTING FILES WITH THE SAME NAME WILL BE SKIPPED ALLOWING THE SAVED FOLDER TO BE UPDATED AT WILL

:: THIS SCRIPT WILL DOWNLOAD IMAGE & VIDEOS ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


@echo off
setlocal enabledelayedexpansion

:: Define a temporary file to store the last selected path
set "last_path_file=last_path.txt"

:: Get the URL from the clipboard
for /f "tokens=*" %%i in ('powershell -command "Get-Clipboard"') do set "gallery_url=%%i"

:: Check if the URL was retrieved successfully
if "!gallery_url!"=="" (
    echo No URL found in clipboard. Exiting...
    exit /b
)

echo Gallery URL: !gallery_url!

:: Specify a default local folder to open in the browser dialog
set "default_folder=C:\Users\Ben\Downloads"

:: Check if the last path file exists and read from it
if exist "!last_path_file!" (
    set /p default_folder=<"!last_path_file!"
)

:: Open a folder dialog to select the download directory
set download_path=
for /f "delims=" %%k in ('powershell -command "[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null; $dialog = New-Object System.Windows.Forms.FolderBrowserDialog; $dialog.Description = 'Select Download Directory'; $dialog.SelectedPath = '%default_folder%'; if ($dialog.ShowDialog() -eq 'OK') { $dialog.SelectedPath }"') do set "download_path=%%k"

:: Check if the user selected a directory
if "!download_path!"=="" (
    echo No directory selected. Exiting...
    exit /b
)

echo Selected Download Path: !download_path!

:: Prompt for the base filename (without extension)
set /p base_filename="Enter the base filename for downloads (without extension): "

:: Check if the base_filename is not empty
if "!base_filename!"=="" (
    echo No base filename provided. Exiting...
    exit /b
)

:: Ensure the output path is valid
if not exist "!download_path!" (
    echo The selected directory does not exist. Exiting...
    exit /b
)

:: Save the selected path to the last_path.txt
echo "!download_path!" > "!last_path_file!"

:: Set a counter for naming files and check for existing numbers
set counter=1
set "final_filename="

:find_counter
set "final_filename=!download_path!\!base_filename!_!counter!.jpg"

:: Check if the filename already exists, increment if it does
if exist "!final_filename!" (
    set /a counter+=1
    goto find_counter
)

:: Run gallery-dl with the specified download location
gallery-dl -D "!download_path!" "!gallery_url!" || (
    echo gallery-dl failed to run or encountered an error!
    pause
    exit /b
)

:: Rename files to add the base filename and numbering
for %%f in ("!download_path!\*") do (
    set "ext=%%~xf"
    ren "%%f" "!base_filename!_!counter!!ext!"
    set /a counter+=1
)

echo Download completed successfully.
echo Press "x" to close the window.
choice /c x /n /m "Press a key to continue..."
if errorlevel 1 exit
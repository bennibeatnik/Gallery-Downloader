# Gallery Downloader

A simple batch script for downloading images and videos from online galleries using `gallery-dl`. 
This script allows users to quickly download media files by specifying a gallery URL and a preferred output directory. 
The downloaded files are saved using a specified base filename, automatically appending numbers to avoid conflicts.

## Features ## 

- Retrieves URLs directly from the clipboard.
- Allows selection of a download directory via a Windows folder dialog.
- Prompts for a base filename to be used for downloaded files.
- Automatically manages file naming to avoid conflicts by appending numbers.
- Uses `gallery-dl` to handle the downloading process, supporting various image hosting sites.

## Requirements ##

- [Python](https://www.python.org/downloads/) (version 3.x recommended)
- [gallery-dl](https://github.com/gallery-dl/gallery-dl) Python module (install via pip)
- Windows operating system (script utilizes PowerShell and Windows Forms)

## Installation ##

1. **Clone the repository** or download the script directly.
2. Ensure you have Python installed on your system.
3. Install `gallery-dl` using pip:
   ```bash
   pip install gallery-dl
4. Adjust the script if needed (e.g., specific directories).

## Usage ##

1. Copy the gallery URL to your clipboard.
2. Run the DownloadGallery.bat script. (Keyboard shortcut info below)
4. When prompted, select the directory where you want the images/videos to be saved.
5. Enter a base filename when prompted (without an extension) into the cmd window.
6. The script will download the gallery content directly into the specified folder with the base filename and an automatically generated number appended to avoid conflicts.


## Notes ##

- Ensure the URL corresponds to a supported site supported by gallery-dl.
- If running the script for the first time, the default download directory will be set to C:\Users\<YourUsername>\Downloads, but you can change this during the first download selection.
- 
-Simplify the process by using a dedicated keyboard shortcut
  - How to Create a Keyboard Shortcut for a .bat File
  - Find your .bat file in File Explorer (e.g., DownloadGallery.bat).
    - Right-click on the .bat file and select Create Shortcut. This will create a shortcut in the same directory.
    - Move the Shortcut (Optional): You can move the shortcut to a more convenient location, such as your Desktop or a designated folder for quick access.
  - Open Properties:
    - Right-click on the newly created shortcut and select Properties from the context menu.
  - Set the Keyboard Shortcut:
    - In the Shortcut tab of the Properties window, find the Shortcut key field.
    - Click inside this box and press the key combination you want to use (for example, Ctrl + Alt + G). Windows will show your chosen shortcut here.
    - Click OK to save your changes.
    - Run the Shortcut:
  - You can now use the keyboard shortcut you defined to run the .bat file from anywhere in Windows. Simply press your chosen key combination, and the script will execute.

  - Additional Notes:
    - Focus Requirement: Ensure that you are on your desktop or in a program that allows keyboard shortcuts when using the key combination. If another application has the focus, it may not trigger the shortcut.
    - Modify File Location: If you move the .bat file later, you may need to update the shortcut's target in the shortcut properties.
    - This method provides a quick way to run your batch file with a keyboard shortcut, allowing for easy access whenever needed! Let me know if you need any further instructions or assistance!

## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Acknowledgments
Thank you to the creators of gallery-dl for their work in creating a versatile tool for downloading gallery content. 

# PowerShell-Mac-Transfer

## Notes
- Make sure **Homebrew** is installed on macOS.
- If your Oh My Posh theme does not appear, check the path in `Microsoft.PowerShell_profile.ps1`.

A simple script to **transfer your PowerShell environment from Windows to macOS** while keeping settings, themes, and startup configurations intact.

## Features
✅ **Exports PowerShell Profile, Oh My Posh Themes, Git Config, and SSH Keys**  
✅ **Installs PowerShell, Oh My Posh, Neofetch, and Figlet on macOS**  
✅ **Automatically configures your PowerShell environment on macOS**  

## Usage

### **Step 1: Export from Windows**

1. Run the Windows script on your **Windows PC**.
2. This will generate a ZIP file on your **Desktop**.
3. Transfer the ZIP file to your **Mac** (via USB, Cloud, or Email).

### **Step 2: Import on macOS**

1. Move the ZIP file to your **Downloads** folder.
2. Open **Terminal** on macOS.
3. Run Mac script on your **Mac**.
4. Start PowerShell to test:
   ```sh
   pwsh
   ```


## License
MIT License. Feel free to use and modify.
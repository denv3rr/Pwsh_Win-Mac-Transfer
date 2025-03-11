sh
#!/bin/bash
# macOS Setup Script for PowerShell

echo "Starting PowerShell environment setup on macOS..."

# Install Homebrew (if not installed)
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Install PowerShell, Oh My Posh, Neofetch, and Figlet
brew install --cask powershell
brew install jandedobbeleer/oh-my-posh/oh-my-posh neofetch figlet

# Unzip the exported settings
TRANSFER_ZIP=~/Downloads/PowerShell_Mac_Transfer.zip
TRANSFER_DIR=~/PowerShell_Mac_Transfer

if [ -f "$TRANSFER_ZIP" ]; then
    echo "Extracting configuration files..."
    unzip -o "$TRANSFER_ZIP" -d "$TRANSFER_DIR"
else
    echo "Error: ZIP file not found in ~/Downloads. Please move it there and re-run the script."
    exit 1
fi

# Move PowerShell profile to correct location
mkdir -p ~/.config/powershell/
mv "$TRANSFER_DIR/Microsoft.PowerShell_profile.ps1" ~/.config/powershell/

# Move Oh My Posh themes
mkdir -p ~/.poshthemes/
mv "$TRANSFER_DIR/.poshthemes/"* ~/.poshthemes/

# Move Git config and SSH keys
mv "$TRANSFER_DIR/.gitconfig" ~/.gitconfig 2>/dev/null
mkdir -p ~/.ssh/ && mv "$TRANSFER_DIR/.ssh/"* ~/.ssh/ && chmod 600 ~/.ssh/id_rsa 2>/dev/null

# Set up PowerShell profile
echo 'figlet "Welcome to Mac!"' >> ~/.config/powershell/Microsoft.PowerShell_profile.ps1
echo 'neofetch' >> ~/.config/powershell/Microsoft.PowerShell_profile.ps1
echo 'oh-my-posh init pwsh --config ~/.poshthemes/your-theme.json | Invoke-Expression' >> ~/.config/powershell/Microsoft.PowerShell_profile.ps1

# Cleanup
rm -rf "$TRANSFER_DIR"
echo "Setup complete! Open PowerShell by running 'pwsh'."
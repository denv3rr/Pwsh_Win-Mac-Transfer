powershell

# Export Configs from Windows
$exportPath = "$env:USERPROFILE\Desktop\PowerShell_Mac_Transfer.zip"

# Define paths to export
$filesToExport = @(
    "$PROFILE",
    "$env:USERPROFILE\.poshthemes",
    "$env:USERPROFILE\.gitconfig",
    "$env:USERPROFILE\.ssh"
)

# Create a temporary folder
$tempFolder = "$env:USERPROFILE\Desktop\PowerShell_Mac_Transfer"
New-Item -ItemType Directory -Path $tempFolder -Force | Out-Null

# Copy files to temp folder
foreach ($file in $filesToExport) {
    if (Test-Path $file) {
        Copy-Item -Path $file -Destination $tempFolder -Recurse -Force
    }
}

# Create ZIP archive
Compress-Archive -Path "$tempFolder\*" -DestinationPath $exportPath -Force

Write-Host "Export complete! Find your ZIP file here: $exportPath"
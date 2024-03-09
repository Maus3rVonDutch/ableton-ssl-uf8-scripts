# Set the source and destination folder paths
$sourceFolderPath = Join-Path $PSScriptRoot "MackieControl_UF8"  # Use MackieControl_UF8 in the current location
$destinationFolderPath = "C:\ProgramData\Ableton\Live 12 Suite\Resources\MIDI Remote Scripts\MackieControl_UF8"

# List of files to be copied
$filesToCopy = @(
    "ChannelStripController.py",
    "MackieControl.py",
    "MackieControlComponent.py",
    "Transport.py"
)

# Function to rename the conflicting file with .pyc.ORG extension
function RenameToBackupFile ($file) {
    $backupFile = $file -replace ".pyc$", ".pyc.ORG"
    Rename-Item -Path $file -NewName $backupFile
    Write-Host "renamed: $($file) to $($backupFile)"
}

# Function to delete folders if they exist
function DeleteIfFolderExists ($path) {
    if (Test-Path -Path $path -PathType Container) {
        Remove-Item -Path $path -Recurse -Force
        Write-Host "Deleted folder: $($path)"
    }
}

# Delete __pycache__ and out folders from the destination path if they exist
$pycachePath = Join-Path $destinationFolderPath "__pycache__"
$outPath = Join-Path $destinationFolderPath "out"

DeleteIfFolderExists $pycachePath
DeleteIfFolderExists $outPath

# Loop through each file and copy back to the original location
foreach ($file in $filesToCopy) {
    $sourceFilePath = Join-Path $sourceFolderPath $file
    $destinationFilePath = Join-Path $destinationFolderPath $file

    $orgFilePath = $destinationFilePath -replace ".py$", ".pyc"

    # Check if the original file is still present, if so rename it by suffixing them with .ORG
    if (Test-Path -Path $orgFilePath -PathType Leaf) {
        RenameToBackupFile $orgFilePath
    }

    # Copy the decompiled file to the original location
    Copy-Item -Path $sourceFilePath -Destination $destinationFolderPath

    Write-Host "Copied: $($file)"
}

Write-Host "Copy process completed."

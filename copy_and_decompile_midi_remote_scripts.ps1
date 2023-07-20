# Before running the script, make sure you have installed the correct version of decompyle3 on your system 
# make sure Python 3.8 is installed (Currently using Python 3.8.9), then install decompyle3 with `py -m pip install decompyle3`
# NB using uncompyle6 results in incorrect output for py 3.7/3.8, see: https://pypi.org/project/decompyle3/#toc-entry-3

# Set the source and destination folder paths
$sourceFolderPath = "C:\ProgramData\Ableton\Live 11 Suite\Resources\MIDI Remote Scripts\MackieControl"
$destinationFolderPath = "C:\ProgramData\Ableton\Live 11 Suite\Resources\MIDI Remote Scripts\MackieControl_UF8"

# Copy the source folder to the destination folder
Copy-Item -Path $sourceFolderPath -Destination $destinationFolderPath -Recurse

# Set the path to the folder containing the Python files to be decompiled
$sourceFolderPath = $destinationFolderPath

# Set the output folder where decompiled files will be stored
$outputFolderPath = Join-Path $sourceFolderPath "out"

# Create the output folder if it doesn't exist
if (-Not (Test-Path -Path $outputFolderPath)) {
    New-Item -ItemType Directory -Path $outputFolderPath | Out-Null
}

# List of files to be decompiled
$filesToDecompile = @(
    "ChannelStripController.pyc",
    "MackieControl.pyc",
    "MackieControlComponent.pyc",
    "Transport.pyc"
)

# Loop through each file and decompile
foreach ($file in $filesToDecompile) {
    $sourceFilePath = Join-Path $sourceFolderPath $file
    $outputFilePath = Join-Path $outputFolderPath ($file -replace ".pyc$", ".py")

    # Check if the source file exists
    if (Test-Path -Path $sourceFilePath -PathType Leaf) {
        # Decompiling the file using decompyle3
        decompyle3 $sourceFilePath > $outputFilePath

        # Read the content and save with UTF-8 encoding without BOM
        $content = Get-Content -Path $outputFilePath
        $encoding = New-Object System.Text.UTF8Encoding $false  # Specify $false to prevent BOM
        [System.IO.File]::WriteAllLines($outputFilePath, $content, $encoding)

        Write-Host "Decompiled: $($file)"
    } else {
        Write-Host "File not found: $($file)"
    }
}

Write-Host "Decompilation completed."

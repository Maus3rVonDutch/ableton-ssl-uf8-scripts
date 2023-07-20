# ableton-ssl-uf8-scripts
SSL UF8 Ableton Push 2 (modified MackieControl midi remote scripts)

# What problem does this script solve?
I modified the MackieControl scripts for my personal needs. Originally the Channel Encoder of the UF8 is used to scroll through the channels on the UF8 only (and does nothing to Ableton's view or selection). This might soothe your needs, but it was not working for me.  

 This script makes it possbile to use the Channel encoder of the UF8 for selection/scrolling the selected track in Ableton, instead of using the cursor buttons as mentioned in the SSL UF8 manual. This works both ways, so selecting a track in Ableton will also make sure the UF8 updates to the corresponding bank and selected track.  

This scripts furthermore ensures that when scrolling out of view, the next bank of 8 is selected (also known as *auto-banking*) instead of moving all faders one by one (the original behavior).

# Disclaimer
This repo is primarily meant for my personal use. I decided however to make this repo public so any other Ableton/SSL UF8 users might benefit from it as well. That said, I am not responsible for any crashes, messed up systems and bugs that might occur using these scripts. So make sure you know what you are doing, use common sense and for instance always make a backup of any original files before proceding.

**In short: use these scripts at your own risk!!** Furthermore I will not respond to any feature requests or bug reports

# Steps to use the currently modified files "as is"
1. Create a copy of the original MackieControl folder and name it **MackieControl_UF8**  
  *(the original files can be found here on Windows: `C:\ProgramData\Ableton\Live 11 Suite\Resources\MIDI Remote Scripts\MackieControl`)*
2. Then just copy the `*.py` files located in the folder MackieControl_UF8 in this repo to the folder you just created in the previous step
3. Rename any of the original matching files (so rename `\MIDI Remote Scripts\MackieControl_UF8\Transport.pyc` to `\MIDI Remote Scripts\MackieControl_UF8\Transport.pyc.BAK`). You need to this because Ableton will automatically pick up & compile any uncompiled `*.py` files and will compile theme for you, but this only works of there are no corresponding `*.pyc` files present. After Ableton is started you will find a new folder at that location named `__pycache__` which contains the compiled files.

> NB I have automated the above steps for my own needs, you can use those scripts as well, but again **AT YOUR OWN RISK**, so make sure you understand what the scripts do before using them.

## Some tips when it crashes
Sometimes the script seems to crash, the UF8 is not responding at all or you are seeing a message like "Ableton is offline". It might help to temporary switch back to an other remote script definition (like *MackieControl* or *MackieControl Classic* and then back to the modified *MackieControl UF88 script. If that doesn't help, you need to restart Ableton and/or you computer. I'm not sure what the issue is, it might be a bug in the scripts or just be some midi issue which happens regardless when using the UF8 controller (and has nothing to do with the scripts at all).

## Steps to start from scratch (a note to self ;))
### Decompiling *.py Mackiecontrol MidiRemoteSCripts 
Ableton version 11.3.4 is currently using Python 3.7.0. Use any of below commands (using Python 3.8.9 seems to work) to decompile the files and copy the modified files back to the remote scripts location.

## Copy original files to MackieControl_UF8 and decompile only relevant files
1. Execute these script from a PowerShell command prompt: `copy_and_decompile_midi_remote_scripts.ps1`
2. This script contains some hardcoded Windows paths, you can find the copied MackieControl scripts here:  
   `C:\ProgramData\Ableton\Live 11 Suite\Resources\MIDI Remote Scripts\MackieControl_UF8`
3. The folder also contains an out folder in which you can find the decompiled scripts.
4. Modify the scripts to your needs (like is done in this repo)

## Copy modified files back to the original location
1. Use this script to copy back the modified files `copy_modified_files_to_ableton_midi_remote_scripts.ps1`
2. NB this script also uses some hardcode Windows paths. Also the script not only copies the modified files, but also ensure renaming of the original matching files and make sure any folders (*out* & *__pycache__*) are deleted.

> I first tried decompiling the files using *uncompyle6* instead of *decompyle3*, but there are some issues with that in relation to the Python version. However, maybe in the future Ableton will upgrade to a newer Python version, which might lead to errors using *decompyle3*. If that happens switch out the decompilers.



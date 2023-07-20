# ableton-ssl-uf8-scripts
SSL UF8 Ableton Push 2 (modified MackieControl midi remote scripts)

# Disclaimer
This repo is primarily meant for my personal use, however I decided to make this repo public so any other Ableton/SSL UF8 users might benefit from it as well. That said, I am not responsible for any crashes, messed up systems and bugs that might occur using these scripts. So make sure you know what you are doing, use common sense and for instance always make a backup of any original files before proceding.

**In short: use these scripts at your own risk and I will not respond to any feature requests or bug reports**

# Steps to use the currently modified files as is
1. Create a copy of the original MackieControl folder and name it MackieControl_UF8  
  *(the original files can be found here on Windows: C:\ProgramData\Ableton\Live 11 Suite\Resources\MIDI Remote Scripts)*
2. Then just copy the *.pyc files located in the folder MackieControl_UF8 in this repo to the folder from the previous step  
    *NB once Ableton starts and finds any decompiled (\*.pyc) files it will automatically compile the \*.pyc files to \*.py files*


## Steps to start from scratch (note to self ;)
### Decompiling *.py Mackiecontrol MidiRemoteSCripts 
Ableton version 11.4 is currently using Python 3.7.0. Use any of below commands (using Python 3.8.9 seems to work) to decompile the files to an /out dir

## to decompile only relevant files use
`uncompyle6 -ro ./out .`

## to decompile all files to an out dir use
`uncompyle6 -ro ./out .`



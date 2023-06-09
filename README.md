# SnipIt
An AutoHotkey-based script to replace text snippets by predefined text, date or time information.

SETUP
Copy the SnipIt.exe and the Input.ini file into a folder. Note that this script only works on Windows PCs.

COMPILING THE CODE
Download all the files (SnipIt.ahk and folders \media and \sub). Place all of them in a folder and compile the SnipIt.ahk script using the AutoHotkey tool.

HOW THE SCRIPT WORKS
The script will run in the background and "listen" to your keyboard input. If it recognizes a predefined sequence, e.g. abc, it will replace that sequence of characters by something else, that is defined in the Input.ini file (abc = something else). So typing "abc" will be replaced by "something else". There are some special characters that can be introduced, for instance for adding the date or time information or to add a new line ("Enter"). These special characters are listed below:
- \`%dd --> replaced by day: 01 - 31
- \`%d --> replaced by day: 1 - 31
- \`%MM --> replaced by month: 01 - 12
- \`%M --> replaced by month: 1 - 12
- \`%y --> replaced by year: e.g. 8 (no leading zero)
- \`%yy --> replaced by year: e.g. 08 (with leading zero)
- \`%yyyy --> replaced by year: e.g. 2017
- \`%hh --> replaced by hour: 01 - 12
- \`%h --> replaced by hour: 1 - 12
- \`%HH --> replaced by hour: 01 - 23
- \`%H --> replaced by hour: 1 - 23
- \`%mm --> replaced by minutes: 00 - 59
- \`%m --> replaced by minutes: 0 - 59
- \`%ss --> replaced by seconds: 00 - 59
- \`%s --> replaced by seconds: 0 - 59
- {n} --> replaced by an "Enter" command, i.e. new line.

USING THE SCRIPT
1) Run the SnipIt.exe file.
2) Hit "Ctrl+Shift+S" to call the setup.
- To create an entry: Enter a SNIPPET (short, e.g. 3-5 characters) and a REPLACEMENT string and click on "Add".
- To delete an entry: Mark it in the list on the left and click "Delete".
- NOTE: after you are done click "Continue". This will close the setup and keep the script running in the background. 
3) To stop the script either click "Stop" in the setup, hit "Ctrl+Shift+Q" or go to the windows taskbar (bottom right of the screen), find the running programs and the green icon with a white H and close it.
4) "Ctrl+Shift+P", toggles the sound after replacing the snippet ON/OFF.

Hint: The easiest way to add more snippets is to directly edit the Input.ini file. If, however, you do that you will have to call the setup to load the newly saved  Input.ini and have access to the new snippets you added.
Note: While the script is running a hidden "List.txt" is used. It contains a list of all the snippets.

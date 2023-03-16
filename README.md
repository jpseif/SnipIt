# snipit
AutoHotkey-based version of TextExpander.

1) Run the EXE.
2) Hit "Ctrl+Shift+S" to call the setup.
3) Enter a SNIPPET (short, e.g. 3-5 characters) and REPLACEMENT string. Check the list below or the Input.ini file for examples for time and date. Essentially it's %yy for the year, e.g. 17. So in the replacement input e.g. "\`%yy\`%MM\`%dd" (without the double quotes) will be replaced by "170814" for August 14th 2017.
	
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

4) When running, the script logs your keystrokes and once it finds a sequence that matches a SNIPPET it will replace that string by the REPLACEMENT.
5) "Ctrl+Shift+Q", will stop the script.
6) "Ctrl+Shift+P", toggles the sound ON/OFF.

Last review: 15.08.2017
J.Seif

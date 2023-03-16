RestartGUI:

; initialize all the variables
TotalLinesInput := 0
KeyList := ""
ValueList := ""
FirstEntryInput := 0
InputLines := 0
CapturedString := ""
InputArray := Object()
SplitKeyArray := Object()

; count the lines in the List.txt
Loop, Read, %A_ScriptDir%\List.txt
{
  TotalLinesInput++
}

Loop, Read, %InputFile%
{
  InputLines++

  if InputLines > TotalLinesInput
  {
    break
  }

  ; read the Input.ini file line by line
  FileReadLine, ReadLine, %InputFile%, InputLines
  RegExMatch(ReadLine, "O)\[([[:alnum:]].*)\]", CapturedString)

  if CapturedString.Value(1)
  {
    Section := CapturedString.Value(1)
    Goto, SkipLine
  }

  if Section = Strings
  {
    InputArray := StrSplit(ReadLine, "=")
    ; store the keys and values
    KeyArray.Insert(InputArray[1])
    ValueArray.Insert(InputArray[2])

    ; generate a list of keys and values for the list
    if FirstEntryInput = 0
     {
      KeyList := InputArray[1]
      ValueList := InputArray[2]
      KeyValueList := InputArray[1] . " => " . InputArray[2]
      FirstEntryInput := 1
     }
    else
    {
      KeyList := KeyList . "|" . InputArray[1]
      ValueList := ValueList . "|" . InputArray[2]
      KeyValueList := KeyValueList . "|" . InputArray[1] . " => " . InputArray[2]
      StringReplace, ValueList, ValueList, ``,, All
    }
  }

  SkipLine:
}

; define the GUI
Gui, New,, SNIPPET-RUNNER: Snippets & Replacements
Gui, Font, s8, Verdana
Gui, Add, Text, x20 y20, Snippets => Replacements
; Gui, Add, ListBox, x20 y+5 w100 h200 Multi vChosenKey, %KeyList%
; Gui, Add, Text, x20 y+5, ...to be replaced by
Gui, Add, ListBox, x20 y+5 w410 h200 ReadOnly vChosenValue, %KeyValueList%
Gui, Add, Text, x+10 y20, Enter snippet (max. 10):
Gui, Add, Edit, xp y+5 w150 h20 vSnippet
Gui, Add, Text, xp y+5, Enter replacement:
Gui, Add, Edit, xp y+5 w150 h20 vReplacement
Gui, Add, Button, xp y+5 w150, Add
Gui, Add, Button, xp y+5 w150, Delete
Gui, Add, Button, Default xp y+5 w150, Continue
Gui, Add, Button, xp y+5 w150, Stop
Gui, Font
Gui, Add, Text, xp y+15, (c) by J. Seif 2017
Gui, -SysMenu
Gui, show, w610 h260

Sleep, 100000000000
SoundBeep, 750, 500
WinWaitClose

; delete button
ButtonDelete:
Gui, Submit, NoHide
; delete key and value in Input.ini file
text := ChosenValue
GuiControl, +AltSubmit, ChosenValue
Gui, Submit, NoHide
pos := ChosenValue
GuiControl, -AltSubmit, ChosenValue
SplitKeyArray := StrSplit(KeyList, "|")
ChosenKey := SplitKeyArray[pos]
IniDelete, %InputFile%, Strings, %ChosenKey%
Gui, Destroy
Goto, RestartGUI

; add button
ButtonAdd:
Gui, Submit, NoHide
if !Snippet
{
  MsgBox, Enter a snippet first!
  Goto, RestartGUI
}
if !Replacement
{
  MsgBox, Enter a replacement string first!
  Goto, RestartGUI
}

StringReplace, Replacement, Replacement, `%, ```%, All

IniWrite, %Replacement%, %InputFile%, Strings, %Snippet%
Gui, Destroy
Goto, RestartGUI

; continue button
ButtonContinue:
Gui, Destroy
Run "%A_ScriptFullPath%"

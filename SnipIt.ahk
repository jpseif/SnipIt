#SingleInstance force ; reloads the script automatically and kills any old version that might be running.
#NoEnv ; Avoids checking empty variables to see if they are environment variables (recommended for all new scripts).

; #############################################################################
; # INITIALIZE ################################################################
; #############################################################################

; initialize arrays
KeyArray := Object()
KeyStrokesIndex := Object()

; Define functions
#Include %A_ScriptDir%\sub\IniRead.ahk
#Include %A_ScriptDir%\sub\HasVal.ahk
#Include %A_ScriptDir%\sub\ReplaceFlags.ahk

; define Input.ini path
InputFile = %A_ScriptDir%\Input.ini

; read Input.ini file (using the function IniRead.ahk)
IniFile := IniRead("Input.ini", "d ka")

; read sound setting
IniRead, SoundSetting, %InputFile%, Settings, SoundSetting

; delete the list txt file if it exists
ListPath = %A_ScriptDir%\List.txt
if FileExist(ListPath)
{
  FileDelete, %A_ScriptDir%\List.txt
}

; put the list of keys from the ini file into the List.txt file
FileAppend, %IniFile%, %A_ScriptDir%\List.txt

; count the lines in the List.txt
Loop, Read, %A_ScriptDir%\List.txt
{
  TotalLines++
}

; get the keys and put them into the KeyArray
ListLines := 0
Loop, Read, %A_ScriptDir%\List.txt
{
  ListLines++

  If ListLines > TotalLines
  {
    break
  }
  Else
  {
    FileReadLine, ReadLine, %A_ScriptDir%\List.txt, ListLines
    KeyArray[ListLines] := ReadLine
  }
}
; hide list file.
FileSetAttrib, +H, %A_ScriptDir%\List.txt

; #############################################################################
; # LOG KEYSTROKES AND REPLACE ################################################
; #############################################################################

; log keystrokes and check after every 5th keystroke if the pattern exists in the KeyArray
KeyStrokesIndex := 0
Loop {
  KeyStrokesIndex++

  ; log the keyboard input
	Input, key, V L1 I
	log := log . key

  ; define the string that was input by the user
  LogString := """" . log . """"

  ; cross check whether the LogString contains one of the KeyValues (snippets) in the KeyArray --> if it does --> replace
  x2 := 0
  for item in KeyArray
  {
    x2++

    ; search snippet in LogString
    MatchFound := InStr(LogString, KeyArray[x2])

    ; if a snippet is found
    if MatchFound <> 0
    {
      ; get the title of the active window
      WinGetTitle, Title, A

      ; define the matched snipped
      FoundMatch := KeyArray[x2]

      ; read the replacement value from the Input.ini file
      IniRead, KeyValue, %InputFile%, Strings, %FoundMatch%

      ; replace flags in KeyValue
      KeyValue := ReplaceFlags(KeyValue)

      LenFoundMatch := StrLen(FoundMatch)

      ; remove the last x characters and replace them by the replacement
      x1 := 0
      for i in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
      {
        x1++
        x3 := LenFoundMatch - x1 + 1

        If x3 <> 0
        {
          WinActivate, % Title
          Send {Backspace}
        }
        Else
        {
          Goto, Skip
        }
      }

      Skip:
      ; send replacement
      If IsObject(KeyValue)
      {
        for i in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
        {
          if % i > KeyValue.Length()
          {
            break
          }

          SendRaw % KeyValue[i]
          Send, {Enter}
        }
      }
      Else
      {
        SendRaw %KeyValue%
      }

      if SoundSetting = 1
      {
        ; confirm by playing a sound
        SoundPlay, *-1
      }

      ; delete the List.txt file
      FileDelete, %A_ScriptDir%\List.txt
      Reload
    }
  }
}

^+q::
ButtonStop:
FileDelete, %A_ScriptDir%\List.txt
MsgBox, SnipIt is turning off now.
ExitApp

^+s::
; start setup
#Include, %A_ScriptDir%\sub\GUI.ahk

^+p::
; read the sound setting
IniRead, SoundSetting, %InputFile%, Settings, SoundSetting
if SoundSetting = 1
{
  IniWrite, 0, %InputFile%, Settings, SoundSetting
  MsgBox, % "Sounds switched off."
}
else
{
  IniWrite, 1, %InputFile%, Settings, SoundSetting
  MsgBox, % "Sounds switched on."
}
; restart the script
Run "%A_ScriptFullPath%"

$Esc::
Send {Esc}
; restart the script
Run "%A_ScriptFullPath%"

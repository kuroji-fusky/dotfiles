#NoEnv
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#IfWinActive ahk_exe AfterFX.exe

F1::
  Send, ^+d							; ctrl shift d [slice clip from playhead]
Return

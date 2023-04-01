; ============================================================= 
; Inspired by Taran's AHK tutorial, I'm still very new to this!
; ============================================================= 
;
; ===== SYNTAX REFERENCE =====
; ^ - Ctrl
; ! - Alt
; + - Shift
#NoEnv
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#IfWinActive ahk_exe Adobe Premiere Pro.exe
F1::
  Send ^!s							; ctrl alt s [select clip from playhead]
  Send ^!+d							; ctrl alt shift d [ripple delete clip on timeline]
Return

F2::
  Send ^k								; ctrl k [slice clip from playhead]
Return

; Ctrl+Shift+Mid Click to delete a selected clip
^+MButton::
  Send {Delete}
Return

; MOUSE4 - Paste attributes to a clip
XButton1::
  Send ^!v
Return

; MOUSE5 - Remove attributes to a clip
XButton2::
  Send {NumpadDot}
Return

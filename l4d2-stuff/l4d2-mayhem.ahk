#MaxThreadsPerHotkey 4

#IfWinActive ahk_exe left4dead2.exe
; Yes
^F10::
  SetKeyDelay, 30
  Send, `sv_cheats 1{Enter}sb_all_bot_game 1{Enter}
Return

; Spawn a horde of special infected via a special bind command
F9::
	toggle:=!toggle
	While toggle{
	  Send op{Numpad5}{Numpad1}
   ; Send w
    Sleep 50 
	}
Return

; Give pills to survivors quickly via a special bind command
; [Ctrl+Shift+RightClick]
!+RButton::
  Send {NumpadAdd}5{Click Right}
Return

; Spawn boomer at the crosshair's position
; Works 60% of the time, but I do this to near survivors lol
; [Alt+LeftClick]
!LButton::
  SetKeyDelay, 50 
  Send {Numpad5}{Click Left}
Return

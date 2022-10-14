#NoEnv
#MaxThreadsPerHotkey 4

#IfWinActive ahk_exe left4dead2.exe

; Do the cheat thing 
^F10::
  SetKeyDelay, 15 
  Send, sv_cheats 1{Enter}sb_all_bot_game 1{Enter}
Return

; Spawn a horde of special infected via a special bind command
F9::
	toggle := !toggle
	While toggle {
	  Send, poi{Numpad5}{Numpad1}
    Sleep, 50 
	}
Return

; Give pills to survivors quickly via a special bind command
; [Alt+Shift+RightClick]
!+RButton::
  Send, {NumpadAdd}5{Click Right}
Return

; Spawn boomer at the crosshair's position
; Works 60% of the time (only if you have an explosive upgrade
; in your primary weapon, but I do this to near survivors lol
; [Alt+LeftClick]
!LButton::
  SetKeyDelay, 50 
  Send, {Numpad5}{Click Left}
Return

; Alt+MidClick   -- Explosive upgrade
; Shift+MidClick -- Incindiary upgrade
!MButton::
  Send, {Numpad2}
Return

+MButton::
  Send, {NumpadIns}
Return

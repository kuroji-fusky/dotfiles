#MaxThreadsPerHotkey 4
F9::
	toggle:=!toggle
	While toggle{
	  Send op{Numpad5}{Numpad1}
   ; Send w
    Sleep 50 
	}
Return
F10::
  Send sv_cheats 1{Enter}sb_all_bot_game 1{Enter}

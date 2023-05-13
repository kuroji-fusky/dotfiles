; [NOTE] This AHK script will only work if the custom cfg file is applied
#NoEnv
#MaxThreadsPerHotkey 4

#IfWinActive ahk_exe left4dead2.exe
  ; Spawn a horde of special infected via a special bind command
  F9::
    toggle := !toggle
    While toggle {
      Send, poil{Numpad5}{Numpad1}
      Sleep, 50 
    }
  Return

  ; Spams `give health` over and over
  ; Perfect for hordes and special infected that will cuck you lul
  F10::
    toggle := !toggle
    While toggle {
      Send, {XButton2}
	  Sleep, 50 
    }
  Return

  ; The ULTIMATE CHAOS, SPAMS HEALTH AND PIPE BOMBS UNDER YOU YEAHHHH
  F8::
    toggle := !toggle
    While toggle {
      Send, {XButton2}{Numpad6}
	  Sleep, 120 
    }
  Return

  ; Give pills to survivors quickly via a special bind command
  ; Won't work half the time unless you're REALLY close to them
  ; [Alt+Shift+RightClick]
  !+RButton::
	SetKeyDelay, 75 
    Send, {NumpadAdd}55{Click Right}
  Return

  ; Spawn boomer at the crosshair's position
  ; Works 60% of the time only if you have an explosive upgrade
  ; in your primary weapon, but I do this to near survivors lol
  ; [Alt+LeftClick]
  !LButton::
    SetKeyDelay, 50 
    Send, {Numpad5}{Click Left}
  Return

  ; Alt+MidClick   -- Explosive upgrade
  !MButton::
    Send, {Numpad2}
  Return

  ; Shift+MidClick -- Incindiary upgrade
  +MButton::
    Send, {NumpadIns}
  Return

  ; Alt+SrlUp      -- up spec and noclip speed by 1.75
  !WheelUp::
    Send, {.}
  Return

  ; Alt+SrlDown    -- set spec and noclip speed to their defaults
  !WheelDown::
    Send, {/}
  Return

  ; Alt+1          -- down spec and noclip speed by 0.25 (perfect for cinematics)
  !1::
    Send, {,}
  Return

  !2::
	Send, {Numpad4}{]}
  Return

#NoEnv
#MaxThreadsPerHotkey 4

; ————————————————————————————————————————————————————————————————
; This AHK script will only work if the custom cfg file is applied
; ————————————————————————————————————————————————————————————————
#IfWinActive ahk_exe left4dead2.exe
  ; Spawn a horde of special infected via a special bind command
  F9::
    toggle := !toggle
    While toggle {
      Send, poi{Numpad5}{Numpad1}
      Sleep, 50 
    }
  Return

  ; Give pills to survivors quickly via a special bind command
  ; Won't work sometimes unless you're REALLY close to them
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
  !MButton::
    Send, {Numpad2}
  Return

  ; Shift+MidClick -- Incindiary upgrade
  +MButton::
    Send, {NumpadIns}
  Return

  ; Ctrl+SrlUp     -- up spec and noclip speed by 1.75
  ^WheelUp::
    Send, {.}
  Return

  ; Ctrl+SrlDown   -- down spec and noclip speed by 0.25 (perfect for cinematics)
  ^WheelDown::
    Send, {,}
  Return

  ; Ctrl+MidClick  -- set spec and noclip speed to their defaults
  ^MButton::
    Send, {/}
  Return

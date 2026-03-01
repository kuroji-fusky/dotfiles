#NoEnv

; I rarely use Chrome anyways, but it's here for good measure
#If WinActive("ahk_exe brave.exe") or WinActive("ahk_exe chrome.exe")
  {
    ^+p::SendInput, ^+n
  }
#If
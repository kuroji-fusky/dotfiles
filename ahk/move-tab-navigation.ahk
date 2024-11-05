tabAreaY := 48

#If WinActive("ahk_exe firefox.exe")
  !`::
    {
      MouseGetPos, xPos, yPos

      if (yPos < tabAreaY)
        Send, {Click Right}vw
      return
    }

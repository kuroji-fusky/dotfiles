# This is a temporary PowerShell file and will be put to use in the near future

function ConvertWebpToPng {
  foreach ($file in (Get-ChildItem -Path *.webp)) {
    ffmpeg -i $($file.FullName) $($($file.BaseName), $(".png") -join "") -y
    $file | Remove-Item -Verbose 
  }
}

function RemoveItemExt {
  param (
    [string]$FileType
  )

  foreach ($file in (Get-ChildItem -Path $FileType)) {
    $file | Remove-Item -Verbose 
  }
}

# Disable Game mode

$GameModePath = "HKCU:\Software\Microsoft\GameBar"

New-ItemProperty -Path $GameModePath -Name 'AllowAutoGameMode' -Value '0' -Type DWORD -Force
New-ItemProperty -Path $GameModePath -Name 'AutoGameModeEnabled' -Value '0' -Type DWORD -Force
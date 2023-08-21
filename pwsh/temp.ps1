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
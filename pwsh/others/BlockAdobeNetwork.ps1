$ProgramFileDir = "C:\Program Files\Adobe"
$adobePrograms = @(
  "Adobe After Effects CC 2019\Support Files\AfterFX.exe",
  "Adobe After Effects 2022\Support Files\AfterFX.exe",
  "Adobe Illustrator 2022\Support Files\Contents\Windows\Illustrator.exe",
  "Adobe Media Encoder 2022\Adobe Media Encoder.exe",
  "Adobe Photoshop 2022\Photoshop.exe",
  "Adobe Premiere Pro 2022\Adobe Premiere Pro.exe",
  "Adobe Premiere Pro CC 2019\Adobe Premiere Pro.exe"
)

function BlockAdobeNetwork {
  params (
    [string]$name,
    [string]$path
  )

  New-NetFirewallRule -DisplayName "Block $name lol" -Direction Inbound -Action Block -Program $path
  New-NetFirewallRule -DisplayName "Block $name lol" -Direction Outbound -Action Block -Program $path
  Write-Output "$name is from: $path is now blocked"
}

foreach ($programPath in $adobePrograms) {
  $ParseFilePath = "$ProgramFileDir\$programPath"

  $SplitName = $programPath.Split(" ")[1]

  BlockAdobeNetwork -name "Block Adobe $SplitName" -path $ParseFilePath
}

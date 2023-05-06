$ProgramFileDir = "C:\Program Files\Adobe"

$adobePrograms = @(
  "Adobe After Effects 2022\Support Files\AfterFX.exe",
  "Adobe Illustrator 2022\Support Files\Contents\Windows\Illustrator.exe",
  "Adobe Media Encoder 2022\Adobe Media Encoder.exe",
  "Adobe Photoshop 2022\Photoshop.exe",
  "Adobe Premiere Pro 2022\Adobe Premiere Pro.exe"
)

function BlockAdobeNetwork([string]$name, [string]$path) {
  New-NetFirewallRule -DisplayName "Block $name lol" -Direction Inbound -Action Block -Program $path
  New-NetFirewallRule -DisplayName "Block $name lol" -Direction Outbound -Action Block -Program $path
  Write-Output "$name is from: $path is Naw blocked"
}

foreach ($breakDemBitches in $adobePrograms) {
  $ParseFilePath = "$ProgramFileDir\$breakDemBitches"

  $SplitName = $breakDemBitches.Split(" ")[1]

  If ($SplitName -eq "After") {
    BlockAdobeNetwork -name "Adobe After Effects" -path $ParseFilePath
  }
  ElseIf ($SplitName -eq "Media") {
    BlockAdobeNetwork -name "Adobe Media Encoder" -path $ParseFilePath
  }
  ElseIf ($SplitName -eq "Premiere") {
    BlockAdobeNetwork -name "Adobe Media Encoder" -path $ParseFilePath
  }
  Else {
    BlockAdobeNetwork -name "Adobe $SplitName" -path $ParseFilePath
  }
}

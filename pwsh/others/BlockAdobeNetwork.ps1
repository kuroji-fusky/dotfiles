$baseDir = "C:\Program Files\Adobe"
$adobePrograms = @(
  "Adobe After Effects CC 2019\Support Files\AfterFX.exe",
  "Adobe After Effects 2022\Support Files\AfterFX.exe",
  "Adobe Illustrator 2022\Support Files\Contents\Windows\Illustrator.exe",
  "Adobe Media Encoder 2022\Adobe Media Encoder.exe",
  "Adobe Photoshop 2022\Photoshop.exe",
  "Adobe Premiere Pro 2022\Adobe Premiere Pro.exe"
)

foreach ($programPath in $adobePrograms) {
  $ParseFilePath = "$baseDir\$programPath"
  $SplitName = $programPath.Split(" ")[1]

  New-NetFirewallRule -DisplayName "Block $SplitName Connections" -Direction Inbound -Action Block -Program $ParseFilePath
  New-NetFirewallRule -DisplayName "Block $SplitName Connections" -Direction Outbound -Action Block -Program $ParseFilePath
  Write-Output "$name is from: $path is now blocked"
}

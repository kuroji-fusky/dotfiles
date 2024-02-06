#Requires -RunAsAdministrator

$bloat = @(
  '*WebExperience*',
  "*bing*",
  "*xbox*",
  "*messaging*",
  "*onenote*",
  "*skype*",
  "*skype*",
  "*3dviewer*",
  "*maps*",
  "*feedback*",
  "*help*",
  "*zune*",
  "*news*",
  "*get*",
  "*started*",
  "*people*",
  "*yourphone*",
  "*cortana*"
)

foreach ($abomination in $bloat) {
  Get-AppxPackage $abomination | Remove-AppxPackage -Verbose
  Get-AppxPackage -AllUsers $abomination | Remove-AppxPackage -Verbose
}
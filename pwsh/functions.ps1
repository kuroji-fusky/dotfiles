function PurgeContent() {
  $PKG_YARN = Test-Path -Path "./yarn.lock"
  $PKG_NPM = Test-Path -Path "./package-lock.json"
  $PKG_PNPM = Test-Path -Path "./pnpm-lock.yaml"

  Write-Output $PKG_NPM
  Write-Output $PKG_YARN
  Write-Output $PKG_PNPM

  Write-Output "cleaning node_modules"
}
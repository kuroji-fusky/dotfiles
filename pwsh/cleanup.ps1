$NEXT_PROJECT = Test-Path -Path "./next.config.js"
$NUXT_PROJECT = Test-Path -Path "./nuxt.config.js"
$SVELTE_PROJECT = Test-Path -Path "./svelte.config.js"

$USES_YARN = Test-Path -Path "./yarn.lock"
$USES_NPM = Test-Path -Path "./package-lock.json"
$USES_PNPM = Test-Path -Path "./pnpm-lock.yaml"

function PurgeContent() {
  Write-Output $USES_NPM
  Write-Output $USES_YARN
  Write-Output $USES_PNPM

  Write-Output "cleaning node_modules"
}

if ($NEXT_PROJECT) {
  Write-Output "Detected Next.js"
}
elseif ($NUXT_PROJECT) {
  Write-Output "Detected Nuxt.js"
}
elseif ($SVELTE_PROJECT) { 
  Write-Output "Detected Svelte/Kit"
}

PurgeContent
$NEXT_PROJECT = Test-Path -Path "./next.config.js"
$NUXT_PROJECT = Test-Path -Path "./nuxt.config.js"
$SVELTE_PROJECT = Test-Path -Path "./svelte.config.js"

$USES_YARN = Test-Path -Path "./yarn.lock"
$USES_NPM = Test-Path -Path "./package-lock.json"
$USES_PNPM = Test-Path -Path "./pnpm-lock.yaml"

function Purge-Content() {
	echo $USES_NPM
	echo $USES_YARN
	echo $USES_PNPM

	echo "cleaning node_modules"
}

if ($NEXT_PROJECT) {
	echo "Detected Next.js"
}
elseif ($NUXT_PROJECT) {
	echo "Detected Nuxt.js"
}
elseif ($SVELTE_PROJECT) { 
	echo "Detected Svelte/Kit"
}

Purge-Content
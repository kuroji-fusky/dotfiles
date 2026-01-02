# =================================================
# Common dev commands

function yi { yarn install }
function yd { yarn dev }
function yb { yarn build }
function ys { yarn start }
function yp { yarn preview }

# todo: add a override if package-lock.json or pnpm-lock.yaml is found and has both lockfiles with yarn, fall back to yarn commands

function Set-InitializeVenv {
  if (Get-Command python) {
    python.exe -m venv venv
    return
  }

  if (Get-Command py) {
    py -m venv venv
    return
  }
  
  if (Get-Command python3) {
    python3 -m venv venv
    return
  }
}

function Set-DeactivateVenv {
}

Set-Alias -Name venvi -Value Set-InitializeVenv
Set-Alias -Name venvd -Value Set-DeactivateVenv
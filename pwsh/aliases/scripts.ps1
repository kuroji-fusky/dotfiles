# =================================================
# Common dev commands

function yi { yarn install }
function yd { yarn dev }
function yb { yarn build }
function ys { yarn start }
function yp { yarn preview }

function InitializeVenv {
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

function DeactivateVenv {
}

Set-Alias -Name venvi -Value InitializeVenv
Set-Alias -Name venvd -Value DeactivateVenv
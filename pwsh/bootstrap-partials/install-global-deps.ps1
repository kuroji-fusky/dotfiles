$NPM_Packages = @(
  "typescript",
  "yarn",
  "pnpm",
  "npkill",
  "prettier"
)

$Python_Packages = @(
  "numpy",
  "autopep8",
  "mypy",
  "requests",
  "beautifulsoup4",
  "pytube",
  "ffmpeg-python",
  "opencv-contrib-python",

  # Data science stuff
  "pandas",
  "matplotlib",
  "ipykernel"
)

if (Get-CheckCommand "npm") {
  npm install -g $NPM_Packages
}
else {
  Write-Output "Node/npm not installed; won't be installing npm packages"
}

if (
  (
    (Get-CheckCommand "python") -or `
    (Get-CheckCommand "python3") -or `
    (Get-CheckCommand "py")
  ) -and `
  (
    (Get-CheckCommand "pip") -or `
    (Get-CheckCommand "pip3")
  )
) {
  python -m pip install -U $Python_Packages --verbose
}
else {
  Write-Output "Python not installed; won't be installing pip packages"
}
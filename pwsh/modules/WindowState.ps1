function Get-WindowState {
  param (
    [string]$Process
  )

  Add-Type -TypeDefinition $(Get-Content ".\CheckWindowState.cs" -Raw)

  $process = Get-Process -Name $Process -ErrorAction Stop
  $hWnd = $process.MainWindowHandle
  
  if ($hWnd -eq [IntPtr]::Zero) {
    Write-Output "No window found for process: $Process"
    return
  }

  $state = [CheckWindowState]::GetWindowState($hWnd)
  Write-Output $state
}

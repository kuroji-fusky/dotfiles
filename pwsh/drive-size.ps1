function Get-RoundedSize {
  param (
    [long]$Bytes
  )
    
  $_TBSize = 1TB
  $_PBSize = 1PB

  $SizeInGB = [math]::Round($Bytes / 1GB, 2)
  $SizeInTB = [math]::Round($Bytes / $_TBSize, 2)
  $SizeInPB = [math]::Round($Bytes / $_PBSize, 2)

  if ($Bytes -ge $_PBSize) {
    return "$SizeInPB PB"
  }
  elseif ($Bytes -ge $_TBSize) {
    return "$SizeInTB TB"
  }
  else {
    return "$SizeInGB GB"
  }
}

function Get-DriveSize {
  $MountedVolumes = Get-Volume | Where-Object { $null -ne $_.DriveLetter }

  $TotalSize = $($MountedVolumes | Measure-Object -Property Size -Sum).Sum
  $RemainingSize = $($MountedVolumes | Measure-Object -Property SizeRemaining -Sum).Sum

  $RelativeSize = "$([math]::Round($RemainingSize / $TotalSize * 100, 2))%"

  $TotalSizeReadable = Get-RoundedSize -Bytes $TotalSize
  $RemainingSizeReadable = Get-RoundedSize -Bytes $RemainingSize

  $MountedVolumeTable = $MountedVolumes | Select-Object DriveLetter, FileSystemLabel , Size, SizeRemaining
  $MountedVolumeTable

  $TotalDriveCount = $($MountedVolumes | Measure-Object -Line).Lines

  Write-Output "`nYou have a total of $TotalSizeReadable of space across $TotalDriveCount drives, and $RemainingSizeReadable ($RelativeSize) remaining left"
}

Set-Alias -Name ds -Value Get-DriveSize
Set-Alias -Name dsize -Value Get-DriveSize
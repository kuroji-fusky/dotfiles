using System;
using System.Runtime.InteropServices;

public class CheckWindowState
{
  public enum WindowState
  {
    Normal,
    Minimized,
    Maximized,
    Unknown
  }

  public struct WINDOWPLACEMENT
  {
    public int length;
    public int showCmd;
  }

  [DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]
  [return: MarshalAs(UnmanagedType.Bool)]
  public static extern bool IsWindowVisible(IntPtr hWnd);

  [DllImport("user32.dll", CharSet = CharSet.Auto, ExactSpelling = true)]
  public static extern IntPtr GetForegroundWindow();

  [DllImport("user32.dll", SetLastError = true)]
  public static extern bool GetWindowPlacement(IntPtr hWnd, ref WINDOWPLACEMENT lpwndpl);


  public static WindowState GetWindowState(IntPtr hWnd)
  {
    WINDOWPLACEMENT placement = new WINDOWPLACEMENT();
    placement.length = Marshal.SizeOf(placement);

    if (!GetWindowPlacement(hWnd, ref placement))
    {
      return WindowState.Unknown;
    }

    switch (placement.showCmd)
    {
      case 1:
        return WindowState.Normal;
      case 2:
        return WindowState.Minimized;
      case 3:
        return WindowState.Maximized;
      default:
        return WindowState.Unknown;
    }
  }
}

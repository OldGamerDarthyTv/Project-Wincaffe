Add-Type @"
using System.Runtime.InteropServices;
public class TR{[DllImport("ntdll.dll")]public static extern int NtSetTimerResolution(uint d,bool s,out uint c);}
"@
$Host.UI.RawUI.WindowTitle="Timer 0.5ms - OGD v7.2.2"
$d=5000;$c=0;[TR]::NtSetTimerResolution($d,$true,[ref]$c)
Write-Host "Timer 0.5ms attivo - Minimizza (non chiudere)" -ForegroundColor Green
while($true){Start-Sleep 3600}

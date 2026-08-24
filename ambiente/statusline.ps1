# Statusline do Claude Code - variante Windows (PowerShell 5.1+), sem dependencias.
$raw = [Console]::In.ReadToEnd()
try { $p = $raw | ConvertFrom-Json } catch { exit 0 }

$esc = [char]27
$reset = "$esc[0m"; $dim = "$esc[2m"; $magenta = "$esc[35m"
$green = "$esc[32m"; $yellow = "$esc[33m"; $red = "$esc[31m"; $cyan = "$esc[1;36m"
$sep = "$dim | $reset"

function IntOr($v) { if ($null -eq $v -or "$v" -eq "") { 0 } else { [int][math]::Floor([double]$v) } }
function PctColor($n) { if ($n -ge 80) { $red } elseif ($n -ge 50) { $yellow } else { $green } }

$model = ""
if ($p.model -and $p.model.display_name) { $model = $p.model.display_name }

$ctx = IntOr $p.context_window.used_percentage
if ($ctx -lt 0) { $ctx = 0 }; if ($ctx -gt 100) { $ctx = 100 }
$filled = [int][math]::Floor($ctx / 10)
$bar = ([string][char]0x2588) * $filled + ([string][char]0x2591) * (10 - $filled)

$parts = @()
$parts += "$magenta$model$reset"
$parts += ((PctColor $ctx) + "$bar $ctx%$reset")

$cwd = $null
if ($p.workspace -and $p.workspace.current_dir) { $cwd = $p.workspace.current_dir }
elseif ($p.cwd) { $cwd = $p.cwd }
if ($cwd) {
  $branch = & git -C $cwd symbolic-ref --short HEAD 2>$null
  if ($branch) { $parts += "$green$branch$reset" }
}

$five = IntOr $p.rate_limits.five_hour.used_percentage
$seven = IntOr $p.rate_limits.seven_day.used_percentage
$parts += ((PctColor $five) + "5h:$five%$reset")
$parts += ((PctColor $seven) + "7d:$seven%$reset")

$resets = $null
if ($p.rate_limits -and $p.rate_limits.five_hour) { $resets = $p.rate_limits.five_hour.resets_at }
if ($resets) {
  $delta = [long]$resets - [DateTimeOffset]::UtcNow.ToUnixTimeSeconds()
  if ($delta -lt 0) { $delta = 0 }
  $h = [int][math]::Floor($delta / 3600)
  $m = [int][math]::Floor(($delta % 3600) / 60)
  if ($h -gt 0) { $txt = "{0}h{1:d2}m" -f $h, $m } else { $txt = "${m}m" }
  $parts += "${dim}reset $txt$reset"
}

if ($cwd) { $parts += "$cyan$(Split-Path $cwd -Leaf)$reset" }

[Console]::Out.WriteLine(($parts -join $sep))

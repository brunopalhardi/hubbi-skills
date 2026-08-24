#!/usr/bin/env bash
# Claude Code statusline — single line, ANSI-colored, jq-driven.

set -u

input=$(cat)

# ANSI
reset=$'\033[0m'
dim=$'\033[2m'
magenta=$'\033[35m'
green=$'\033[32m'
yellow=$'\033[33m'
red=$'\033[31m'
bold_cyan=$'\033[1;36m'
sep="${dim} │ ${reset}"

# Parse payload
model=$(printf '%s' "$input" | jq -r '.model.display_name // ""')
ctx_pct=$(printf '%s' "$input" | jq -r '.context_window.used_percentage // 0')
cwd=$(printf '%s' "$input" | jq -r '(.workspace.current_dir // .cwd) // ""')
five_pct=$(printf '%s' "$input" | jq -r '.rate_limits.five_hour.used_percentage // 0')
five_reset=$(printf '%s' "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
seven_pct=$(printf '%s' "$input" | jq -r '.rate_limits.seven_day.used_percentage // 0')
transcript=$(printf '%s' "$input" | jq -r '.transcript_path // ""')

# Truncate floats to int
to_int() {
  local v=${1:-0}
  v=${v%.*}
  [ -z "$v" ] && v=0
  printf '%d' "$v" 2>/dev/null || printf '0'
}

pct_color() {
  local p=$1
  if [ "$p" -ge 80 ]; then printf '%s' "$red"
  elif [ "$p" -ge 50 ]; then printf '%s' "$yellow"
  else printf '%s' "$green"; fi
}

# 1) Model
model_part="${magenta}${model}${reset}"

# 2) Context progress bar (10 blocks) + %
ctx_int=$(to_int "$ctx_pct")
[ "$ctx_int" -lt 0 ] && ctx_int=0
[ "$ctx_int" -gt 100 ] && ctx_int=100
filled=$(( ctx_int / 10 ))
empty=$(( 10 - filled ))
bar=""
for ((i=0;i<filled;i++)); do bar="${bar}█"; done
for ((i=0;i<empty;i++)); do bar="${bar}░"; done
ctx_color=$(pct_color "$ctx_int")
ctx_part="${ctx_color}${bar} ${ctx_int}%${reset}"

# 3) Git branch (only if git repo)
git_part=""
if [ -n "$cwd" ] && git -C "$cwd" rev-parse --git-dir >/dev/null 2>&1; then
  branch=$(git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null)
  if [ -z "$branch" ]; then
    branch=$(git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
  fi
  if [ -n "$branch" ]; then
    git_part="${green} ${branch}${reset}"
  fi
fi

# 4) 5h rate limit
five_int=$(to_int "$five_pct")
five_color=$(pct_color "$five_int")
five_part="${five_color}5h:${five_int}%${reset}"

# 5) 7d rate limit
seven_int=$(to_int "$seven_pct")
seven_color=$(pct_color "$seven_int")
seven_part="${seven_color}7d:${seven_int}%${reset}"

# 6) Time remaining until 5h rate-limit window resets
duration_part=""
if [ -n "$five_reset" ]; then
  now=$(date +%s)
  delta=$(( five_reset - now ))
  [ "$delta" -lt 0 ] && delta=0
  hours=$(( delta / 3600 ))
  mins=$(( (delta % 3600) / 60 ))
  if [ "$hours" -gt 0 ]; then
    remaining_str=$(printf '%dh%02dm' "$hours" "$mins")
  else
    remaining_str="${mins}m"
  fi
  duration_part="${dim}reset ${remaining_str}${reset}"
fi

# 7) Folder basename
folder_part=""
if [ -n "$cwd" ]; then
  base=$(basename "$cwd")
  folder_part="${bold_cyan}${base}${reset}"
fi

# Assemble with separator, skipping empty parts
parts=("$model_part" "$ctx_part")
[ -n "$git_part" ] && parts+=("$git_part")
parts+=("$five_part" "$seven_part")
[ -n "$duration_part" ] && parts+=("$duration_part")
[ -n "$folder_part" ] && parts+=("$folder_part")

out=""
for i in "${!parts[@]}"; do
  if [ "$i" -eq 0 ]; then
    out="${parts[$i]}"
  else
    out="${out}${sep}${parts[$i]}"
  fi
done

printf '%b\n' "$out"

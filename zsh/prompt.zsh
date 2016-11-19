autoload -U colors && colors

local color_red="\033[38;5;197m"
local color_orange="\033[38;5;208m"
local color_white="\033[38;5;15m"
local color_yellow_green="\033[38;5;190m"

if (( $+commands[git] )); then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_prompt_info() {
  ref=$($git symbolic-ref HEAD 2>/dev/null) || return
  echo "${ref#refs/heads/}"
}

unpushed() {
  $git cherry -v @{upstream} 2>/dev/null
}

host_name() {
  echo "${color_white}at ${color_orange}%M $reset_color"
}

directory_name() {
  echo "${color_white}in ${color_yellow_green}%~ $reset_color"
}

git_dirty() {
  if $(! $git status -s &> /dev/null); then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]; then
      echo "${color_white}on ${color_red}$(git_prompt_info) $reset_color"
    else
      echo "${color_white}on ${color_red}$(git_prompt_info)* $reset_color"
    fi
  fi
}

need_push () {
  if [[ $(unpushed) == "" ]]; then
    echo ""
  else
    echo "${color_orange}unpushed $reset_color"
  fi
}

prompt_setup() {
  local PROMPT_LEFT_A=$'$(host_name)$(directory_name)$(git_dirty)$(need_push)\n'
  local PROMPT_LEFT_B=$'$ '

  export PROMPT=$PROMPT_LEFT_A$PROMPT_LEFT_B
}

prompt_setup "$@"

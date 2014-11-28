#! /usr/bin/env zsh
# vim:ft=zsh ts=2 sw=2 sts=2
#
# A Powerline-inspired theme for ZSH
#
# # README
#
# In order for this theme to render correctly, you will need a
# [Powerline-patched font](https://github.com/Lokaltog/powerline-fonts).
#
# base on agnoster.theme, but only need once git cmd,
# and only update it when chdir or exec any git cmd.
# not using vcs_info, faster.
#
# Inspired by:
# agnoster
# zsh-git-prompt
#

### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

# set -x
CURRENT_BG='NONE'
IsFancy="yes"
if [[ "$IsFancy" = "yes" ]];then
  SEGMENT_SEPARATOR=''
  RETVAL_SYM="✘"
else
  SEGMENT_SEPARATOR="|"
  RETVAL_SYM="X"
fi

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n "$3" ]] && echo -n "$3"
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# exec GitStatus directly
function execGitStatus() {
  local gitstatus="$ZSH/themes/gitstatus.py"
  _GIT_STATUS=$(python2 "${gitstatus}" 2>/dev/null)
  echo "$_GIT_STATUS"
}
function getGitDir() {
  local dir=$(git rev-parse --show-toplevel 2>/dev/null)
  echo "$dir"
}
# exec GitStatus by server
function rpcGitStatus() {
  if [[ "$PWD" != /home/* ]]; then
    return
  fi
  local method="$1"
  local dir=$(getGitDir)
  if [[ "$dir" == "" ]]; then
    return
  fi
  cmd="$method $dir"
  ret=$(echo -n "$cmd" | nc 127.0.0.1 7211)
  echo "$ret"
}
function getGitStatus() {
  rpcGitStatus get
}
function upGitStatus() {
  rpcGitStatus up
}
function chpwd_update_git_vars() {
  # _GIT_STATUS=$(execGitStatus)
  _GIT_STATUS=$(getGitStatus)
  update_current_git_vars
}
function preexec_update_git_vars() {
  case "$2" in
    git*|hub*|gh*|stg*|patch*)
      __EXECUTED_GIT_COMMAND=1
      ;;
    rm*|touch*|mv*|cp*)
      __EXECUTED_GIT_COMMAND=1
      ;;
    vi*|emacs*)
      __EXECUTED_GIT_COMMAND=1
      ;;
  esac
}
# set default value
__EXECUTED_GIT_COMMAND=2
function precmd_update_git_vars() {
  if [ "$__EXECUTED_GIT_COMMAND" -eq 0 ]; then
    return
  fi
  if [ "$__EXECUTED_GIT_COMMAND" -eq 1 ]; then
    # _GIT_STATUS=$(execGitStatus)
    _GIT_STATUS=$(upGitStatus)
  else
    if [ "$__EXECUTED_GIT_COMMAND" -eq 2 ]; then
    _GIT_STATUS=$(getGitStatus)
    fi
  fi
  update_current_git_vars
  __EXECUTED_GIT_COMMAND=0
}

function update_current_git_vars() {
  unset __CURRENT_GIT_STATUS
  # _GIT_STATUS=$(execGitStatus)
  # __CURRENT_GIT_STATUS=("${(@f)_GIT_STATUS}")
  __CURRENT_GIT_STATUS=($(echo "${_GIT_STATUS}"))
  GIT_Message=$__CURRENT_GIT_STATUS[1]
  GIT_Status=$__CURRENT_GIT_STATUS[2]
}
autoload -U add-zsh-hook

add-zsh-hook chpwd chpwd_update_git_vars
add-zsh-hook preexec preexec_update_git_vars
add-zsh-hook precmd precmd_update_git_vars

prompt_fast_git() {
  if [[ -n "$__CURRENT_GIT_STATUS" ]]; then
    if [[ $GIT_Status -eq "3" ]]; then
      prompt_segment yellow black
    elif [[ $GIT_Status -eq "2" ]]; then
      prompt_segment 204 black
    else
      prompt_segment green black
    fi
    echo -n "$GIT_Message"
  fi
}

# Dir: current working directory
prompt_dir() {
  # prompt_segment blue black '%~'
  local cmd=$ZSH/themes/disambiguate-keeplast
  local dir=$(zsh "${cmd}")
  prompt_segment blue black "$dir"
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}""$RETVAL_SYM"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  [[ -n "$symbols" ]] && prompt_segment black default "$symbols"
}

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_dir
  prompt_fast_git
  prompt_status
  prompt_end
}

PROMPT='%{%f%b%k%}$(build_prompt) '

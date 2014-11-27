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

function chpwd_update_git_vars() {
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
__EXECUTED_GIT_COMMAND=1
function precmd_update_git_vars() {
  if [ "$__EXECUTED_GIT_COMMAND" -eq 1 ]; then
    update_current_git_vars
    __EXECUTED_GIT_COMMAND=0
  fi
}

function update_current_git_vars() {
  unset __CURRENT_GIT_STATUS
  local gitstatus="$ZSH/themes/gitstatus.py"
  _GIT_STATUS=$(python2 ${gitstatus} 2>/dev/null)
  __CURRENT_GIT_STATUS=("${(@f)_GIT_STATUS}")
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
  dir=$(zsh "${cmd}")
  prompt_segment blue black "$dir"
}

# Virtualenv: current working virtualenv
prompt_virtualenv() {
  local virtualenv_path="$VIRTUAL_ENV"
  if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
    prompt_segment blue black "(`basename $virtualenv_path`)"
  fi
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
  precmd_update_git_vars
  prompt_dir
  prompt_fast_git
  prompt_status
  prompt_end
}

PROMPT='%{%f%b%k%}$(build_prompt) '

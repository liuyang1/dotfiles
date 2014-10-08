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
SEGMENT_SEPARATOR=''

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
  [[ -n $3 ]] && echo -n $3
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
  case "$2"
    in git*|hub*|gh*|stg*)
      __EXECUTED_GIT_COMMAND=1
      ;;
  esac
}
function precmd_update_git_vars() {
  if [ -n "$__EXECUTED_GIT_COMMAND" ]; then
    update_current_git_vars
    unset __EXECUTED_GIT_COMMAND
  fi
}
function chpwd_update_git_vars() {
  update_current_git_vars
}

function update_current_git_vars() {
  unset __CURRENT_GIT_STATUS
  local gitstatus="$ZSH/themes/gitstatus.py"
  _GIT_STATUS=`python2 ${gitstatus} 2>/dev/null`
  __CURRENT_GIT_STATUS=("${(@f)_GIT_STATUS}")
  echo $gitstatus >> /tmp/t
  echo $_GIT_STATUS >> /tmp/t
  echo $__CURRENT_GIT_STATUS >> /tmp/t
  GIT_BRANCH=$__CURRENT_GIT_STATUS[1]
  GIT_Remote=$__CURRENT_GIT_STATUS[2]
  GIT_Untrack=$__CURRENT_GIT_STATUS[3]
  GIT_UModify=$__CURRENT_GIT_STATUS[4]
  GIT_UDelete=$__CURRENT_GIT_STATUS[5]
  GIT_Modify=$__CURRENT_GIT_STATUS[6]
  GIT_Add=$__CURRENT_GIT_STATUS[7]
  GIT_Delete=$__CURRENT_GIT_STATUS[8]
  GIT_Rename=$__CURRENT_GIT_STATUS[9]
  GIT_Copied=$__CURRENT_GIT_STATUS[10]
}
autoload -U add-zsh-hook

add-zsh-hook chpwd chpwd_update_git_vars
add-zsh-hook preexec preexec_update_git_vars
add-zsh-hook precmd precmd_update_git_vars

prompt_fast_git() {
  if [[ -n "$__CURRENT_GIT_STATUS" ]]; then
    STATUS=" $GIT_BRANCH"
    if [[ "${GIT_Remote}" != "origin/master" ]]; then
      # STATUS="$STATUS<'$GIT_Remote"
      STATUS="$STATUS☁'$GIT_Remote"
    fi
    if [[ "$GIT_Modify" -ne "0" ]]; then
      # STAGE_STATUS="$STAGE_STATUS%{$fg[black]%}~$GIT_Modify"
      STAGE_STATUS="$STAGE_STATUS%{$fg[black]%}±$GIT_Modify"
      _STAGE=1
    fi
    if [[ "$GIT_Add" -ne "0" ]]; then
      STAGE_STATUS="$STAGE_STATUS%{$fg[black]%}+$GIT_Add"
      _STAGE=1
    fi
    if [[ "$GIT_Delete" -ne "0" ]]; then
      # STAGE_STATUS="$STAGE_STATUS%{$fg[black]%}-$GIT_Delete"
      STAGE_STATUS="$STAGE_STATUS%{$fg[black]%}✖%$GIT_Delete"
      _STAGE=1
    fi
    if [[ "$GIT_UModify" -ne "0" ]]; then
      # DIRTY_STATUS="$DIRTY_STATUS%{$fg_bold[gray]%}~$GIT_UModify"
      DIRTY_STATUS="$DIRTY_STATUS%{$fg_bold[gray]%}±$GIT_UModify"
      _DIRTY=2
    fi
    if [[ "$GIT_UDelete" -ne "0" ]]; then
      DIRTY_STATUS="$DIRTY_STATUS%{$fg_bold[gray]%}✖%$GIT_UDelete"
      _DIRTY=2
    fi
    if [[ $GIT_Untrack -ne "0" ]]; then
      DIRTY_STATUS="$DIRTY_STATUS%{$fg_bold[gray]%}?$GIT_Untrack"
      _DIRTY=2
    fi
    if [[ -n "$_DIRTY" ]]; then
      prompt_segment yellow black
    elif [[ -n "$_STAGE" ]]; then
      prompt_segment magenta black
    else
      prompt_segment green black
    fi
    if [[ -n "$_DIRTY" || -n "$_STAGE" ]]; then
      STATUS="$STATUS $STAGE_STATUS ● $DIRTY_STATUS"
    fi
    echo -n $STATUS
  fi
}

# Dir: current working directory
prompt_dir() {
  prompt_segment blue black '%~'
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
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
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

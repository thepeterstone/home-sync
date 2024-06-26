# ---------
# terst theme for ZSH
#
# Features:
#   - pwd with combined svn/git status display
#   - user info: name, is_root, ssh connection
#   - exit status indicator
# ---------
#
#
#
#

function my_git_prompt() {
  tester=$(git rev-parse --git-dir 2> /dev/null) || return
  INDEX=$(git status --porcelain 2> /dev/null)
  STATUS=""

  # is branch ahead?
  if $(echo "$(git log origin/$(current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi

  # is anything staged?
  if $(echo "$INDEX" | grep -E -e '^(D[ M]|[MARC][ MD]) ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
  fi

  # is anything unstaged?
  if $(echo "$INDEX" | grep -E -e '^[ MARC][MD] ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
  fi

  # is anything untracked?
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
  fi

  # is anything unmerged?
  if $(echo "$INDEX" | grep -E -e '^(A[AU]|D[DU]|U[ADU]) ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
  fi

  if [[ -n $STATUS ]]; then
    STATUS=" $STATUS"
  fi

  echo "ᚴ $(my_current_branch)$STATUS"
}

function my_repo_status() {
  STATUS="$(my_git_prompt)"
  if [[ -n $STATUS ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

function my_current_branch() {
  echo $(current_branch || echo "(no branch)")
}

function shell_mode() {
  if [[ -n $SHELL_MODE ]]; then
    echo "%{$fg[blue]%}[$SHELL_MODE]%{$reset_color%} "
  fi
}

function my_hostname() {
  local local_info="%(!.%{$fg[red]%}%n@%m %{$reset_color%}.)"
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%{$fg[yellow]%}ssh:%(!.%{$local_info%}.%{$fg[white]%}%m %{$reset_color%})"
    else
    echo "%{$local_info%}"
  fi
}

function shell_mode() {
  if [[ -n $SHELL_MODE ]]; then
    echo " [%{$fg[blue]%}$SHELL_MODE%{$reset_color%}]"
  fi
}

function my_modal_shell() {
  if [[ -n $SHELL_MODE ]]; then
    echo " %{$fg_bold[blue]%}[$SHELL_MODE]%{$reset_color%}"
  fi
}

function shell_mode() {
  if [[ -n $SHELL_MODE ]]; then
    echo " [%{$fg[blue]%}$SHELL_MODE%{$reset_color%}]"
  fi
}

local hostname="%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m%{$reset_color%}"
local return_code="%{$reset_color%}%(?.%{$fg[green]%}✔.%{$fg_bold[red]%}✗)%{$reset_color%}"
local hash="%(!.%{$fg[red]%}.)%#%{$reset_color%}"

#PROMPT=$'\n%{$return_code%}[%T]$(ssh_connection) $(my_repo_status) %~\n%{$(iterm2_prompt_mark)%}$(shell_mode) %{$hash%} '
#PROMPT=$'%{$return_code%} %T $(my_hostname)%~$(my_repo_status)\n$(shell_mode)%{$hash%} '
#PROMPT=$'[%T]$(ssh_connection) %{$hostname%}$(my_repo_status) : %~\n%{$return_code%}$(my_modal_shell) %{$hash%} '
#PROMPT=$'[%T] %{$hostname%}$(my_repo_status) : %~\n%{$return_code%}$(my_modal_shell) %{$hash%} '
PROMPT=$'\n%{$SOLAR_GRAY_BG$SOLAR_ORANGE%} [%T] %{$hostname%} %{$bg[blue]$SOLAR_GRAY%}▶%{$SOLAR_WHITE%} %~ %{$RESET$SOLAR_YELLOW%} $(my_repo_status) \n%{$RESET%}%{$return_code%}$(my_modal_shell) %{$hash%} '

ZSH_THEME_PROMPT_RETURNCODE_PREFIX="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_PREFIX="$fg_bold[white]‹%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$fg_bold[white]›%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[magenta]%}↑"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}✹"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}➜"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[red]%}✕"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}●"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[white]%}●"


ZSH_THEME_SVN_PROMPT_DIRTY="%{$fg[green]%} ●"
ZSH_THEME_SVN_PROMPT_UPDATES="%{$fg[red]%} ●"

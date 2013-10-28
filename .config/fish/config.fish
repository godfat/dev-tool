
function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _git_status_symbol
  set -l git_status (git status --porcelain ^/dev/null)
  if test -n "$git_status"
    # Is there anyway to preserve newlines so we can reuse $git_status?
    if git status --porcelain ^/dev/null | grep '^.[^ ]' >/dev/null
      echo '*' # dirty
    else
      echo '#' # all staged
    end
  else
    echo    '' # clean
  end
end

function _remote_hostname
  if test -n "$SSH_CONNECTION"
    echo (whoami)@(hostname)
  end
end

function fish_prompt
  set -l cyan (set_color cyan)
  set -l normal (set_color normal)

  set -l time (set_color normal)
  set -l remote (set_color normal)

  if echo $TERM | grep 256 >/dev/null
    set time (set_color 888)
    set remote (set_color 050)
  end

  set -l cwd (set_color $fish_color_cwd)(prompt_pwd)
  set -l git_status
  set -l git_branch (_git_branch_name)
  set -l git_hide_branch (git config --get prompt.hide ^/dev/null)

  if test -n "$git_branch"
    if test -n "$git_hide_branch"
      set git_status (_git_status_symbol)
    else
      set git_status ' '(_git_status_symbol)(_git_branch_name)
    end
  else
    set git_status ''
  end

  echo -n $time(date '+%H:%M') $remote(_remote_hostname) \
          $cwd$cyan$git_status$normal'> '
end

set -x CDPATH .

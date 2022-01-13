
function _git_branch_name
  echo (git rev-parse --abbrev-ref HEAD 2> /dev/null)
end

function _git_status_symbol
  begin
    set -l IFS # preserve newlines, locally to this scope
    set git_status (echo $argv | tail -n +2) # function scope
  end

  if test -n "$git_status"
    if echo "$git_status" | grep '^.[^ ]' > /dev/null
      echo '*' # dirty
    else
      echo '#' # all staged
    end
  else
    echo    '' # clean
  end
end

function _git_branch_symbol
  set -l branch_status (echo $argv | head -1)
  set -l diverged (echo $branch_status | grep -o ',')

  if test -n "$diverged"
    echo '!'
  else
    set -l branch (echo $branch_status | grep -E -o '\[[a-z]+' | sed 's/\[//')
    set -l number (echo $branch_status | grep -E -o '[0-9]+\]$' | sed 's/\]//')

    switch "$branch"
    case 'behind'
      echo '<'$number
    case 'ahead'
      echo '>'$number
    case '*'
      echo ''
    end
  end
end

function _remote_hostname
  if test -n "$SSH_CONNECTION"
    echo (whoami)@(hostname)
  end
end

function fish_title
  echo $_ (_remote_hostname)
end

function fish_prompt
  set -l cyan (set_color cyan)
  set -l normal (set_color normal)

  set -l time (set_color normal)
  set -l remote (set_color normal)

  if echo $TERM | grep 256 > /dev/null
    set time (set_color 888)
    set remote (set_color 050)
  end

  set -l pwd (prompt_pwd)
  set -l cwd (set_color $fish_color_cwd)$pwd
  set -l git_branch (_git_branch_name)
  set -l git_hide_branch (git config --get prompt.hide 2> /dev/null)
  set -l git_status
  set -l git_prompt

  if test -n "$git_branch"
    begin
      set -l IFS # preserve newlines, locally to this scope
      set git_status (git status --porcelain --short --branch 2> /dev/null)
    end

    set -l git_status_symbol (_git_status_symbol $git_status)
    set -l git_branch_symbol (_git_branch_symbol $git_status)

    if test -n "$git_hide_branch"
      set git_prompt $git_status_symbol$git_branch_symbol
    else
      set git_prompt ' '$git_status_symbol$git_branch$git_branch_symbol
    end
  else
    set git_prompt ''
  end

  echo -n $time(date '+%H:%M') $remote(_remote_hostname) \
          $cwd$cyan$git_prompt$normal'> '
end

set -x CDPATH .
set -x PATH $USER_PATH $PATH


function fish_prompt -d 'custom prompt'
  echo \x1b'[38;5;102m'(date '+%H:%M')' '(set_color normal)(prompt-where)(set_color green)(prompt-cwd)(set_color cyan)(prompt-git)(set_color normal)'> '
end


function fish_prompt -d 'custom prompt'
  set -x TERM xterm-256color
  prompt.rb
end

set -x PROMPT_SHELL fish

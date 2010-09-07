
# common setting
export PATH=\
~/bin:\
~/.gem/ruby/1.9.1/bin:\
~/.gem/ruby/1.8/bin:\
/usr/local/bin:\
/usr/local/sbin:\
$PATH

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=vim
export DISPLAY=localhost:0.0
export TERM=xterm-color

# start fishing...
if test $(which fish 2> /dev/null); then
  fish
fi

source ~/.bashrc

if test -f `brew --prefix`/Library/Contributions/brew_bash_completion.sh; then
  source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
fi

if test -e ~/.rvm/scripts/rvm; then
  source ~/.rvm/scripts/rvm
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

export PS1=' '
export PROMPT_COMMAND=prompt.rb # change this to prompt-full if you have
                                # xterm-color256

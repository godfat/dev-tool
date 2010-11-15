
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

export PS1='`echo -e "\x1b["`37m`date "+%H:%M"``echo -e "\x1b[m"` `prompt-where``echo -e "\x1b["`32m`prompt-cwd``echo -e "\x1b["`36m`prompt-git``echo -e "\x1b[m"`$ '

# until bash fix this terminal problem, we can only rely on PS1...
# export PS1=' '
# export PROMPT_COMMAND=prompt.rb # change this to prompt-full if you have
                                  # xterm-color256

# probably should be inside .bashrc?
# linux bash specific
if   test $(uname) = 'Linux'; then
  alias ls='ls --color'
  alias ll='ls -l'
  alias la='ll -a'
# mac bash specific
elif test $(uname) = 'Darwin'; then
  alias ls='ls -Gw'
  alias ll='ls -lhw'
  alias la='ll -a'
fi

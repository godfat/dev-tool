
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

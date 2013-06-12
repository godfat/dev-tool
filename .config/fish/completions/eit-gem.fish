
set __fish_eit_gem_path (brew --prefix ruby)/lib/ruby/1.9.1

function __fish_eit_gem_sed
  sed s/(echo $__fish_eit_gem_path | sed 's/\//\\\\\//g')\\///
end

complete -f -c eit-gem -a '(gem list | sed -E "s/ \(.+\)//")' -d 'Gem'
complete -f -c eit-gem -a "(find $__fish_eit_gem_path -name '*.rb' 2> /dev/null | __fish_eit_gem_sed)" -d 'File'

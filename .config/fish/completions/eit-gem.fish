
set __fish_eit_gem_path (ruby -e 'puts RbConfig::CONFIG["rubylibdir"]')

function __fish_eit_gem_sed
  sed s/(echo $__fish_eit_gem_path | sed 's/\//\\\\\//g')\\///
end

complete -f -c eit-gem -a '(gem list | sed -E "s/ \(.+\)//")' -d 'Gem'
complete -f -c eit-gem -a "(find $__fish_eit_gem_path -name '*.rb' 2> /dev/null | __fish_eit_gem_sed)" -d 'File'

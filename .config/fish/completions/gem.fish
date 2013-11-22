
. $fish_complete_path[3]/gem.fish

set __fish_eit_gem_path (ruby -e 'puts RbConfig::CONFIG["rubylibdir"]')

function __fish_eit_gem_sed
  sed s/(echo $__fish_eit_gem_path | sed 's/\//\\\\\//g')\\///
end

complete -f -c gem -n '__fish_use_subcommand' -xa 'eit\t"'(_ "Edit a gem")'"'

complete -f -c gem -n 'contains eit (commandline -poc)' \
         -a '(gem list | sed -E "s/ \(.+\)//")' -d 'Gem'

complete -f -c gem -n 'contains eit (commandline -poc)' \
         -a "(find $__fish_eit_gem_path -name '*.rb' 2> /dev/null | __fish_eit_gem_sed)" -d 'File'

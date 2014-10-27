
. $fish_complete_path[3]/gem.fish

set __fish_eit_gem_path (ruby -e 'puts RbConfig::CONFIG["rubylibdir"]')

function __fish_eit_gem_sed
  sed s/(echo $__fish_eit_gem_path | sed 's/\//\\\\\//g')\\/// | \
  sed 's/\..*$//'
end

complete -f -c gem -n '__fish_use_subcommand' -xa 'eit\t"'(_ "Edit a gem")'"'
complete -f -c gem -n '__fish_use_subcommand' -xa 'grep\t"'(_ "Grep a gem")'"'
complete -f -c gem -n '__fish_use_subcommand' -xa 'beit\t"'(_ "Edit a gem")'"'

set -l  gem_list -a '(gem list | sed -E "s/ \(.+\)//")' -d 'Gem'
set -l file_list -a "(find $__fish_eit_gem_path -name '*.rb' 2> /dev/null \
                  | __fish_eit_gem_sed)" -d 'File'
set -l bundle_gem_list -a '(bundle list | tail -n+2 | awk \'{print $2}\')' -d 'Gem'

complete -f -c gem -n 'contains eit (commandline -poc)' $gem_list
complete -f -c gem -n 'contains eit (commandline -poc)' $file_list

complete -f -c gem -n 'contains grep (commandline -poc)' $gem_list
complete -f -c gem -n 'contains grep (commandline -poc)' $file_list

complete -f -c gem -n 'contains beit (commandline -poc)' $bundle_gem_list

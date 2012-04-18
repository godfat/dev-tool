
. $fish_complete_path[3]/git.fish

complete -f -c git -n '__fish_git_needs_command' -a co -d 'Checkout and switch to a branch'
complete -c git -n '__fish_git_using_command co' -a '(__fish_git_branches)' --description 'Branch'
complete -c git -n '__fish_git_using_command co' -a '(__fish_git_tags)' --description 'Tag'
complete -c git -n '__fish_git_using_command co' -s b -d 'Create a new branch'

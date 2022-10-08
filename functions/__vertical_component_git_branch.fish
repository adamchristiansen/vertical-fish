function __vertical_component_git_branch
  __vertical_util_set vertical_git_branch_color        magenta --bold
  __vertical_util_set vertical_git_branch_prefix       ' '
  __vertical_util_set vertical_git_branch_prefix_color magenta --bold

  if not __vertical_util_is_git
    return
  end

  set -l branch (command git symbolic-ref --short HEAD 2> /dev/null)
  set_color $vertical_git_branch_prefix_color
  echo -ens $vertical_git_branch_prefix
  set_color $vertical_git_branch_color
  echo -ens $branch
  set_color normal
end

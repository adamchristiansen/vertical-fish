function __vertical_component_git_branch
  __vertical_util_set VERTICAL_GIT_BRANCH_COLOR  magenta --bold
  __vertical_util_set VERTICAL_GIT_BRANCH_PREFIX " "
  __vertical_util_set VERTICAL_GIT_SHOW          true

  if not __vertical_util_is_git
    return
  end

  if [ $VERTICAL_GIT_SHOW != true ]
    return
  end

  set -l branch (command git symbolic-ref --short HEAD 2> /dev/null)
  set_color $VERTICAL_GIT_BRANCH_COLOR
  echo -ens $VERTICAL_GIT_BRANCH_PREFIX$branch
  set_color $VERTICAL_COLOR_NORMAL
end

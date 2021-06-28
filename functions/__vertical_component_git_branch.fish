function __vertical_component_git_branch -d "Print the git branch"
    # Options
    __vertical_util_set VERTICAL_GIT_BRANCH_COLOR  magenta --bold
    __vertical_util_set VERTICAL_GIT_BRANCH_PREFIX " "
    __vertical_util_set VERTICAL_GIT_SHOW          true

    not __vertical_util_is_git; and return
    [ $VERTICAL_GIT_SHOW != true ]; and return

    set -l branch (command git rev-parse --abbrev-ref HEAD 2> /dev/null)
    set_color $VERTICAL_GIT_BRANCH_COLOR
    echo -ens $VERTICAL_GIT_BRANCH_PREFIX$branch
    set_color $VERTICAL_COLOR_NORMAL
end

function __vertical_component_dir -d "Print the directory"
    # Options
    __vertical_util_set_default VERTICAL_DIR_COLOR      blue --bold
    __vertical_util_set_default VERTICAL_DIR_PREFIX     " "
    __vertical_util_set_default VERTICAL_DIR_TRUNC_GIT  true
    __vertical_util_set_default VERTICAL_DIR_TRUNC_HOME true

    set -l dir
    if [ $VERTICAL_DIR_TRUNC_GIT = true ]; and __vertical_util_is_git_dir
        # Find the current directory with all symlinks resolved
        set dir (pwd -P ^ /dev/null; or pwd)
        # Find the path to the root of the git repository. The idea behind the
        # string replace is to replace the first part of the path (up to the
        # git root directory) with just the basename of the root directory.
        set -l root (command git rev-parse --show-toplevel ^ /dev/null)
        set dir (string replace $root (basename $root) $dir)
    else if [ $VERTICAL_DIR_TRUNC_HOME = true ]
        # Replace $HOME with ~
        set -l realhome ~
        set dir (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)
    else
        set dir $PWD
    end

    set_color $VERTICAL_DIR_COLOR
    echo -ens $VERTICAL_DIR_PREFIX $dir
    set_color $VERTICAL_NORMAL_COLOR
end

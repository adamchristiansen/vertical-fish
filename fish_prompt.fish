function fish_prompt
    # Get the exit code of the previous command
    set -lx __vertical_exit_code $status

    # General options
    __vertical_util_set_default VERTICAL_NORMAL_COLOR normal
    __vertical_util_set_default VERTICAL_NEWLINE      true

    set_color $VERTICAL_NORMAL_COLOR

    if [ $VERTICAL_NEWLINE = true ]
        echo
    end

    # Build the prompt
    __vertical_component_vert
    __vertical_component_dir
    __vertical_component_git_branch
    __vertical_component_git_status
    __vertical_component_duration
    echo
    __vertical_component_vert
    __vertical_component_prompt
    __vertical_component_vi_mode
end

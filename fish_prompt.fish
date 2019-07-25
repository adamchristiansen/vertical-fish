function fish_prompt
    # Get the exit code of the previous command
    set -lx __vertical_exit_code $status

    # General options
    __vertical_util_set VERTICAL_COLOR_NORMAL normal
    __vertical_util_set VERTICAL_NEWLINE      true

    set_color $VERTICAL_COLOR_NORMAL

    if [ $VERTICAL_NEWLINE = true ]
        echo
    end

    # Build the prompt
    __vertical_component_vert
    __vertical_component_jobs
    __vertical_component_dir
    __vertical_component_git_branch
    __vertical_component_git_status
    __vertical_component_duration
    echo
    __vertical_component_vert
    __vertical_component_prompt
    __vertical_component_vi_mode
end

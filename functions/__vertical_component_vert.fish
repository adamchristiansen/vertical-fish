function __vertical_component_vert -d "Print the vertical bar"
    # Options
    __vertical_util_set VERTICAL_VERT_PREFIX        "│"
    __vertical_util_set VERTICAL_VERT_COLOR_SUCCESS green
    __vertical_util_set VERTICAL_VERT_COLOR_FAILURE red

    if [ $__vertical_exit_code -eq 0 ]
        set_color $VERTICAL_VERT_COLOR_SUCCESS
    else
        set_color $VERTICAL_VERT_COLOR_FAILURE
    end
    echo -ens $VERTICAL_VERT_PREFIX
    set_color $VERTICAL_COLOR_NORMAL
end

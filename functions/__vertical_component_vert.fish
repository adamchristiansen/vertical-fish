function __vertical_component_vert -d "Print the vertical bar"
    # Options
    __vertical_util_set_default VERTICAL_VERT_PREFIX     "│"
    __vertical_util_set_default VERTICAL_VERT_COLOR_GOOD green
    __vertical_util_set_default VERTICAL_VERT_COLOR_BAD  red

    if [ $__vertical_exit_code -eq 0 ]
        set_color $VERTICAL_VERT_COLOR_GOOD
    else
        set_color $VERTICAL_VERT_COLOR_BAD
    end
    echo -ens $VERTICAL_VERT_PREFIX
    set_color $VERTICAL_NORMAL_COLOR
end

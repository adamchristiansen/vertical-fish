function __vertical_component_duration -d "Print the duration of the previous command"
    # Options
    __vertical_util_set_default VERTICAL_DURATION_COLOR  yellow --bold
    __vertical_util_set_default VERTICAL_DURATION_MIN    5000
    __vertical_util_set_default VERTICAL_DURATION_PREFIX " "
    __vertical_util_set_default VERTICAL_DURATION_SHOW   true

    [ $VERTICAL_DURATION_SHOW != true ]; and return
    [ $CMD_DURATION -lt $VERTICAL_DURATION_MIN ]; and return

    echo -ens $VERTICAL_DURATION_PREFIX
    set_color $VERTICAL_DURATION_COLOR
    echo -ens (echo $CMD_DURATION | humanize_duration)
    set_color $VERTICAL_NORMAL_COLOR
end

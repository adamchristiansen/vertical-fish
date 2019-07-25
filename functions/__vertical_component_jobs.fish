function __vertical_component_jobs -d "Print the jobs indicator"
    # Options
    __vertical_util_set VERTICAL_JOBS_COLOR  cyan --bold
    __vertical_util_set VERTICAL_JOBS_PREFIX " "
    __vertical_util_set VERTICAL_JOBS_SHOW   true
    __vertical_util_set VERTICAL_JOBS_SYM    "●"

    [ $VERTICAL_JOBS_SHOW != true ]; and return

    set -l count (jobs | wc -l)
    [ $count -eq 0 ]; and return

    set_color $VERTICAL_JOBS_COLOR
    echo -ens $VERTICAL_JOBS_PREFIX $VERTICAL_JOBS_SYM
    set_color $VERTICAL_COLOR_NORMAL
end

function __vertical_component_jobs
  __vertical_util_set VERTICAL_JOBS_COLOR  cyan --bold
  __vertical_util_set VERTICAL_JOBS_PREFIX " "
  __vertical_util_set VERTICAL_JOBS_SHOW   true
  __vertical_util_set VERTICAL_JOBS_SYM    "●"

  if [ $VERTICAL_JOBS_SHOW != true ]
    return
  end

  if [ (jobs | count) -eq 0 ]
    return
  end

  set_color $VERTICAL_JOBS_COLOR
  echo -ens $VERTICAL_JOBS_PREFIX $VERTICAL_JOBS_SYM
  set_color $VERTICAL_COLOR_NORMAL
end

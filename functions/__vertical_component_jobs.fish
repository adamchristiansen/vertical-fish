function __vertical_component_jobs
  __vertical_util_set vertical_jobs_color        cyan --bold
  __vertical_util_set vertical_jobs_prefix       ' '
  __vertical_util_set vertical_jobs_prefix_color cyan --bold
  __vertical_util_set vertical_jobs_sym          ●

  if [ (jobs | count) -eq 0 ]
    return
  end

  set_color $vertical_jobs_prefix_color
  echo -ens $vertical_jobs_prefix
  set_color $vertical_jobs_color
  echo -ens $vertical_jobs_sym
  set_color normal
end

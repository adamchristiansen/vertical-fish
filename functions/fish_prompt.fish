function fish_prompt
  set -lx __vertical_exit_code $status

  __vertical_util_set VERTICAL_COLOR_NORMAL normal
  __vertical_util_set VERTICAL_NEWLINE      true

  set_color $VERTICAL_COLOR_NORMAL

  if [ $VERTICAL_NEWLINE = true ]
    echo
  end

  __vertical_component_vert
  __vertical_component_jobs
  __vertical_component_ssh
  __vertical_component_dir
  __vertical_component_git_branch
  __vertical_component_git_status
  __vertical_component_duration
  __vertical_component_vi_mode
  echo
  __vertical_component_vert
  __vertical_component_prompt
end

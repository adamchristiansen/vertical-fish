function fish_prompt
  set -lx __vertical_exit_code $status

  __vertical_util_set vertical_newline true
  __vertical_util_set vertical_order   jobs user host dir git_branch \
                                       git_status duration vi_mode

  if [ $vertical_newline = true ]
    echo
  end

  __vertical_component_vert top
  for component in $vertical_order
    eval __vertical_component_$component
  end
  echo
  __vertical_component_vert bottom
  __vertical_component_cue

  set_color normal
end

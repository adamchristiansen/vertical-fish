function __vertical_component_vert
  __vertical_util_set vertical_vert_prefix        '│'
  __vertical_util_set vertical_vert_color_success green
  __vertical_util_set vertical_vert_color_failure red

  if [ $__vertical_exit_code -eq 0 ]
    set_color $vertical_vert_color_success
  else
    set_color $vertical_vert_color_failure
  end
  echo -ens $vertical_vert_prefix
  set_color $vertical_color_normal
end

function __vertical_component_vert -a position
  __vertical_util_set vertical_vert_color_failure red --bold
  __vertical_util_set vertical_vert_color_success green --bold
  __vertical_util_set vertical_vert_bottom        │
  __vertical_util_set vertical_vert_top           │

  if [ $__vertical_exit_code -eq 0 ]
    set_color $vertical_vert_color_success
  else
    set_color $vertical_vert_color_failure
  end

  switch $position
  case bottom
    echo -ens $vertical_vert_bottom
  case top '*'
    echo -ens $vertical_vert_top
  end
  set_color $vertical_color_normal
end

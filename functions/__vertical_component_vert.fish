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

  eval "echo -ens \$vertical_vert_$position"
  set_color normal
end

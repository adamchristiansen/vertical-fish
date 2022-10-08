function __vertical_component_ssh
  __vertical_util_set vertical_ssh_color        cyan --bold
  __vertical_util_set vertical_ssh_prefix       ' '
  __vertical_util_set vertical_ssh_prefix_color cyan --bold
  __vertical_util_set vertical_ssh_sym          ▼

  if not __vertical_util_is_ssh
    return
  end

  set_color $vertical_ssh_prefix_color
  echo -ens $vertical_ssh_prefix
  set_color $vertical_ssh_color
  echo -ens $vertical_ssh_sym
  set_color $vertical_color_normal
end

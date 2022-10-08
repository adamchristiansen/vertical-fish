function __vertical_component_user
  __vertical_util_set vertical_user_color        yellow --bold
  __vertical_util_set vertical_user_prefix       ' '
  __vertical_util_set vertical_user_prefix_color yellow --bold
  __vertical_util_set vertical_user_ssh_only     true

  if not __vertical_util_is_ssh && [ $vertical_user_ssh_only = true ]
    return
  end

  set_color $vertical_user_prefix_color
  echo -ens $vertical_user_prefix
  set_color $vertical_user_color
  echo -ens $USER
  set_color normal
end

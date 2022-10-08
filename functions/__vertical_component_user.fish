function __vertical_component_user
  __vertical_util_set vertical_user_color  yellow --bold
  __vertical_util_set vertical_user_prefix ' '
  __vertical_util_set vertical_user_show   'ssh'

  if __vertical_util_is_ssh
    switch $vertical_host_show
    case 'true' 'ssh'
      # Do nothing
    case 'false' '*'
      return
    end
  else
    switch $vertical_host_show
    case 'true'
      # Do nothing
    case 'false' 'ssh' '*'
      return
    end
  end

  set_color $vertical_user_color
  echo -ens $vertical_user_prefix $USER
  set_color $vertical_color_normal
end

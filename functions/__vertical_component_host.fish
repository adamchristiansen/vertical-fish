function __vertical_component_host
  __vertical_util_set vertical_host_color  yellow --bold
  __vertical_util_set vertical_host_prefix '@'
  __vertical_util_set vertical_host_show   'ssh'

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

  set_color $vertical_host_color
  echo -ens $vertical_host_prefix (hostname)
  set_color $vertical_color_normal
end

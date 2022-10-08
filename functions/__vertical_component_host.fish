function __vertical_component_host
  __vertical_util_set VERTICAL_HOST_COLOR  yellow --bold
  __vertical_util_set VERTICAL_HOST_PREFIX '@'
  __vertical_util_set VERTICAL_HOST_SHOW   'ssh'

  if __vertical_util_is_ssh
    switch $VERTICAL_HOST_SHOW
    case 'true' 'ssh'
      # Do nothing
    case 'false' '*'
      return
    end
  else
    switch $VERTICAL_HOST_SHOW
    case 'true'
      # Do nothing
    case 'false' 'ssh' '*'
      return
    end
  end

  set_color $VERTICAL_HOST_COLOR
  echo -ens $VERTICAL_HOST_PREFIX (hostname)
  set_color $VERTICAL_COLOR_NORMAL
end

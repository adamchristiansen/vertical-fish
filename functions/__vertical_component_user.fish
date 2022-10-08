function __vertical_component_user
  __vertical_util_set VERTICAL_USER_COLOR  yellow --bold
  __vertical_util_set VERTICAL_USER_PREFIX ' '
  __vertical_util_set VERTICAL_USER_SHOW   'ssh'

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

  set_color $VERTICAL_USER_COLOR
  echo -ens $VERTICAL_USER_PREFIX $USER
  set_color $VERTICAL_COLOR_NORMAL
end

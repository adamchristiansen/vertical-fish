function __vertical_component_vi_mode
  __vertical_util_set VERTICAL_VI_MODE_COLOR           yellow --bold
  __vertical_util_set VERTICAL_VI_MODE_SHOW            true
  __vertical_util_set VERTICAL_VI_MODE_SYM_INSERT      ''
  __vertical_util_set VERTICAL_VI_MODE_SYM_NORMAL      ' [N]'
  __vertical_util_set VERTICAL_VI_MODE_SYM_REPLACE_ONE ' [R]'
  __vertical_util_set VERTICAL_VI_MODE_SYM_VISUAL      ' [V]'

  if [ $VERTICAL_VI_MODE_SHOW != true ]
    return
  end

  if [ "$fish_key_bindings" != 'fish_vi_key_bindings' \
      -a "$fish_key_bindings" != 'fish_hybrid_key_bindings' ]
    return
  end

  set_color $VERTICAL_VI_MODE_COLOR
  switch $fish_bind_mode
    case insert;      echo -ens $VERTICAL_VI_MODE_SYM_INSERT
    case default;     echo -ens $VERTICAL_VI_MODE_SYM_NORMAL
    case replace_one; echo -ens $VERTICAL_VI_MODE_SYM_REPLACE_ONE
    case visual;      echo -ens $VERTICAL_VI_MODE_SYM_VISUAL
  end
  set_color $VERTICAL_COLOR_NORMAL
end

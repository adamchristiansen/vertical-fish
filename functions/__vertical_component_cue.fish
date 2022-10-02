function __vertical_component_cue
  __vertical_util_set VERTICAL_VERT_CUE       ' '
  __vertical_util_set VERTICAL_VERT_CUE_COLOR normal

  set_color $VERTICAL_VERT_CUE_COLOR
  echo -ens $VERTICAL_VERT_CUE
  set_color $VERTICAL_COLOR_NORMAL
end

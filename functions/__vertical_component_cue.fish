function __vertical_component_cue
  __vertical_util_set vertical_cue       ' '
  __vertical_util_set vertical_cue_color normal

  set_color $vertical_cue_color
  echo -ens $vertical_cue
  set_color normal
end

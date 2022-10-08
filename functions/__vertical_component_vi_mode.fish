function __vertical_component_vi_mode
  __vertical_util_set vertical_vi_mode_color           yellow --bold
  __vertical_util_set vertical_vi_mode_prefix          ''
  __vertical_util_set vertical_vi_mode_prefix_color    yellow --bold
  __vertical_util_set vertical_vi_mode_sym_insert      ''
  __vertical_util_set vertical_vi_mode_sym_normal      ' (N)'
  __vertical_util_set vertical_vi_mode_sym_replace_one ' (R)'
  __vertical_util_set vertical_vi_mode_sym_visual      ' (V)'

  if [ "$fish_key_bindings" != 'fish_vi_key_bindings' \
      -a "$fish_key_bindings" != 'fish_hybrid_key_bindings' ]
    return
  end

  set_color $vertical_vi_mode_prefix_color
  echo -ens $vertical_vi_mode_prefix
  set_color $vertical_vi_mode_color
  switch $fish_bind_mode
    case insert;      echo -ens $vertical_vi_mode_sym_insert
    case default;     echo -ens $vertical_vi_mode_sym_normal
    case replace_one; echo -ens $vertical_vi_mode_sym_replace_one
    case visual;      echo -ens $vertical_vi_mode_sym_visual
  end
  set_color normal
end

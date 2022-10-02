function __vertical_component_prompt
  __vertical_util_set VERTICAL_VERT_PROMPT       " "
  __vertical_util_set VERTICAL_VERT_PROMPT_COLOR yellow

  set_color $VERTICAL_VERT_PROMPT_COLOR
  echo -ens $VERTICAL_VERT_PROMPT
  set_color $VERTICAL_COLOR_NORMAL
end

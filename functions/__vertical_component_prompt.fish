function __vertical_component_prompt -d "Print the prompt"
    # Options
    __vertical_util_set_default VERTICAL_VERT_PROMPT       " "
    __vertical_util_set_default VERTICAL_VERT_PROMPT_COLOR yellow

    set_color $VERTICAL_VERT_PROMPT_COLOR
    echo -ens $VERTICAL_VERT_PROMPT
    set_color $VERTICAL_NORMAL_COLOR
end

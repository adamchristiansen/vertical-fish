function __vertical_component_ssh -d "Print the SSH indicator"
    # Options
    __vertical_util_set VERTICAL_SSH_COLOR  cyan --bold
    __vertical_util_set VERTICAL_SSH_PREFIX " "
    __vertical_util_set VERTICAL_SSH_SHOW   true
    __vertical_util_set VERTICAL_SSH_SYM    "▼"

    [ $VERTICAL_SSH_SHOW != true ]; and return

    if not set -q SSH_CLIENT && not set -q SSH_CONNECTION && not set -q SSH_TTY
        return
    end

    set_color $VERTICAL_SSH_COLOR
    echo -ens $VERTICAL_SSH_PREFIX $VERTICAL_SSH_SYM
    set_color $VERTICAL_COLOR_NORMAL
end

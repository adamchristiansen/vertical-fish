function __vertical_util_set_default -d "Sets a default variable value"
    set -l var $argv[1]
    if not set -q $var
        set -g $var $argv[2..-1]
    end
end

function __vertical_util_set
  set -l var $argv[1]
  if not set -q $var
    set -U $var $argv[2..-1]
  end
end

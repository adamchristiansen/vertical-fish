function __vertical_util_is_ssh
  set -q SSH_CLIENT || set -q SSH_CONNECTION || set -q SSH_TTY
end

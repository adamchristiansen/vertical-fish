function __vertical_util_is_git -d "Test if a git repository"
    not type -q git; and return 1
    command git rev-parse --git-dir > /dev/null 2> /dev/null
end

function __vertical_util_is_git -d "Test if a git repository"
  if not type -q git
    return 1
  end
  command git rev-parse --git-dir > /dev/null 2> /dev/null
end

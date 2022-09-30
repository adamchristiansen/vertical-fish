function __vertical_component_git_status -d "Print the git status"
  __vertical_util_set VERTICAL_GIT_STATUS_COLOR         cyan --bold
  __vertical_util_set VERTICAL_GIT_STATUS_PREFIX        " ["
  __vertical_util_set VERTICAL_GIT_STATUS_SHOW          true
  __vertical_util_set VERTICAL_GIT_STATUS_SUFFIX        "]"
  __vertical_util_set VERTICAL_GIT_STATUS_SYM_ADDED     "+"
  __vertical_util_set VERTICAL_GIT_STATUS_SYM_AHEAD     "↑"
  __vertical_util_set VERTICAL_GIT_STATUS_SYM_BEHIND    "↓"
  __vertical_util_set VERTICAL_GIT_STATUS_SYM_DIVERGED  "⇵"
  __vertical_util_set VERTICAL_GIT_STATUS_SYM_DELETED   "-"
  __vertical_util_set VERTICAL_GIT_STATUS_SYM_MODIFIED  "!"
  __vertical_util_set VERTICAL_GIT_STATUS_SYM_RENAMED   "»"
  __vertical_util_set VERTICAL_GIT_STATUS_SYM_STASHED   "#"
  __vertical_util_set VERTICAL_GIT_STATUS_SYM_UNMERGED  "="
  __vertical_util_set VERTICAL_GIT_STATUS_SYM_UNTRACKED "?"

  if not __vertical_util_is_git
    return
  end

  if [ $VERTICAL_GIT_SHOW != true -o $VERTICAL_GIT_STATUS_SHOW != true ]
    return
  end

  set -l untracked false
  set -l added     false
  set -l deleted   false
  set -l modified  false
  set -l renamed   false
  set -l stashed   false
  set -l unmerged  false
  set -l ahead     false
  set -l behind    false
  set -l diverged  false

  set -l git_status (command git status --porcelain -b 2> /dev/null)
  set -l git_status_first (string split \n $git_status)[1]

  for s in (string split \n $git_status | string sub -s 1 -l 2)
    string match -q '*A*'  $s && set added     true
    string match -q '*D*'  $s && set deleted   true
    string match -q '*M*'  $s && set modified  true
    string match -q '*R*'  $s && set renamed   true
    string match -q '*U*'  $s && set unmerged  true
    string match -q '*\?*' $s && set untracked true
  end

  if [ -n (echo (command git rev-parse --verify refs/stash 2> /dev/null)) ]
    set stashed true
  end

  if string match -r '\[.*ahead.*\]' $git_status_first > /dev/null
    set ahead true
  end

  if string match -r '\[.*behind.*\]' $git_status_first > /dev/null
    set behind true
  end

  if [ $ahead = true ] && [ $behind = true ]
    set diverged true
    set ahead    false
    set behind   false
  end

  set -l status_syms (string join '' \
    ([ $untracked = true ] && echo $VERTICAL_GIT_STATUS_SYM_UNTRACKED) \
    ([ $added = true ] && echo $VERTICAL_GIT_STATUS_SYM_ADDED) \
    ([ $deleted = true ] && echo $VERTICAL_GIT_STATUS_SYM_DELETED) \
    ([ $modified = true ] && echo $VERTICAL_GIT_STATUS_SYM_MODIFIED) \
    ([ $renamed = true ] && echo $VERTICAL_GIT_STATUS_SYM_RENAMED) \
    ([ $stashed = true ] && echo $VERTICAL_GIT_STATUS_SYM_STASHED) \
    ([ $unmerged = true ] && echo $VERTICAL_GIT_STATUS_SYM_UNMERGED) \
    ([ $ahead = true ] && echo $VERTICAL_GIT_STATUS_SYM_AHEAD) \
    ([ $behind = true ] && echo $VERTICAL_GIT_STATUS_SYM_BEHIND) \
    ([ $diverged = true ] && echo $VERTICAL_GIT_STATUS_SYM_DIVERGED) \
  )

  if [ -n "$status_syms" ]
    set_color $VERTICAL_GIT_STATUS_COLOR
    echo -ens $VERTICAL_GIT_STATUS_PREFIX
    echo -ens $status_syms
    echo -ens $VERTICAL_GIT_STATUS_SUFFIX
    set_color $VERTICAL_COLOR_NORMAL
  end
end

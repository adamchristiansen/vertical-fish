function __vertical_component_git_status
  __vertical_util_set vertical_git_status_color             cyan --bold
  __vertical_util_set vertical_git_status_prefix            ' ['
  __vertical_util_set vertical_git_status_prefix_color      cyan --bold
  __vertical_util_set vertical_git_status_suffix            ]
  __vertical_util_set vertical_git_status_suffix_color      cyan --bold
  __vertical_util_set vertical_git_status_sym_added         +
  __vertical_util_set vertical_git_status_sym_added_deleted ±
  __vertical_util_set vertical_git_status_sym_ahead         ↑
  __vertical_util_set vertical_git_status_sym_behind        ↓
  __vertical_util_set vertical_git_status_sym_deleted       -
  __vertical_util_set vertical_git_status_sym_diverged      ↕
  __vertical_util_set vertical_git_status_sym_modified      •
  __vertical_util_set vertical_git_status_sym_renamed       ‣
  __vertical_util_set vertical_git_status_sym_stashed       '#'
  __vertical_util_set vertical_git_status_sym_unmerged      =
  __vertical_util_set vertical_git_status_sym_untracked     '?'

  if not __vertical_util_is_git
    return
  end

  set -l untracked     false
  set -l added         false
  set -l added_deleted false
  set -l deleted       false
  set -l modified      false
  set -l renamed       false
  set -l stashed       false
  set -l unmerged      false
  set -l ahead         false
  set -l behind        false
  set -l diverged      false

  set -l git_status (command git status --porcelain -b 2> /dev/null)
  set -l git_status_first (string split \n $git_status)[1]

  for s in (string split \n $git_status | string sub -s 1 -l 2)
    string match -q '*A*' $s && set added     true
    string match -q '*D*' $s && set deleted   true
    string match -q '*M*' $s && set modified  true
    string match -q '*R*' $s && set renamed   true
    string match -q '*U*' $s && set unmerged  true
    string match -q '*?*' $s && set untracked true
  end

  if [ $added = true ] && [ $deleted = true ]
    set added_deleted true
    set added         false
    set deleted       false
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
    ([ $untracked = true ] && echo $vertical_git_status_sym_untracked) \
    ([ $added = true ] && echo $vertical_git_status_sym_added) \
    ([ $added_deleted = true ] && echo $vertical_git_status_sym_added_deleted) \
    ([ $deleted = true ] && echo $vertical_git_status_sym_deleted) \
    ([ $modified = true ] && echo $vertical_git_status_sym_modified) \
    ([ $renamed = true ] && echo $vertical_git_status_sym_renamed) \
    ([ $stashed = true ] && echo $vertical_git_status_sym_stashed) \
    ([ $unmerged = true ] && echo $vertical_git_status_sym_unmerged) \
    ([ $ahead = true ] && echo $vertical_git_status_sym_ahead) \
    ([ $behind = true ] && echo $vertical_git_status_sym_behind) \
    ([ $diverged = true ] && echo $vertical_git_status_sym_diverged) \
  )

  if [ -n "$status_syms" ]
    set_color $vertical_git_status_prefix_color
    echo -ens $vertical_git_status_prefix
    set_color $vertical_git_status_color
    echo -ens $status_syms
    set_color $vertical_git_status_suffix_color
    echo -ens $vertical_git_status_suffix
    set_color normal
  end
end

function __vertical_component_git_status -d "Print the git status"
    # Options
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

    not __vertical_util_is_git; and return
    [ $VERTICAL_GIT_SHOW != true ]; and return
    [ $VERTICAL_GIT_STATUS_SHOW != true ]; and return

    # This is a list of statuses that are found
    set -l statuses
    # Get the git status in a format that can be parsed
    set -l git_status (command git status --porcelain -b 2> /dev/null)
    # Get only the first line of the status with the branch information
    set -l git_status_first (string split \n $git_status)[1]

    # Check the status of each file
    for i in (string split \n $git_status | string sub -s 1 -l 2)
        switch $i
            case '*\?*'; set -a statuses untracked
            case '*A*';  set -a statuses added
            case '*M*';  set -a statuses modified
            case '*R*';  set -a statuses renamed
            case '*D*';  set -a statuses deleted
            case '*U*';  set -a statuses unmerged
        end
    end

    # Check if there are any files stashed
    [ -n (echo (command git rev-parse --verify refs/stash 2> /dev/null)) ]
    and set -a statuses stashed

    # Check if the branch is ahead
    set -l ahead false
    string match -r '\[.*ahead.*\]' $git_status_first > /dev/null
    and set ahead true

    # Check if the branch is behind
    set -l behind false
    string match -r '\[.*behind.*\]' $git_status_first > /dev/null
    and set behind true

    # Set whether the branch is ahead, behind, or diverged
    if [ $ahead = true ] && [ $behind = true ]
        set -a statuses diverged
    else if [ $ahead = true ]
        set -a statuses ahead
    else if [ $behind = true ]
        set -a statuses behind
    end

    # The statuses are made uppercase so that they can be used in variable
    # substitution
    set statuses (string upper $statuses)

    # The order to display the git status symbols
    set -l order untracked added deleted modified renamed stashed unmerged \
        ahead behind diverged

    # Build up the status symbols by checking whether the status type was
    # discovered.
    set -l status_syms
    for i in $order
        set i (string upper $i)
        if contains $i in $statuses
            set -l status_symbol VERTICAL_GIT_STATUS_SYM_$i
            set status_syms "$$status_symbol$status_syms"
        end
    end

    if [ -n (echo $status_syms) ]
        set_color $VERTICAL_GIT_STATUS_COLOR
        echo -ens $VERTICAL_GIT_STATUS_PREFIX
        echo -ens $status_syms
        echo -ens $VERTICAL_GIT_STATUS_SUFFIX
        set_color $VERTICAL_COLOR_NORMAL
    end
end

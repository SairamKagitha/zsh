typeset -g FIRST_PROMPT=1
typeset -g LAST_COMMAND=""

function set_tab_title() {
    local title="${PWD##*/}"
    echo -ne "\033]0;${title}\007"
    
    if [[ $FIRST_PROMPT -eq 0 && $LAST_COMMAND != "c" ]]; then
        echo ""
    fi

    FIRST_PROMPT=0
    LAST_COMMAND=""
}


precmd() {
    set_tab_title
}

preexec() {
    LAST_COMMAND="${1%% *}"
    
    echo -ne "\033]0;${1}\007"
}

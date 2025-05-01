#
# Really awesome sauce .bashrc by local smart person https://github.com/ai-kana
#
# Original repo: https://github.com/ai-kana/dotfiles
#

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias objdump='objdump -M intel'

# severe lack of bnuyy...

BOLD="\e[1m"
RESET="\e[0m"

RED="\e[0;31m"
GREEN="\e[0;32m"
MAGENTA="\e[0;35m"
WHITE="\e[1;37m"

function get_branch() {
    git rev-parse --is-inside-work-tree &>/dev/null || return

    branch=$(git branch --show-current 2>/dev/null)

    if [ -z "$(git status --porcelain 2>/dev/null)" ]; then
        echo -e " ${GREEN}${branch}"
    else
        echo -e " ${RED}${branch}"
    fi
}

PS1="\[${BOLD}\][\[${MAGENTA}\]\u\$(get_branch) \[${WHITE}\]\W] \$ \[${RESET}\]"

#
# Really awesome sauce .bashrc by local smart person https://github.com/ai-kana
#
# Original repo: https://github.com/ai-kana/dotfiles
#

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias objdump='objdump -M intel'
alias gitswap='bash ~/gitswap.sh'

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
        echo -e " \001${GREEN}\002${branch}"
    else
        echo -e " \001${RED}\002${branch}"
    fi
}

function get_account() {
    git rev-parse --is-inside-work-tree &>/dev/null || return

    work_name=$(git config --global credential.work.name)
    personal_name=$(git config --global credential.personal.name)

    work_presence=$(grep -c $work_name ~/.git-credentials)
    personal_presence=$(grep -c $personal_name ~/.git-credentials)

    if [ $work_presence == 0 ]
    then
        echo " [Personal Git]"
    fi

    if [ $personal_presence == 0 ]
    then
        echo " [Work Git]"
    fi
}

PS1="\[${BOLD}\][\[${MAGENTA}\]\u\[${WHITE}\]\$(get_account)\$(get_branch) \[${WHITE}\]\W] \$ \[${RESET}\]"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

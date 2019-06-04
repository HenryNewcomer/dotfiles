export ZSH=/home/henry/.oh-my-zsh
export UPDATE_ZSH_DAYS=7
DISABLE_UPDATE_PROMPT=true
COMPLETION_WAITING_DOTS="true"

#ZSH_THEME="agnoster"
#ZSH_THEME="pure"
if grep -q Microsoft /proc/version; then
    ZSH_THEME="gentoo"
    echo "Ubuntu on Windows"
else
    ZSH_THEME="pure"
    echo "Native Linux"
fi

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Turn off the audible sound effect
setopt NO_BEEP

# Adds support to start Anaconda (Python) with the command: anaconda-navigator
export PATH="/home/henry/anaconda3/bin:$PATH"

# Make ZSH act similar to Vim :)
bindkey -v
bindkey -M viins '^e' vi-cmd-mode
bindkey ‘^R’ history-incremental-search-backward


# =============================
# -----------------------------
# Aliases
# -----------------------------

alias desk="ssh henry@henry-ubuntu"

# Arch: installed packages via yaourt
alias yp="yaourt -Qm"
# Force upgrades
alias yu="yaourt -Syyua"

# Reload source (zsh)
alias rz="source ~/.zshrc"
# Clear the Zsh history
alias ch=clearhist
# vtop theme
alias vtop="vtop --theme brew"
# NPM Reload for web development
alias www="live-server"
# Dotfiles locations
alias dot="cd /hdd/_Backups/Linux/dotfiles"
alias dotlap="cd ~/Dev/Linux/dotfiles"
alias eilap="vim ~/Dev/Linux/dotfiles/new_installs/after_new_install"
alias edlap="vim ~/Dev/Linux/dotfiles/new_installs/setup_dotfiles"
# Open the Downloads folder
alias dwn="cd ~/Downloads"

# Create log file for valgrind memory results
alias pongmem="cd ~/Development/C++/simple/pong++/build/ && valgrind --leak-check=full --gen-suppressions=all --log-file=../logs/valgrind-results.log ./pong++.exe"

# Personal project shortcuts/locations (on Linux):
alias pong="cd ~/Development/C++/simple/pong++/"

function cpp_pong_full_compile() {
    cd ~/Dev/C++/simple/pong++/build
    cmake ..
    make all
}
function cpp_pong_full_compile_and_run() {
    cd ~/Dev/C++/simple/pong++/build
    cmake ..
    make all
    ./pong++.exe
}
function cpp_pong_makefile_and_run() {
    cd ~/Dev/C++/simple/pong++/build
    make all
    ./pong++.exe
}
alias \?cp="cd ~/Dev/C++/simple/pong++"
alias \?cpb="cd ~/Dev/C++/simple/pong++/build"
alias \?p="~/Dev/C++/simple/pong++/build/pong++.exe"
alias \?cpc="cpp_pong_full_compile"
alias \?all="cpp_pong_full_compile_and_run"
alias \?m="cpp_pong_makefile_and_run"

# Compilers
alias \?cm="cmake .."
alias \?ma="make all"

# Git
alias gaa="git add -A"
alias gs="git status"
alias gu="git push"
alias gd="git pull"
alias glog='git log --pretty=format:"[%h] %ae, %ar: %s" --stat'
alias gls="git ls-files"
alias gm="git commit -m "
# Since I tend to type this on accident, specify what I mean
alias gp="echo 'Unknown alias. Suggestion: Did you mean gu (git upstream) or gd (git downstream)?'"

# Miscellaneous
alias x="xprop"

# =============================
# -----------------------------
# Functions
# -----------------------------

function clearhist() {
    rm $HISTFILE
    echo '' > ~/.zsh_history
    echo "$HISTFILE was removed; ZSH history is cleared."
}

# WORK IN PROGRESS
# example: somefunc gpull hlap
function testing() {
    echo "attempitng to load... Arg# $#"
    if [ $# -eq 2 ]; then
        case $1 in
            "hlap")
                echo "Henry's laptop"
                ;;
            "desk")
                echo "Henry's desktop"
                ;;
            *)
                echo "command help goes here, too."
                default
                ;;
        esac
    else
        echo "command help info goes here."
    fi
}

# =============================
# -----------------------------
# eof

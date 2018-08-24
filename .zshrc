export ZSH=/home/henry/.oh-my-zsh
ZSH_THEME="agnoster"
export UPDATE_ZSH_DAYS=2
DISABLE_UPDATE_PROMPT=true
COMPLETION_WAITING_DOTS="true"

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

# Edit (rc/conf) file
alias ev="vim ~/.vimrc"
alias ez="vim ~/.zshrc"
alias ei="vim ~/.i3/config"
alias et="vim ~/.config/termite/config"
# lol! blashphemy...
alias ee="vim ~/.emacs"

# Solus OS specific; check for upgrades
alias upg="sudo eopkg upgrade"

# Arch: installed packages via yaourt
alias yp="yaourt -Qm"

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

# Personal website location (on Desktop)
alias hn="cd /hdd/Development/henrynewcomer"

# Git
alias gaa="git add -A"
alias gs="git status"
alias gu="git push"
alias gd="git pull"
alias glog='git log --pretty=format:"[%h] %ae, %ar: %s" --stat'
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

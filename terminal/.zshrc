# ─┐ ┬┌─┐┌┐┌┌─┐┌┐ ┬ ┬┌┬┐┌─┐ ─┐ ┬┬ ┬┌─┐
# ┌┴┬┘├┤ ││││ │├┴┐└┬┘ │ ├┤  ┌┴┬┘└┬┘┌─┘
# ┴ └─└─┘┘└┘└─┘└─┘ ┴  ┴ └─┘o┴ └─ ┴ └─┘
# Author:  SENEX @ XENOBYTE.XYZ
# License: MIT License
# Website: https://xenobyte.xyz/projects/?nav=dotfiles

# Path to your oh-my-zsh installation.
export ZSH=/home/$USER/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="arrow"
# ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-extras github z git-hubflow git-flow history lol pip perl pyenv python sudo urltools web-search dirhistory encode64 gitfast colored-man-pages tmux tmuxinator)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='emacsclient -c'
else
  export EDITOR='emacsclient -c'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
export SCRIPTS_DIR=/home/$USER/.scripts/
export IMGBOARD_DL_DIR=/home/$USER/Downloads/imgdl

# For colored man pages
export PAGER="most"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="emacs ~/.zshrc &"
alias ohmyzsh="emacs ~/.oh-my-zsh &"
alias update="sudo pacman -Syu"
alias install="sudo pacman -S"
alias cache="sudo pacman -Ss"
alias info="sudo pacman -Qi"
alias member=$SCRIPTS_DIR"remember.sh"
alias pbcopy="xclip -sel clip"

# networking
alias list-wifi="nmcli device wifi list"
alias public_ipv4="curl l2.io/ip"
alias public_ipv6="curl ifconfig.pro"
alias geoloc="curl ip-api.com"
alias weather="curl wttr.in"
alias crypto_rates="curl rate.sx"
# git aliases
alias branches="git branch -a"
alias stashes="git stash list"
alias unstash="git stash apply"
alias unstage="git reset -q HEAD --"
alias discard="git checkout --"
alias uncommit="git reset --mixed HEAD~"
alias amend="git commit --amend"
alias nevermind="git reset --hard HEAD"
alias graph="git log --graph -10 --branches --remotes --tags  --format=format:'%Cgreen%h %Creset• %<(75,trunc)%s (%cN, %cr) %Cred%d' --date-order"
alias precommit="git diff --cached --diff-algorithm=minimal -w"
alias add_commit="git add -A && git commit -v --date=`date --utc +%Y-%m-%dT%H:%M:%S%z`"
#keep branch after merging
alias mergeNOFF="git merge --no-ff"
alias topoLog="git log --topo-order --decorate --first-parent"
#apps
#quickly encrypt a file named "file" REMEMBER TO EDIT THE KEY'S EMAIL TO YOURS
alias encrypt_file="gpg --encrypt --sign -r xenobyte.xyz@protonmail.com file"

export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export QT_QPA_PLATFORMTHEME=qt5ct
export QEMU_IRIX="~/Documents/apps/qemu-irix/qemu-irix" # For N64 ROMS compilation
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export WINEPREFIX=/home/admin/.wine

# export PATH="/home/$USER/Documents/Scripts:$PATH"
# required for MPC
export MPD_HOST="127.0.0.1"
export MPD_PORT="8451"

get_news() {
    curl "getnews.tech/$1";
}

get_stock() {
    curl "stonks.icu/$1"
}

imgdl() {
    if [ ! -d $IMGBOARD_DL_DIR ]; then
        mkdir $IMGBOARD_DL_DIR;
    fi
    rm -rf $IMGBOARD_DL_DIR/*;
    cd $IMGBOARD_DL_DIR;
    python3 $SCRIPTS_DIR"download_images.py" $1 | xargs wget;  # Path to script
}

firefox-guest () {
    PROFILEDIR=`mktemp -p /tmp -d tmp-fx-profile.XXX`
    firefox -profile $PROFILEDIR -no-remote -new-instance
    rm -I -rf $PROFILEDIR
}

cs() { cd "$1" && ls -la; }
strToHex() { echo -n "$1" | od -A n -t x1 }


alias hash_cmp="sh ~/.scripts/hash-compare "
alias webmize="bash "$SCRIPTS_DIR"webmize.sh"
alias yt_extract_mp3="youtube-dl -x --audio-format mp3 "
alias print_failed_ssh_cons="grep sshd.*Did /var/log/auth.log | less"
alias print_failed_ssh_logins="grep sshd.\*Failed /var/log/auth.log | less"
alias print_successful_ssh_logins="zgrep sshd /var/log/auth.log* | grep rhost | sed -re 's/.*rhost=([^ ]+).*/\1/' | sort -u"
alias print_public_ip="curl ipinfo.io/ip"
alias ban_ip="bash "$SCRIPTS_DIR"ufw_ban_ip.sh"
alias backup_dotfiles="~/.scripts/backup_dotfiles.sh"
alias backup_hexmacs="~/.scripts/backup_hexmacs.sh"
alias list_enabled="systemctl list-unit-files | grep enabled"
alias scan_lan="sudo nmap -sT -O 192.168.1.0/24"

# Bash only checks the first word of a command for an alias, any words after that are not checked. That means in a command like sudo ll, only the first word (sudo) is checked by bash for an alias, ll is ignored. We can tell bash to check the next word after the alias (i.e sudo) by adding a space to the end of the alias value.
# alias sudo='sudo '
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

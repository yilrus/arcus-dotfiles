# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/johann/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias f="clear; fortune"
alias dunnet="emacs -batch -l dunnet"
alias starwars="telnet towel.blinkenlights.nl"
alias ~="cd ~"
alias c="clear"
alias syu="pacaur -Syu"
alias clera="clear"
alias myip="curl ip.appspot.com"
alias chexdump='cat /dev/urandom | hexdump -C | grep "ca fe"'
alias atlauncher='java -jar ~/gaming/atlauncher/ATLauncher.jar'
alias settime='sudo ntpd -qg'
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"
alias chrome='google-chrome-stable'
# Extract most archives with one command
#
    extract () {
        if [ -f $1 ] ; then
            case $1 in
                *.tar.bz2)  tar xjf $1      ;;
                *.tar.gz)   tar xzf $1      ;;
                *.bz2)      bunzip2 $1      ;;
                *.rar)      unrar e $1      ;;
                *.gz)       gunzip $1       ;;
                *.tar)      tar xf $1       ;;
                *.tbz2)     tar xjf $1      ;;
                *.tgz)      tar xzf $1      ;;
                *.zip)      unzip $1        ;;
                *.Z)        uncompress $1   ;;
                *.7z)       7z x $1         ;;
                *)  echo "'$1' cannot be extracted via extract()" ;;
            esac
        else
            echo "'$1' is not a valid file"
        fi
    }

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
transfer() {
    #write to output to tmpfile because of progress bar
    tmpfile=$( mktemp -t transferXXX)
    curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile;
    cat $tmpfile;
    rm -f $tmpfile
    echo -e "\n"
}
alias tekkit="java -Xmx3G -Xms2GB -jar Tekkit.jar nogui"
alias hexxit="cd ~/hexxit; java -Xmx4096M -Xms4096M -jar Hexxit.jar nogui"
alias config='/usr/bin/git --git-dir=/home/johann/.cfg/ --work-tree /home/johann'
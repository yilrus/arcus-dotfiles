#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


## CACHE FOR AUR COMPILE
export PATH="/usr/lib/ccache/bin/:$PATH"

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
## Import colorscheme from 'wal'
#(wal -r &)

## If the command above doesn't work,
## try this alternative.
#setsid wal -r

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
alias f="clear; fortune" # fast fortune, can be repeated
alias dunnet="emacs -batch -l dunnet"
alias starwars="telnet towel.blinkenlights.nl" # ASCII Star Wars
alias ~="cd ~" # fast way of going home
alias c='clear' # clears the screen
alias syu='pacaur -Syu' # upgrades everything
alias clera='clear' # typo
alias myip='curl ip.appspot.com' # Gives me my public facing IP
alias chexdump='cat /dev/urandom | hexdump -C | grep "ca fe"'
alias atlauncher='java -jar ~/gaming/atlauncher/ATLauncher.jar '
alias settime='sudo ntpd -qg'

#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
    ii() {
        echo -e "\nYou are logged on ${RED}$HOST"
        echo -e "\nAdditionnal information:$NC " ; uname -a
        echo -e "\n${RED}Users logged on:$NC " ; w -h
        echo -e "\n${RED}Current date :$NC " ; date
        #echo -e "\n${RED}Machine stats :$NC " ; uptime
        echo -e "\n${RED}Current network location :$NC " ; scselect
        echo -e "\n${RED}Public facing IP Address :$NC " ;myip
        #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
        echo
    }


#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }
#   cleanupDS:  Recursively delete .DS_Store files
#   -------------------------------------------------------------------
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"


transfer() {
    # write to output to tmpfile because of progress bar
    tmpfile=$( mktemp -t transferXXX )
    curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile;
    cat $tmpfile;
    rm -f $tmpfile;
    echo -e "\n"
}
alias transfer=transfer
alias pape='feh --bg-fill ~/Pictures/CurrentWallpaper/wallpaper.png'

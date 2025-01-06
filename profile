export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

##############
# color etc.
##############
if [ "$PS1" ]; then
   case $TERM in
   xterm*)
       if [ -e /etc/sysconfig/bash-prompt-xterm ]; then
           PROMPT_COMMAND=/etc/sysconfig/bash-prompt-xterm
       else
           PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\007"'
       fi
       ;;
   screen)
       if [ -e /etc/sysconfig/bash-prompt-screen ]; then
           PROMPT_COMMAND=/etc/sysconfig/bash-prompt-screen
       else
           PROMPT_COMMAND='echo -ne "\033_${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\033\\"'
       fi
       ;;
   *)
       [ -e /etc/sysconfig/bash-prompt-default ] && PROMPT_COMMAND=/etc/sysconfig/bash-prompt-default
       ;;
   esac
   # Turn on checkwinsize
   shopt -s checkwinsize
   PS1="\[\033[1;31m\][\@]\[\033[0m\] \[\033[1;33m\]\u\[\033[0m\]@\[\033[4;34m\]\h\[\033[0m\] \[\033[1;32m\]\w\[\033[m\] \[\033[1;36m\]$\[\033[m\]  \[\033[1;37m\]\[\033[0m\]"
fi


export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad


#set -o vi


##############
# set vol
##############
function vol {
    case $1 in
        off)
            volume="0"
        ;;
        low)
            volume="1"
        ;;
         mid)
            volume="4"
        ;;
        high)
            volume="10"
    esac

    if ! [ "$1" ]; then
        echo "usage: volume [off|low|mid|high]"
    else
        echo "setting volume to $1"
        sudo osascript -e "set Volume $volume"
    fi
}


##############
# shortcut
##############
alias ll="ls -lGa"
#alias ll="ls -aFlrt"
alias h="history"
alias SS="/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine"
alias grep="grep --color"
alias lsd="ls -l | grep '^d'"

################
# history params
################
HISTSIZE=50000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT='%F %T '
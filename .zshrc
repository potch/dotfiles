HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
DIRSTACKSIZE=50
cdpath=(. ~)

fpath=( ${HOME}/.zsh/func $fpath )
export EDITOR=vim
export PAGER=most
export ACK_COLOR_MATCH=magenta

export ECHO_NEST_API_KEY="KBUNQ8J59L7CIBTKD"

#davedash
export FULLNAME='Matt Claypotch'
export EMAIL='thepotch@gmail.com'

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

PATH=$PATH:/usr/local/bin:/usr/local/git:/Users/potch/.gem/ruby/1.8/bin:/usr/local/mysql/bin:/usr/local/Cellar:/Users/potch/bin:/usr/local/share/npm/bin

# Load aliases
if [[ -r ${HOME}/.aliasrc ]]; then
	echo loading aliases
    eval `awk '/^[^# ]/ {print "alias " $0}' ${HOME}/.aliasrc`
fi

# Load git_ps1
if [[ -r ${HOME}/.zsh/git-ps1 ]]; then
	echo loading git ps1
    . ${HOME}/.zsh/git-ps1
fi

psvar=()
# Set the title to "user@host: directory"
case $TERM in
    (rxvt*|xterm*)
        precmd () {
            print -Pn "\e]0;%n@%m: %~\a"
            #psvar[2]=$(__git_ps1)
        }
	;;
esac

# Set the prompt
RPS1=$'%{\e[34m%}%~%{\e[0m%}%{\e[35m%}%2v%{\e[0m%}'
PS1=$'%{\e[36m%}%v %{\e[0m%}'
case $HOST in
    (venona)
        psvar='$';;
    (archie)
        psvar='(archie) $';;
    (khan.mozilla.org)
        psvar='(khan) $';;
    (*)
        psvar="($HOST) %%";;
esac

if [[ $UID == 0 ]]; then
    psvar='##'
fi

setopt                  \
	auto_pushd \
    NO_beep \
    pushd_ignore_dups \
    pushd_minus \

ab () {
	ack $1 -l | sort -u | xargs ack $2
}

source ~/.zsh.d/zshrc

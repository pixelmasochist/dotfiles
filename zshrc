# Host OS dependant stuff, ZSH and home directory locations.
# It's either this or remember to edit the file every time I make a change
# on a different platform.

if [[ $(uname) = 'Darwin' ]]; then

    SHELL=/bin/zsh

    zstyle :compinstall filename '/Users/pixelmasochist/.zshrc'
    case $TERM in
	xterm)
	# this should help with newer versions of vim not messing up xterms
	alias vi='/usr/bin/vim'
	export EDITOR="/usr/bin/vim"
	;;
	*)
	alias vi='/usr/local/bin/vim'
	export EDITOR="/usr/local/bin/vim"
	;;
    esac

    alias mysql='/usr/local/mysql/bin/mysql'
    alias mysqladmin='/usr/local/mysql/bin/mysqladmin'

fi

if [[ $(uname) = 'FreeBSD' ]]; then

    SHELL=/usr/local/bin/zsh

    zstyle :compinstall filename '/home/pixelmasochist/.zshrc'
    alias vi='/usr/local/bin/vim'
    export EDITOR="/usr/local/bin/vim"

fi

umask 0022

HISTFILE=~/.histfile
HISTSIZE=1024
SAVEHIST=1024

autoload -Uz compinit
compinit

autoload -U colors
colors

zstyle ':completion:*' menu select
setopt completealiases
setopt HIST_IGNORE_DUPS

export CLICOLOR=1
#BSD to Linux colours
export LSCOLORS=ExGxbxDxCxegedabagce

# I admit this is a bastardisation of xiong-chiamiov-plus from the oh-my-zsh collection.

PROMPT=$'%{\e[1;30m%}%B[%b%{\e[0m%}%{\e[0;37m%}%n%{\e[1;31m%} @ %{\e[0m%}%{\e[1;37m%}%m%{\e[1;30m%}%B]%b%{\e[0m%} - %b%{\e[1;30m%}%B[%b%{\e[1;34m%}%~%{\e[1;30m%}%B]%b%{\e[0m%}
%{\e[1;30m%}%B%B[%{\e[0;33m%}$%{\e[1;30m%}%B]%{\e[0m%}%b '

# standard 'make it work in terminals' keymapping

typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
	printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
	printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

#alias'

# directory listing
alias ls='ls -hGF'
alias la='ls -aF | sort -r'
alias ll='ls -lhGF'
alias lh='ls -lhGF'
alias lla='ls -lahGF'
alias lm='ls -lahGF | $PAGER'
alias lc='clear && ls -l'

# process management
alias px='ps ux'
alias pmore='ps uax | $PAGER'

# media players
alias uade='uade123 --headphones2'
alias sp8bit='sidplay -p8 -f2800'

# lynx bookmarks
alias quack='lynx https://www.duckduckgo.com'
alias google='lynx google.co.uk'
alias skyrim='lynx http://www.uesp.net/wiki/Skyrim:Skyrim'
alias 40k='lynx http://warhammer40k.wikia.com'
alias zeropunctuation='lynx "http://zeropunctuation.wikia.com/wiki/Zero_Punctuation_(Episode)"'

#FUNCTIONS

setenv() { export $1=$2 } # csh compatibility
setopt BSD_ECHO

#MAKE Flags!!!!
CC="clang"
CXX="clang++"
CXXFLAGS="${CFLAGS}"
export CC CXX CFLAGS CXXFLAGS

#ENV VARS
export PAGER="/usr/local/bin/most"
export BROWSER="/usr/local/bin/lynx"
export LYNX_LSS=$HOME/.lynx.lss
export LANGUAGE="en_GB.UTF-8"

# github

source ${HOME}/.config/github.sh

# test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

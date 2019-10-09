# ____    _    ____  _   _ ____   ____
#| __ )  / \  / ___|| | | |  _ \ / ___|
#|  _ \ / _ \ \___ \| |_| | |_) | |
#| |_) / ___ \ ___) |  _  |  _ <| |___
#|____/_/   \_\____/|_| |_|_| \_\\____|

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

shopt -s autocd
#aliases
source /etc/profile
alias p='sudo pacman'
alias shut='sudo shutdown now'
alias reb='sudo reboot now'
alias e='exit'
alias neo='neofetch'
alias vb='vim .config/i3/i3blocks.conf'
alias sm='sudo make install'
alias vc='vim .config/i3/config'
alias vbr='vim .bashrc'
alias c='clear'
alias mkdir='mkdir -v'
alias rmdir='rmdir -v'
alias ls='ls -hN --color=auto --group-directories-first'
alias yt='youtube-dl'


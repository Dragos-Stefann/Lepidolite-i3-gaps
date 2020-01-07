# mmmmmm  mmmm  m    m
#     #" #"   " #    #
#   m#   "#mmm  #mmmm#
#  m"        "# #    #
# ##mmmm "mmm#" #    #
# configuration file
#Forked from Luke Smith
### HIS website ###
#https://lukesmith.xyz/

### The original config ###

#https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52

### ATTETION ###
#if you press "ctrl + e" or you scroll down and it says vi not found, do this:
#sudo [or doas] echo [nvim, vim, nano, your choice] /usr/bin/vi
#chmod a+x /usr/bin/vi #Give execute permission to every user.
#If you are a vim user, execute this command:
#cat /usr/bin/vi
#The output should be nvim or vim and nano for the nano editor 
#You can execute any editor this way.

### That's it, after you clone this I recommend you to delete the useless comments, if you want to be a true minimalist. ###

# Enable colors and change prompt
autoload -U colors && colors
# Left prompt 
#Uncomment if you want an arrow as a prompt, this requiers font awesome.

PS1="%{$fg[green]%}%{%G%} %{$fg[magenta]%}%~%  "

#Uncomment the line bellow if you preffer a classic prompt [foo@bar]~$

#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Right prompt
#RPROMPT=WORK IN PROGRESS
#This will probably be a script that shows which branch im working in.

#History in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
#Of course, you will need to create the directory and the history file.

#Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o, you can set this to your preffered file manager, just change the lfcd variable.
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

#Implement reverse search
bindkey '^R' history-incremental-search-backward

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/syntax/zsh-syntax-highlighting.zsh 2>/dev/null
# If you want syntax highlighting, you need to clone this [ https://github.com/zsh-users/zsh-syntax-highlighting.git ] and edit the source however you like,
#for example if you cloned this in your $HOME directory, you will have something like this:
#source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

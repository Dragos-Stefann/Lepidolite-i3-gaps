#POWERLEVEL9K < POWERLEVEL10K !
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# mmmmmm  mmmm  m    m
#     #" #"   " #    #
#   m#   "#mmm  #mmmm#
#  m"        "# #    #
# ##mmmm "mmm#" #    #
# configuration file

### ATTETION ###
#if you press "ctrl + e" or you scroll down and it says vi not found, do this:
#sudo [or doas] echo [nvim, vim, nano, your choice] /usr/bin/vi
#chmod a+x /usr/bin/vi #Give execute permission to every user.
#If you are a vim user, execute this command:
#cat /usr/bin/vi
#The output should be nvim or vim and nano for the nano editor 
#You can execute any editor this way.

# Enable colors and set prompt theme
autoload -U colors && colors

#You need to have POWERLEVEL10k for your prompt to work.
#You can set your P10K prompt with this command: p10k configure.
#P9K might be needed for the 9K configuration, if don't want to install 9k, use the above command.
#Load theme
source  ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# Uncomment if you don't use P9K(POWERLEVEL9K) 
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Prompt config for P9K
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir) 
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator vcs vi_mode)

POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_ETC_ICON=''

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

# Use Powerlevel10k instead of Powerlevel9k.


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
#[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
#[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

#Implement reverse search
bindkey '^R' history-incremental-search-backward

# Load the zsh theme 
#source  ~/powerlevel9k/powerlevel9k.zsh-theme 2>/dev/null
# Load syntax highlighting plugin
source ~/zsh-syntax-highlighting/syn.zsh 2>/dev/null

################################ END ########################################

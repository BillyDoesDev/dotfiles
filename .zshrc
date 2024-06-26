# Enable colors and change prompt:
autoload -U colors && colors
PROMPT="
%F{#ee5950}%n%f%B%F{#b259bf}@%f%b%F{#7862e7}%m%f %B%F{#0088f3}→%f%b %F{#2a9de1}%~%f
%B%(?.%F{#9aa9ad}$%f.%F{red}$%f)%b "

## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt inc_append_history                                       # save commands are added to the history immediately, otherwise only when shell exits.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
#export EDITOR=/usr/bin/nano
#export VISUAL=/usr/bin/nano
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word


## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '\e[3;5~' kill-word                                     # delete next word with ctrl+delete
bindkey '^[[Z' undo                                             # Shift+tab undo last action

## Alias section 
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias gitu='git add . && git commit && git push'
alias ls='ls --color'
alias ll='ls -alhF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias owoify="sed 's/r/w/g;s/l/w/g;s/na/nya/g;s/ne/nye/g;s/ni/nyi/g;s/no/nyo/g;s/nu/nyu/g;s/he/hye/g'"
alias pacclean='sudo pacman -Scc && sudo pacman -Qdtq | sudo pacman -Rs -'
alias yt-dlp='yt-dlp --trim-filenames 80 --embed-metadata'
## yt-dlp  -o "%(title).200s.%(ext)s" URL
alias vaudio='pactl load-module module-null-sink sink_name=vsink && pactl load-module module-loopback sink=vsink'

# Theming section  
autoload -U compinit colors zcalc
compinit -d
colors

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R

# Handles command not found exception
# . /etc/zsh_command_not_found

if [[ -x /usr/lib/command-not-found || -x /usr/share/command-not-found/command-not-found ]]; then
  command_not_found_handler() {
    if [[ -x /usr/lib/command-not-found ]]; then
      /usr/lib/command-not-found -- "$1"
      return $?
    elif [[ -x /usr/share/command-not-found/command-not-found ]]; then
      /usr/share/command-not-found/command-not-found -- "$1"
      return $?
    else
      printf "zsh: command not found: %s\n" "$1" >&2
      return 127
    fi
  }
fi

# source /usr/share/doc/pkgfile/command-not-found.zsh

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)               # Include hidden files.

# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


## PERSONAL CONFIG
function compound(){

    # downloads a given compound in the current working dir
    # Example usage:
    # compound 500 500 000000 breh

    if [ $# != 4 ]; then
        echo "Usage: compound <x_res> <y_res> <fg_hex_code> <valid_compound_name>"
        echo "The file will be saved in the current working dir"
        else
            curl -s -o "$4_$1x$2.png" "https://avogadr.io/api/name/$1/$2/$3/$4"
            echo "$4_$1x$2.png"
    fi
}

source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh                       # loads syntax highlighting plugin
neofetch --color_blocks off --disable model shell resolution de wm wm_theme theme icons term term_font gpu --ascii_distro arch_small

# Load spaceship zsh prompt
#autoload -U promptinit; promptinit
#prompt spaceship
source "$HOME/.config/zsh/spaceship-prompt/spaceship.zsh"
source "$HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
#export QT_STYLE_OVERRIDE=kvantum
alias peaclock="peaclock --config-dir ~/.config/peaclock"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to your oh-my-zsh installation.
export ZSH="/home/niloy/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

ENABLE_CORRECTION="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git zsh-syntax-highlighting z)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

################################################################################
# User settings
################################################################################


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/niloy/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/niloy/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/niloy/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/niloy/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

################################################################################
# Configuration for fuzzy findder
################################################################################

# To search cmd history: ctrl + r
# To search file: ctrl + t
# To search directories: alt + c
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Configure VIM as the default editor
export VISUAL=vim
export EDITOR=vim

################################################################################
# WSL specific configuration
################################################################################

# By default, WSL shows ugly green background on directories owned by windows
# This is due to the 'other write' or 'ow' variable being set. Load custom
# directory colors file and use the same file for tab completion to fix this.
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Configure X11 forwarding with WSL
export DISPLAY_NUMBER="0.0"
export DISPLAY=$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}'):$DISPLAY_NUMBER
export LIBGL_ALWAYS_INDIRECT=1

################################################################################
# Configure aliases 
################################################################################
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

################################################################################
# Configure directory hashes 
################################################################################
hash -d project=/mnt/c/Users/Niloy/OneDrive\ -\ University\ of\ Waterloo/Projects/5G\ Elite\ Project
hash -d workspace=/mnt/c/Users/Niloy/Documents/workspace
hash -d assignments=/mnt/c/Users/Niloy/OneDrive\ -\ University\ of\ Waterloo/Classes/CS798\ Technologies\ and\ Enablers/Assignments/

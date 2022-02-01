# .zshrc
# --- Shell Configuration ---

# --- PowerLevel10K ---
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --- Oh-My-Zsh Location ---
export ZSH="$HOME/.oh-my-zsh"

# --- Oh-My-Zsh Configuration ---
ZSH_THEME="powerlevel10k/powerlevel10k"
HYPHEN_INSENSITIVE="true"
# I prefer to quote URLs anyway
DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting vi-mode)

source $ZSH/oh-my-zsh.sh

# --- User configuration ---

# opam configuration
[[ ! -r /home/relkochta/.opam/opam-init/init.zsh ]] || source /home/relkochta/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Shell
bindkey -v

# Environment variables
export LANG=en_US.UTF-8
export EDITOR=vim

# Path
export PATH="$PATH:$HOME/.cargo/bin:$HOME/bin"

# Aliases
alias vi=nvim
alias vim=nvim
alias ls=lsd
alias cmsc216-indent="indent -npsl -br -i4 -di3 -ce -npcs -brf -sob -cli4 -nbbo -nut -l78"


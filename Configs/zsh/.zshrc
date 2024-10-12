# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
source ~/powerlevel10k/powerlevel10k.zsh-theme

export PATH="$HOME/.tmuxifier/bin:$PATH"
export EDITOR='nvim'

eval "$(tmuxifier init -)"

alias ld="eza -lD" # list only directories (no files)
alias lf="eza -lf --color=always | grep -v /" # list only files (no directories)
alias lh="eza -dl .* --group-directories-first" #list only hidden files (no directories)
alias ll="eza -al --group-directories-first" # list everything with directories first
alias lss="eza -alf --color=always --sort=size | grep -v /" # list only files sorted by size
alias lm="eza -al --sort=modified" # list everythig sorted by time updated
alias lt="exa -T --color=always --group-directories-first --icons" # tree listing


lhh() {
  echo "ld  - list only directories (no files)"
  echo "lf  - list only files (no directories)"
  echo "lh  - list only hidden files (no directories)"
  echo "ll  - list everything with directories first"
  echo "lss - list only files sorted by size"
  echo "lm  - list everythig sorted by time updated"
  echo "lt  - tree listing"
}
export TERM="tmux-256color"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# ZSH Configurations
export ZSH_DISABLE_COMPFIX="true"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git fzf zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# cargo
source $HOME/.cargo/env


# Prompts:w
# eval "$(starship init zsh)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ $(grep -i Microsoft /proc/version) ]]; then
    export BROWSER=/mnt/c/Windows/explorer.exe
fi

# Exports
export EDITOR='nvim'
export SNOWFLAKE_PRIVATE_KEY="$(cat ~/dev/rsa_key.p8)"
export PATH="$HOME/.local/bin:$PATH"
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.config/bin:$PATH
export PATH=$HOME/zig14:$PATH
export PATH=/opt/nvim-linux-x86_64/bin:$PATH

# zoxide
eval "$(zoxide init zsh)"

function editdir() {
    cwd=$(pwd)
    cd $1
    $EDITOR .
    cd $cwd
}

# Aliases
alias zs="source ~/.zshrc"
alias python="python3"
alias ls="eza -l -g --icons --git"
alias lst="eza -1 --icons --tree --git-ignore"
alias vi="nvim"
alias vim="nvim"

# Keybinds
bindkey -s ^f "tmux-sessionizer\n"

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$HOME/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

#fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

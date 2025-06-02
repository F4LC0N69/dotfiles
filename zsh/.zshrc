if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

#set zinit and plugins directory
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d $ZINIT_HOME ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

#Source/load zinit
source "$ZINIT_HOME/zinit.zsh"

#load starship
eval "$(starship init zsh)"

#zinit plugins
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit load zsh-users/zsh-history-substring-search
zinit light Aloxaf/fzf-tab
zinit ice lucid nocompile
zinit load MenkeTechnologies/zsh-cargo-completion

#zinit snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::zoxide

autoload -Uz compinit && compinit -C
zinit cdreplay -q

#HISTORY
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt autocd
setopt interactivecomments

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

fpath+="$HOME/dotfiles/completions"
#Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' use-fzf-default-opts yes #If something breaks this is probably why.

#shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

#Aliases
alias l='eza -lh --icons=auto'
alias ld='eza -lhD --icons=auto'
alias ll='eza -lha --icons=auto --sort=name --group-directories-first'
alias ls='eza -1 --icons=auto'
alias lt='eza --icons=auto --tree'
alias cls='clear'
 
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias upd='brew update'
alias upg='brew upgrade'
alias i='brew install'
alias c='clear'
alias q='exit'
alias cd='z' 
alias cat='bat'
alias v='nvim'
alias rr='cargo run'
alias ff='nvim $(fzf --preview="bat --theme=Catppuccin\ Mocha --color=always {}")'
alias icat='kitty +kitten icat'
alias dots='cd $HOME/dotfiles'
alias cn='cargo new'
#copyfile refuses to work for some reason
function copyfile {
  [[ "$#" != 1 ]] && return 1
  local file_to_copy=$1
  cat $file_to_copy | pbcopy
}
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

#path setup
path=(
  $path #Keep existing path entry
  $HOME/dotfiles/scripts
  $HOME/.local/bin
  $HOME/.cargo/bin
  /opt/homebrew/opt/openjdk/bin
  /opt/homebrew/Caskroom/flutter/3.29.3/flutter/bin
  $HOME/cmdline-tools/bin
  /opt/homebrew/opt/rustup/bin
  )

# Remove non-existent and duplicate entries
typeset -U path
path=($^path(N-/))

#Export basically everything
export path
export BAT_THEME="Catppuccin Mocha"
export FZF_DEFAULT_OPTS=" \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
export ANDROID_NDK_HOME="/opt/homebrew/share/android-ndk"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

export NVM_DIR="$HOME/.nvm"
export EZA_CONFIG_DIR="$HOME/.config/eza"
export EDITOR="nvim"

[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

 # pokemon-colorscripts on terminal startup
# if [[ -o interactive ]] && [[ -z "$NVIM$TMUX" ]] && [[ $TERM_PROGRAM != "vscode" ]]; then
# pokemon-colorscripts -r --no-title
# fi

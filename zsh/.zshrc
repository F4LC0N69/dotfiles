#Check if Antigen is installed, if not, install it
if [ ! -d "$HOME/.antigen" ]; then
    echo "Antigen not found. Installing..."
    git clone https://github.com/zsh-users/antigen.git $HOME/.antigen
fi
 
source $HOME/.antigen/antigen.zsh
 
# Load oh-my-zsh's library
antigen use oh-my-zsh
 
antigen bundles <<EOBUNDLES
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-autosuggestions
zsh-users/zsh-completions
zsh-users/zsh-history-substring-search
sudo
copyfile
zoxide
web-search
Aloxaf/fzf-tab
Tarrasch/zsh-autoenv
zsh-bat
ziglang/shell-completions
EOBUNDLES
 
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:/opt/homebrew/opt/openjdk/bin:$PATH"
export BAT_THEME="Catppuccin Mocha"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

setopt autocd #Auto change directory when typing path
setopt interactivecomments #Allow comments in interactive shell


fpath+="$HOME/dotfiles/completions"
# Uncomment the line below if you want to use Spaceship theme
#antigen theme mattmc3/zephyr
 
# Tell antigen that you're done
antigen apply
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)
# Set aliases
alias l='eza -lh --icons=auto'
alias ld='eza -lhD --icons=auto'
alias ll='eza -lha --icons=auto --sort=name --group-directories-first'
alias ls='eza -1 --icons=auto'
alias lt='eza --icons=auto --tree'
alias cls='clear'
 
# Add other useful aliases
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
##I don't know what it does (Completion....... I guess??)
autoload -Uz compinit && compinit


export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# bun completions
[ -s "/Users/saxam/.bun/_bun" ] && source "/Users/saxam/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# pokemon-colorscripts on terminal startup
if [[ -o interactive ]] && [[ -z "$NVIM" ]] && [[ $TERM_PROGRAM != "vscode" ]]; then
pokemon-colorscripts -r --no-title
fi

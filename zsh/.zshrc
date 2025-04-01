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
##I don't know what it does (Completion....... I guess??)
autoload -Uz compinit && compinit


export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


#Custom command_not_found
function command_not_found_handler() {
    local cmd="$1"
    local suggestion

    # Try finding a close match using brew search
    suggestion=$(brew search "$cmd" 2>/dev/null | head -n 1)

    echo -e "\n\033[1;31m┌───────────────────────────────────────┐\033[0m"
    echo -e "  \033[1;31m🚨 Oops! Command Not Found 🚨\033[0m"
    echo -e "  \033[1;34m'$cmd'\033[0m? 🤔"

    if [[ -n "$suggestion" && "$suggestion" != "$cmd" ]]; then
        # Suggestion found
        echo -e "  \033[1;32m💡 Did you mean:\033[0m \033[1;36m$suggestion\033[0m?"
        echo -e "  Install it using: \033[1;33mbrew install $suggestion\033[0m"
        echo -ne "  \033[1;35m👉 Install now? (Y/n): \033[0m"

        # Read user input
        read -r response
        if [[ "$response" =~ ^[Yy]$ || -z "$response" ]]; then
            echo -e "  \033[1;32m✨ Installing $suggestion... 🚀\033[0m"
            brew install "$suggestion"
        else
            echo -e "  \033[1;31m❌ Skipping installation.\033[0m"
        fi
    elif [[ "$suggestion" == "$cmd" ]]; then
        # Exact match found
        echo -e "  \033[1;32m✨ Found exact match: \033[0m\033[1;36m$cmd\033[0m"
        echo -e "  You can install it using: \033[1;33mbrew install $cmd\033[0m"
        echo -ne "  \033[1;35m👉 Install now? (Y/n): \033[0m"

        # Read user input
        read -r response
        if [[ "$response" =~ ^[Yy]$ || -z "$response" ]]; then
            echo -e "  \033[1;32m✨ Installing $cmd... 🚀\033[0m"
            brew install "$cmd"
        else
            echo -e "  \033[1;31m❌ Skipping installation.\033[0m"
        fi
    else
        # No suggestions found
        echo -e "  \033[1;33m🔍 No suggestions found.\033[0m"
        echo -e "  Try searching manually with: \033[1;34mbrew search $cmd\033[0m"
    fi

    echo -e "\033[1;31m└───────────────────────────────────────┘\033[0m\n"
}


# bun completions
[ -s "/Users/saxam/.bun/_bun" ] && source "/Users/saxam/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


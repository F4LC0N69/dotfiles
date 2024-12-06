# Check if Antigen is installed, if not, install it
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
MichaelAquilina/zsh-autoswitch-virtualenv
EOBUNDLES
 
export PATH="$HOME/.cargo/bin:$PATH"
 
# Load the theme
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
alias python='python3'
 
# Add other useful aliases
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias upd='sudo pacman -Syy'
alias upg='sudo pacman -Syu'
alias i='sudo pacman -S'
alias c='clear'
alias q='exit'
 
alias cat='bat'

eval "$(starship init zsh)"

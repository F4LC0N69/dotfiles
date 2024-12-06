if status is-interactive
# Commands to run in interactive sessions can go here
end

# Set aliases
alias l="eza -lh --icons=auto"
alias ld="eza -lhD --icons=auto"
alias ll="eza -lha --icons=auto --sort=name --group-directories-first"
alias ls="eza -1 --icons=auto"
alias lt="eza --icons=auto --tree"
alias cls="clear"

# Add other useful aliases
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias upd="sudo pacman -Syy"
alias upg="sudo pacman -Syu"
alias i="sudo pacman -S"
alias c="clear"
alias q="exit"
alias cat="bat"
#start starship prompt
starship init fish | source

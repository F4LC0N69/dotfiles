#!/bin/bash

# ──[ Color codes ]──────────────────────────────────────────────
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# ──[ Folders to skip ]──────────────────────────────────────────
SKIP_DIRS=("scripts" "wallpapers" "brew")

# ──[ Helper: check and install Homebrew on macOS ]─────────────
install_brew() {
    echo -e "${YELLOW}Homebrew is not installed.${NC}"
    read -p "$(echo -e "${YELLOW}Do you want to install Homebrew? [y/N]: ${NC}")" choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv)"
    else
        echo -e "${RED}Cannot continue without Homebrew.${NC}"
        exit 1
    fi
}

# ──[ Helper: install GNU Stow ]─────────────────────────────────
install_stow() {
    echo -e "${YELLOW}GNU Stow is not installed.${NC}"
    case "$OSTYPE" in
        darwin*)
            read -p "$(echo -e "${YELLOW}Install stow with Homebrew? [y/N]: ${NC}")" choice
            [[ "$choice" =~ ^[Yy]$ ]] && brew install stow || {
                echo -e "${RED}Stow is required. Exiting.${NC}"
                exit 1
            }
            ;;
        linux*)
            if command -v apt &>/dev/null; then
                sudo apt update && sudo apt install -y stow
            elif command -v pacman &>/dev/null; then
                sudo pacman -Sy stow --noconfirm
            elif command -v dnf &>/dev/null; then
                sudo dnf install -y stow
            else
                echo -e "${RED}Please install stow manually. Unsupported package manager.${NC}"
                exit 1
            fi
            ;;
        *)
            echo -e "${RED}Unsupported OS. Please install GNU Stow manually.${NC}"
            exit 1
            ;;
    esac
}

# ──[ Pre-flight Checks ]────────────────────────────────────────
# Check for Homebrew if on macOS
if [[ "$OSTYPE" == "darwin"* && ! $(command -v brew) ]]; then
    install_brew
fi

# Check for GNU Stow
if ! command -v stow &>/dev/null; then
    install_stow
fi

# ──[ Stow Dotfiles ]────────────────────────────────────────────
echo -e "${CYAN}Starting dotfiles stow process...${NC}"

for dir in */; do
    dir=${dir%/}  # Remove trailing slash

    # Skip non-directories or skipped folders
    if [[ ! -d "$dir" || " ${SKIP_DIRS[*]} " == *" $dir "* ]]; then
        continue
    fi

    # Prompt before stowing
    read -p "$(echo -e "${YELLOW}Stow '$dir'? [y/N]: ${NC}")" choice
    case "$choice" in
        [Yy]* )
            echo -e "${GREEN}Stowing '$dir'...${NC}"
            stow "$dir"
            ;;
        * )
            echo -e "${CYAN}Skipped '$dir'.${NC}"
            ;;
    esac
done

echo -e "${CYAN}Stow process completed.${NC}"


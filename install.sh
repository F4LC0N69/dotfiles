#!/bin/bash

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

# Non-stow folders
SKIP_DIRS=("scripts" "wallpapers")

echo -e "${CYAN}Starting dotfiles stow process...${NC}"

for dir in */; do
    dir=${dir%/}  # Remove trailing slash

    # Skip non-directories or skipped dirs
    if [[ ! -d "$dir" || " ${SKIP_DIRS[*]} " == *" $dir "* ]]; then
        continue
    fi

    # Prompt the user
    read -p "$(echo -e "${YELLOW}Stow '$dir'? [y/N]: ${NC}")" choice
    case "$choice" in
        y|Y )
            echo -e "${GREEN}Stowing $dir...${NC}"
            stow "$dir"
            ;;
        * )
            echo -e "${CYAN}Skipped $dir.${NC}"
            ;;
    esac
done

echo -e "${CYAN}Stow process completed.${NC}"

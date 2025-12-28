#!/bin/bash

set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

link() {
    local src="$1"
    local dst="$2"

    mkdir -p "$(dirname "$dst")"

    if [ -L "$dst" ]; then
        rm "$dst"
    elif [ -e "$dst" ]; then
        echo "Backing up $dst → ${dst}.bak"
        mv "$dst" "${dst}.bak"
    fi

    ln -s "$src" "$dst"
    echo "Linked $dst → $src"
}

# Shell & editor
link "$DOTFILES/zshrc"    "$HOME/.zshrc"
link "$DOTFILES/vimrc"    "$HOME/.vimrc"
link "$DOTFILES/promptrc" "$HOME/.promptrc"

# Claude
link "$DOTFILES/claude.md" "$HOME/.claude/claude.md"

# VSCode (macOS)
VSCODE_USER="$HOME/Library/Application Support/Code/User"
link "$DOTFILES/vscode/settings.json"    "$VSCODE_USER/settings.json"
link "$DOTFILES/vscode/keybindings.json" "$VSCODE_USER/keybindings.json"

echo ""
echo "Done. Restart shell or run: source ~/.zshrc"

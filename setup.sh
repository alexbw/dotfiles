#!/bin/bash
# Lightweight dotfiles setup — symlinks active configs only
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PREZTO_DIR="${ZDOTDIR:-$HOME}/.zprezto"

link_item() {
    local src="$1"
    local dest="$2"
    local name="$3"

    if [ ! -e "$src" ]; then
        echo "  skip  $name (source not found)"
        return
    fi

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        if [ -L "$dest" ]; then
            current=$(readlink "$dest")
            if [ "$current" = "$src" ]; then
                echo "  ok    $name"
                return
            fi
            rm "$dest"
        else
            mv "$dest" "$dest.bak"
            echo "  bak   $name (backed up original)"
        fi
    fi

    ln -s "$src" "$dest"
    echo "  link  $name"
}

echo "Dotfiles Setup"
echo "=============="

echo
echo "tmux..."
link_item "$SCRIPT_DIR/tmux/tmux.conf" "$HOME/.tmux.conf" "~/.tmux.conf"

echo
echo "zsh..."
# Install Prezto if missing
if [ ! -d "$PREZTO_DIR" ]; then
    echo "  Installing Prezto..."
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "$PREZTO_DIR"
    # Link Prezto's default runcoms (except zshrc and zprofile which we override)
    for rcfile in "$PREZTO_DIR"/runcoms/^(README.md|zshrc|zprofile)(N); do
        link_item "$rcfile" "$HOME/.${rcfile:t}" "~/.${rcfile:t}"
    done
fi

# Link our zshrc/zprofile into Prezto's runcoms dir (Prezto symlinks these to ~/)
link_item "$SCRIPT_DIR/zsh/zshrc"    "$PREZTO_DIR/runcoms/zshrc"    "~/.zprezto/runcoms/zshrc"
link_item "$SCRIPT_DIR/zsh/zprofile" "$PREZTO_DIR/runcoms/zprofile" "~/.zprezto/runcoms/zprofile"

# Ensure ~/.zshrc and ~/.zprofile point to Prezto runcoms
link_item "$PREZTO_DIR/runcoms/zshrc"    "$HOME/.zshrc"    "~/.zshrc"
link_item "$PREZTO_DIR/runcoms/zprofile" "$HOME/.zprofile" "~/.zprofile"
link_item "$PREZTO_DIR/runcoms/zshenv"   "$HOME/.zshenv"   "~/.zshenv"

echo
echo "Done!"

#!/bin/bash
# Lightweight dotfiles setup — symlinks active configs only
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

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
link_item "$SCRIPT_DIR/tmux/tmux.conf" "$HOME/.tmux.conf" "~/.tmux.conf"
echo
echo "Done. Zsh is managed by Prezto (~/.zprezto) — see README for install."

#!/bin/zsh
# Dotfiles setup — symlinks active configs into Prezto + home
set -e

SCRIPT_DIR="${0:A:h}"
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
echo "zsh (Prezto)..."

# Install Prezto if missing
if [ ! -d "$PREZTO_DIR" ]; then
    echo "  Installing Prezto..."
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "$PREZTO_DIR"
fi

# Link our configs into Prezto runcoms
link_item "$SCRIPT_DIR/zsh/zshrc"     "$PREZTO_DIR/runcoms/zshrc"     "zprezto/runcoms/zshrc"
link_item "$SCRIPT_DIR/zsh/zprofile"  "$PREZTO_DIR/runcoms/zprofile"  "zprezto/runcoms/zprofile"
link_item "$SCRIPT_DIR/zsh/zpreztorc" "$PREZTO_DIR/runcoms/zpreztorc" "zprezto/runcoms/zpreztorc"

# Link Prezto runcoms → home directory
for rcfile in zshrc zprofile zpreztorc zshenv zlogin zlogout; do
    src="$PREZTO_DIR/runcoms/$rcfile"
    [ -e "$src" ] && link_item "$src" "$HOME/.$rcfile" "~/.$rcfile"
done

echo
echo "Done!"

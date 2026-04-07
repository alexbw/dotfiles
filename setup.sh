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
echo "git..."
link_item "$SCRIPT_DIR/git/gitconfig" "$HOME/.gitconfig" "~/.gitconfig"

echo
echo "ssh..."
mkdir -p "$HOME/.ssh"
link_item "$SCRIPT_DIR/ssh/config" "$HOME/.ssh/config" "~/.ssh/config"

echo
echo "slate..."
link_item "$SCRIPT_DIR/slate/slate" "$HOME/.slate" "~/.slate"

echo
echo "Nerd Font..."
if ! ls ~/Library/Fonts/MesloLGSNerdFont* &>/dev/null; then
    if command -v brew &>/dev/null; then
        echo "  Installing MesloLGS Nerd Font..."
        brew install --cask font-meslo-lg-nerd-font
    else
        echo "  skip  Nerd Font (install Homebrew first, then: brew install --cask font-meslo-lg-nerd-font)"
    fi
else
    echo "  ok    MesloLGS Nerd Font"
fi

echo
echo "Conda..."
if command -v conda &>/dev/null; then
    conda config --set auto_activate_base false
    echo "  ok    auto_activate_base = false"
else
    echo "  skip  conda not installed"
fi

echo
echo "iTerm2..."
ITERM_PLIST="$HOME/Library/Preferences/com.googlecode.iterm2.plist"
if [ -f "$ITERM_PLIST" ]; then
    # Set font to MesloLGS Nerd Font Mono 12
    /usr/libexec/PlistBuddy \
        -c "Set ':New Bookmarks:0:Normal Font' 'MesloLGSNerdFontMono-Regular 12'" \
        -c "Set ':New Bookmarks:0:Non Ascii Font' 'MesloLGSNerdFontMono-Regular 12'" \
        "$ITERM_PLIST" 2>/dev/null && echo "  ok    font -> MesloLGS Nerd Font Mono 12"
    # Set readable ANSI blue for dark backgrounds
    /usr/libexec/PlistBuddy \
        -c "Set ':New Bookmarks:0:Ansi 4 Color:Red Component' 0.588235" \
        -c "Set ':New Bookmarks:0:Ansi 4 Color:Green Component' 0.796078" \
        -c "Set ':New Bookmarks:0:Ansi 4 Color:Blue Component' 0.996078" \
        "$ITERM_PLIST" 2>/dev/null && echo "  ok    ANSI blue -> readable on dark bg"
    echo "  note: Restart iTerm2 for changes to take effect"
else
    echo "  skip  iTerm2 not found"
fi

echo
echo "Done!"

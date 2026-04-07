# Dotfiles

Personal dotfiles for macOS. Manages **tmux** and **zsh** (via [Prezto](https://github.com/sorin-ionescu/prezto)).

## Quick Start

```bash
git clone git@github.com:alexbw/dotfiles.git ~/Code/dotfiles
cd ~/Code/dotfiles
./setup.sh
```

## What It Does

`setup.sh` installs Prezto (if missing) and creates symlinks:

| Source | Destination |
|--------|-------------|
| `tmux/tmux.conf` | `~/.tmux.conf` |
| `zsh/zshrc` | `~/.zprezto/runcoms/zshrc` → `~/.zshrc` |
| `zsh/zprofile` | `~/.zprezto/runcoms/zprofile` → `~/.zprofile` |
| `zsh/zpreztorc` | `~/.zprezto/runcoms/zpreztorc` → `~/.zpreztorc` |
| `git/gitconfig` | `~/.gitconfig` |
| `ssh/config` | `~/.ssh/config` |
| `slate/slate` | `~/.slate` |

Prezto's default `zshenv`, `zlogin`, and `zlogout` are also linked to `~/`.

## What's Configured

- **tmux** — Tokyo Night theme, `C-q` prefix, vi keybindings, hjkl nav, mouse, OSC passthrough
- **zsh** — conda (auto_activate_base off), zoxide, bun, cargo, `~/.secrets` sourcing, `cc()` Claude Code tmux launcher, claude-skills PATH
- **zpreztorc** — damoekri prompt, emacs keybindings, history-substring-search
- **git** — GitHub credential helper (gh), Git LFS
- **ssh** — GitHub key config (ed25519)
- **slate** — window management with hyper key (ctrl+alt+cmd), hjkl positioning, grid snapping
- **iTerm2** — MesloLGS Nerd Font Mono 12pt, readable ANSI blue for dark backgrounds
- **Nerd Font** — MesloLGS Nerd Font (installed via Homebrew)

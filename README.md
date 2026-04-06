# Dotfiles

Personal dotfiles, forked from [YADR](https://github.com/skwp/dotfiles). Most of the original YADR vim/ruby/git config is still here but dormant. The actively used pieces are **tmux** and **zsh**.

## Quick Start (new machine)

```bash
git clone git@github.com:alexbw/dotfiles.git ~/Code/dotfiles
cd ~/Code/dotfiles
./setup.sh
```

This symlinks the active configs:

| Source | Symlink |
|--------|---------|
| `tmux/tmux.conf` | `~/.tmux.conf` |

### Zsh (via Prezto)

Zsh is managed separately by [Prezto](https://github.com/sorin-ionescu/prezto), which owns `~/.zshrc`, `~/.zshenv`, and `~/.zprofile` via its own symlinks into `~/.zprezto/runcoms/`. If Prezto isn't installed:

```bash
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

## What's Active

- **tmux** (`tmux/tmux.conf`) — Tokyo Night theme, `C-q` prefix, vi keybindings, hjkl nav, mouse, OSC passthrough for Claude Code window naming
- **zsh** — managed by Prezto (not this repo)

## What's Dormant (YADR legacy)

The original YADR vim plugins, ruby gems config, git aliases, iTerm themes, and `Rakefile` installer are still in the repo but not actively used. The old `rake install` workflow still works if you want the full YADR experience, but `setup.sh` is the lightweight path.

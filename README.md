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
| `zsh/zshrc` | `~/.zprezto/runcoms/zshrc` -> `~/.zshrc` |
| `zsh/zprofile` | `~/.zprezto/runcoms/zprofile` -> `~/.zprofile` |

The setup script will install [Prezto](https://github.com/sorin-ionescu/prezto) automatically if it's missing, then link our customized zshrc/zprofile into it.

## What's Active

- **tmux** (`tmux/tmux.conf`) — Tokyo Night theme, `C-q` prefix, vi keybindings, hjkl nav, mouse, OSC passthrough for Claude Code window naming
- **zsh** (`zsh/zshrc`, `zsh/zprofile`) — conda, zoxide, bun, cargo, `~/.secrets` sourcing, `cc()` Claude Code tmux session manager, claude-skills PATH

## What's Dormant (YADR legacy)

The original YADR vim plugins, ruby gems config, git aliases, iTerm themes, and `Rakefile` installer are still in the repo but not actively used. The old `rake install` workflow still works if you want the full YADR experience, but `setup.sh` is the lightweight path.

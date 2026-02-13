# Integrated Dracula Theme

This directory contains a customized version of the Dracula tmux theme, integrated directly into dotfiles.

## Customizations

- Changed active pane border color from light purple to **pink** (`#ff79c6`)
- Added custom status bar plugins: `checkadb`, `checkmw`, `checkdsk`, `checkvpn`, `checkada`

## Files

- `dracula.sh` - Main theme script
- `utils.sh` - Utility functions
- `check*.sh` - Custom status bar plugins

## Usage

The theme is automatically loaded via `~/.tmux/dracula.conf` which calls `dracula.sh`.
No external plugin manager needed for the theme itself.

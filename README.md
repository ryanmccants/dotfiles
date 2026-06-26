# Ryan's Dotfiles

A multi-machine configuration repository for Hyprland, Zsh, Neovim (LazyVim), and terminal utilities.

## Features

- **Hyprland Window Manager**: Custom layouts, safety exit rebinds, fast arrow window moving/resizing.
- **LazyVim / Neovim**: Fully configured shared Neovim editor.
- **Ghostty Terminal**: Configuration for GPU-accelerated terminal.
- **Zsh + Starship**: Clean prompt with standard aliases.
- **1Password SSH Integration**: Secure biometric SSH authorization.
- **Multi-Machine Configuration**: Keeps hardware details (monitors, trackpoint, paths) in git-ignored `.local` overrides.

---

## Installation & Deployment

On any new machine:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/ryanmccants/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Deploy Symlinks**:
   Run the symlink script:
   ```bash
   ./symlink.sh
   ```
   *This will automatically backup any conflicting system configs to `~/.dotfiles_backup/` and link files to `~/.config/`.*

3. **Configure Local Overrides**:
   Customize the created local configuration files (which are ignored by Git):
   - `~/.config/hypr/local.conf`: Monitor layout, scaling, specific inputs.
   - `~/.config/nvim/lua/config/local.lua`: Neovim overrides.
   - `~/.zshrc.local`: Local paths and shell overrides.

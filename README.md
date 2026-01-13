# Claude-Inspired Neovim Config

> zen master 2026 AI maxxer mode

A modern LazyVim-based Neovim configuration with a Claude-inspired color scheme and AI-first workflow.

## Features

- **Claude Colorscheme**: Warm dark theme with Claude's signature coral/orange accent (`#DA7756`)
- **AI-Powered Coding**: Avante.nvim (Cursor-like AI editing), Supermaven, Copilot
- **Modern UI**: Dashboard, smooth scrolling, zen mode, breadcrumbs
- **Full LSP Support**: TypeScript, Python, Rust, Go, and more
- **Zen Master Keybindings**: Centered scrolling, flash navigation, intuitive mappings

## Installation

1. Backup your existing config:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone this config:
   ```bash
   git clone https://github.com/nvidela-dev/neovim-config.git ~/.config/nvim
   ```

3. Start Neovim:
   ```bash
   nvim
   ```
   Lazy.nvim will automatically install all plugins.

## Key Bindings

| Key | Description |
|-----|-------------|
| `<Space>` | Leader key |
| `<Space>f` | Find files |
| `<Space>g` | Live grep |
| `<Space>e` | File explorer |
| `<Space>z` | Zen mode |
| `s` | Flash jump |
| `S` | Flash treesitter |
| `<C-d>/<C-u>` | Scroll down/up (centered) |
| `<Space>ca` | Code actions |
| `<Space>rn` | Rename symbol |

## AI Features

- **Avante.nvim**: Press `<leader>aa` for AI chat, select code and ask questions
- **Supermaven**: Tab completion with AI suggestions
- **Copilot Chat**: Built-in Copilot integration

## Color Palette

| Color | Hex | Usage |
|-------|-----|-------|
| Background | `#1C1917` | Main background (warm stone) |
| Foreground | `#E7E5E4` | Main text |
| Accent | `#DA7756` | Claude's coral/orange |
| Tan | `#C4A574` | Secondary accent |
| Green | `#84CC16` | Strings, additions |
| Yellow | `#F59E0B` | Numbers, constants |
| Red | `#EF4444` | Errors, deletions |

## Requirements

- Neovim >= 0.10.0
- Git
- A Nerd Font
- Node.js (for some LSP servers)
- ripgrep (for telescope)
- fd (for telescope)

## Credits

Built with [LazyVim](https://lazyvim.github.io/) and inspired by [Claude](https://claude.ai).

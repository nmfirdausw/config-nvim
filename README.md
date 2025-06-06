# Neovim Configuration

A modern Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager.

## Features

- **Plugin Management**: Uses lazy.nvim for fast and efficient plugin loading
- **Modular Structure**: Organized configuration with separate modules
- **Modern Setup**: Bootstrap configuration with automatic installation

## Structure

```
├── init.lua                 # Entry point, loads lazy configuration
├── lua/
│   ├── configs/
│   │   └── lazy.lua        # Lazy.nvim bootstrap and setup
│   └── plugins/            # Plugin configurations directory
└── README.md
```

## Installation

1. Clone this repository to your Neovim configuration directory:
   ```bash
   git clone <repo-url> ~/.config/nvim
   ```

2. Start Neovim - lazy.nvim will automatically install itself and any configured plugins:
   ```bash
   nvim
   ```

## Adding Plugins

Add your plugin configurations in the `lua/plugins/` directory. Each file should return a table of plugin specifications following lazy.nvim's format.

## Requirements

- Neovim >= 0.8.0
- Git (for plugin installation)
# nvim-config

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![Neovim](https://img.shields.io/badge/neovim-0.11%2B-green.svg)
![License](https://img.shields.io/badge/license-Apache%202.0-orange.svg)
![Plugin Manager](https://img.shields.io/badge/lazy.nvim-enabled-purple.svg)

A modern, modular Neovim configuration built with [lazy.nvim](https://github.com/folke/lazy.nvim)

---

## 📦 Requirements

Make sure the following dependencies are installed:

* A terminal with true colour (24-bit / 256 colour) support
* [A Nerd Font](https://www.nerdfonts.com) - icon support
* [`ripgrep`](https://github.com/BurntSushi/ripgrep) – fast searching
* [`fd`](https://github.com/sharkdp/fd) – improved file finding
* [`tree-sitter`](https://tree-sitter.github.io/tree-sitter/) CLI – syntax parsing

---

## 🚀 Installation

Clone this repository into your Neovim config directory:

```bash
git clone https://github.com/Silaspace/nvim-config ~/.config/nvim
```

Then launch Neovim:

```bash
nvim
```

On launch, `lazy.nvim` will automatically install itself and the plugins defined in `plugins` directory

---

## 🔌 Plugins

### [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
Turns open buffers into VSCode-style tabs 

### [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
Provides git indicators in the margin

### [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
Improves the statusline with iconography and colour

### [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
Bridge between mason and nvim-lspconfig

### [mason-null-ls.nvim](https://github.com/jay-babu/mason-null-ls.nvim)
Extension to mason that enables management of linters and formatters

### [mason.nvim](https://github.com/williamboman/mason.nvim)
LSP installation and management

### [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)
Configures linters and formatters

### [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
Neovim completion engine; interfaces with LSPs, open buffers, spellcheckers etc.

### [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
Configures Neovims built in Language Server Protocol (LSP)

### [nvim-osc52](https://github.com/ojroques/nvim-osc52)
Enables yanking (copying) over SSH using the OSC-52 protocol

### [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
AST-based syntax parsing

### [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
Adds icons to the UI; many plugins have this as a dependency

### [oil.nvim](https://github.com/stevearc/oil.nvim)
File explorer that lets you edit the filesystem like a normal buffer

### [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
Fuzzy finder used for file picking and live grep

### [tiny-inline-diagnostic.nvim](https://github.com/rachartier/tiny-inline-diagnostic.nvim)
Provides inline diagnostics; interfaces with LSPs and linters

### [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
Consistent theme for the UI

---

## 🧩 Customisation

Additional plugins should be configured in the `lua/plugins` directory, with a single file equating to a single plugin specification.
Each specfile takes on the following format -

```lua
return {
    "author/plugin.nvim"
    dependencies = {
        "author2/plugin-dependency1.nvim",
        "author3/plugin-dependency2.nvim"
    }
    config = function ()
        -- If you need to, require and setup the plugin
        require("plugin").setup({
            -- Plugin-specific options should go here 
        })

        -- Setup any keybindings for this plugin here
        vim.keymap.set("n", "<leader>e", ":PluginCommand<CR>")
    end
}
```

Settings and keymaps outside of plugins should be configured in `lua/config/settings.lua`
For example, indentation options -

```lua
vim.opt.tabstop = 4        -- Number of spaces in a <Tab>
vim.opt.shiftwidth = 4     -- Number of spaces for autoindent
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.autoindent = true  -- Copy indent from current line when starting a new line
vim.opt.smartindent = true -- Smarter autoindent
vim.opt.softtabstop = 4    -- Number of spaces for <Tab> in insert mode (including backspace)
```

Note - the options shown above are the default options set in the aformentioned file.

---

# nvim-config

![Version](https://img.shields.io/badge/version-1.1.0-blue.svg)
![Neovim](https://img.shields.io/badge/neovim-0.11%2B-green.svg)
![License](https://img.shields.io/badge/license-MIT%202.0-orange.svg)

A modern, modular Neovim configuration built with [lazy.nvim](https://github.com/folke/lazy.nvim)

---

## Requirements

Make sure the following dependencies are installed:

* A terminal with true colour (24-bit / 256 colour) support
* [A Nerd Font](https://www.nerdfonts.com) - icon support
* [`ripgrep`](https://github.com/BurntSushi/ripgrep) – fast searching
* [`fd`](https://github.com/sharkdp/fd) – improved file finding
* [`tree-sitter`](https://tree-sitter.github.io/tree-sitter/) CLI – syntax parsing

---

## Installation

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

## Plugins

- [blink.cmp](https://github.com/saghen/blink.cmp)
- [blink-cmp-spell](https://github.com/ribru17/blink-cmp-spell)
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-osc52](https://github.com/ojroques/nvim-osc52)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [oil.nvim](https://github.com/stevearc/oil.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [tiny-inline-diagnostic.nvim](https://github.com/rachartier/tiny-inline-diagnostic.nvim)
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)

---

## Language servers

Individual language servers are not installed by default, but are defined in `lsp.lua` and enabled automatically when the executable is present on the `PATH`.

For example -

```bash
# Go
go install golang.org/x/tools/gopls@latest
go install github.com/nametake/golangci-lint-langserver@latest

# JSON, YAML, PHP, Perl
npm install -g vscode-langservers-extracted yaml-language-server intelephense perlnavigator-server
```

---

## Local config

Settings that should only be applied locally (i.e. server paths, project include paths, extra servers) go in `lua/config/local.lua`.
An example copy is provided as `lua/config/local.example.lua`.

---

## Customisation

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

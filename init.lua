-- Cache compiled Lua modules for faster startup
vim.loader.enable()

-- Settings come first, as they set the leader keys used by plugin keymaps
-- Miscellaneous keybindings
-- Vim options
-- Global / non-plugin specific settings
require("config.settings")

-- Each plugin file installs its plugin(s) with vim.pack and configures them
-- Settings and keybindings relevant to a plugin should be defined inside its file
-- Files are loaded in this order, so dependencies must come first
require("plugins.tokyonight")
require("plugins.nvim-web-devicons")
require("plugins.bufferline")
require("plugins.lualine")
require("plugins.gitsigns")
require("plugins.oil")
require("plugins.telescope")
require("plugins.nvim-treesitter")
require("plugins.lsp")

-- Machine-specific overrides (gitignored), see lua/config/local.example.lua
if vim.uv.fs_stat(vim.fn.stdpath("config") .. "/lua/config/local.lua") then
    require("config.local")
end

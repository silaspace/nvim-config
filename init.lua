-- Import the lazy.nvim config
-- Will bootstrap lazy.nvim and install plugins from the specs in the plugins directory
-- Settings and keybindings relevant to a plugin should be defined inside the spec for the plugin
require("config.lazy")

-- Anything else can live in the settings file, examples include
-- Miscellaneous keybindings
-- Vim options
-- Global / non-plugin specific settings
require("config.settings")

-- Machine-specific overrides (gitignored), see lua/config/local.example.lua
if vim.uv.fs_stat(vim.fn.stdpath("config") .. "/lua/config/local.lua") then
    require("config.local")
end


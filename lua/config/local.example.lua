-- Local config
-- Copy to lua/config/local.lua (gitignored); it is loaded at the end of init.lua

-- Let servers like gopls watch the filesystem for project changes
-- Neovim disables this on Linux by default; it needs inotifywait installed
vim.lsp.config("*", {
    capabilities = {
        workspace = {
            didChangeWatchedFiles = {
                dynamicRegistration = true,
                relativePatternSupport = true,
            },
        },
    },
})

-- Custom intelephense config
vim.lsp.config("intelephense", {
    settings = {
        intelephense = {
            environment = {
                phpVersion = "8.3.0",
                includePaths = { "/usr/share/php" },
            },
        },
    },
})

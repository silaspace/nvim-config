-- Machine-specific overrides
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

-- Point a server at a binary that isn't on PATH, then enable it
vim.lsp.config("tsp_server", {
    cmd = { vim.fn.expand("~/project/node_modules/.bin/tsp-server"), "--stdio" },
})
vim.lsp.enable("tsp_server")

-- Per-machine server settings
vim.lsp.config("intelephense", {
    settings = {
        intelephense = {
            environment = {
                phpVersion = "7.2.24",
                includePaths = { "/usr/share/php" },
            },
        },
    },
})

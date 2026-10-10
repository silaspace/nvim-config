vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1") },
    "https://github.com/ribru17/blink-cmp-spell",
})

-- Mason's bin directory is appended to the PATH, so a binary
-- installed on the system takes precedence over Mason's copy
require("mason").setup({ PATH = "append" })

-- Enable all servers installed through Mason
-- Servers installed another way can be enabled in local.lua
local registry = require("mason-registry")
local function set_enabled(pkg, enable)
    local name = pkg.spec.neovim and pkg.spec.neovim.lspconfig
    if name then
        vim.lsp.enable(name, enable)
    end
end

for _, pkg in ipairs(registry.get_installed_packages()) do
    set_enabled(pkg, true)
end

registry:on("package:install:success", vim.schedule_wrap(function(pkg)
    set_enabled(pkg, true)
end))

registry:on("package:uninstall:success", vim.schedule_wrap(function(pkg)
    set_enabled(pkg, false)
end))

require("blink.cmp").setup({
    keymap = {
        preset = "super-tab",
        ["<Esc>"] = { "cancel", "fallback" },
    },
    completion = {
        menu = {
            border = "rounded",
            draw = {
                columns = {
                    { "label", "label_description", gap = 1 },
                    { "kind" },
                    { "source_name" },
                },
            },
        },
        documentation = {
            auto_show = true,
            window = { border = "rounded" },
        },
    },
    sources = {
        default = { "lsp", "path", "buffer", "spell" },
        providers = {
            -- buffer words show alongside LSP results, not only as a fallback
            lsp    = { name = "[LSP]", fallbacks = {} },
            path   = { name = "[Pth]" },
            buffer = { name = "[Buf]" },
            spell  = { name = "[Spl]", module = "blink-cmp-spell" },
        },
    },
    cmdline = { enabled = false },
})

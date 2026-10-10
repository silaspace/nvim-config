return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- server -> executable; only servers installed on this machine are
            -- enabled (a missing binary would otherwise error for some servers)
            local servers = {
                gopls            = "gopls",
                golangci_lint_ls = "golangci-lint-langserver",
                jsonls           = "vscode-json-language-server",
                yamlls           = "yaml-language-server",
                intelephense     = "intelephense",
                perlnavigator    = "perlnavigator",
                tsp_server       = "tsp-server",
            }
            for name, exe in pairs(servers) do
                if vim.fn.executable(exe) == 1 then
                    vim.lsp.enable(name)
                end
            end
        end
    },
    {
        "saghen/blink.cmp",
        -- main is the breaking V2 rewrite; v1 tags also get prebuilt binaries
        version = "1.*",
        dependencies = {
            "ribru17/blink-cmp-spell",
        },
        opts = {
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
                    path   = { name = "[Path]" },
                    buffer = { name = "[Buf]" },
                    spell  = { name = "[Spell]", module = "blink-cmp-spell" },
                },
            },
            cmdline = { enabled = false },
        },
    },
}

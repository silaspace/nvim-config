return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim"
    },
    config = function()
        -- cmp_nvim_lsp.default_capabilities() only returns completion-related
        -- capabilities, so merge it onto the full base capabilities
        local capabilities = vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            require("cmp_nvim_lsp").default_capabilities()
        )
        -- Neovim defaults didChangeWatchedFiles.dynamicRegistration to false, which
        -- stops servers like gopls from registering filesystem watchers.
        -- Enabled so the server is notified about all project changes.
        capabilities.workspace = capabilities.workspace or {}
        capabilities.workspace.didChangeWatchedFiles = {
            dynamicRegistration = true,
            relativePatternSupport = true,
        }
        vim.lsp.config("*", {
            capabilities = capabilities,
        })

        vim.lsp.enable("gopls")
        vim.lsp.enable("golangci_lint_ls")

        -- TypeSpec: the tsp-server binary is not on PATH; it ships with the
        -- @typespec/compiler installed in the spec/ workspace. Point cmd at the
        -- workspace binary (drop the cmd override if you `npm i -g @typespec/compiler`).
        -- Not managed by Mason: no typespec package exists in the registry.
        vim.lsp.config("tsp_server", {
            cmd = { vim.fn.expand("~/takedown/spec/node_modules/.bin/tsp-server"), "--stdio" },
        })
        vim.lsp.enable("tsp_server")

        -- PHP: Smarty and Psr are installed system-wide rather than under the
        -- repo's vendor/, so they need to be on includePaths to resolve.
        vim.lsp.config("intelephense", {
            settings = {
                intelephense = {
                    environment = {
                        phpVersion = "7.2.24",
                        documentRoot = vim.fn.expand("~/takedown"),
                        includePaths = {
                            "/usr/share/php/Smarty",
                            "/usr/share/php/Psr",
                            "/usr/share/php/league",
                            "/usr/share/php/FastRoute"
                        },
                    },
                },
            },
        })
    end
}


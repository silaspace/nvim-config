return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
    },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "perlnavigator",
                "intelephense",
                "jsonls",
                "yamlls",
                "lua_ls",
            },
        })
    end
}


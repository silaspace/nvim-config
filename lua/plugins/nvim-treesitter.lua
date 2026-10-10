return {
    "nvim-treesitter/nvim-treesitter",
    -- master is the branch that stays compatible with Neovim 0.11; main
    -- requires 0.12/nightly and uses a different, incompatible API.
    branch = "master",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        require("nvim-treesitter.configs").setup({
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true,
            ensure_installed = {
                "bash",
                "go",
                "json",
                "lua",
                "perl",
                "php",
                "typespec",
                "yaml",
            },
        })
    end
}

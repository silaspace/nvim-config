return {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("oil").setup({
            view_options = {
                -- show dotfiles, matching the old telescope file browser
                show_hidden = true,
            },
        })

        vim.keymap.set("n", "<leader>fe", ":Oil<CR>")
    end
}

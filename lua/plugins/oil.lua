vim.pack.add({
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/stevearc/oil.nvim",
})

require("oil").setup({
    view_options = {
        -- show dotfiles, matching the old telescope file browser
        show_hidden = true,
    },
})

vim.keymap.set("n", "<leader>fe", ":Oil<CR>")

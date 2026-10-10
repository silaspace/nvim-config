return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function ()
        local telescope = require("telescope")

        telescope.setup({
            pickers = {
                find_files = {
                    -- show dotfiles, but keep .git out of the results
                    hidden = true,
                    file_ignore_patterns = { "%.git/" },
                },
                live_grep = {
                    -- ripgrep ignores hidden files by default; --hidden re-enables
                    -- them, and the glob keeps .git out of the search
                    additional_args = { "--hidden", "--glob", "!**/.git/*" },
                },
            },
        })

        vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
        vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
        vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
    end
}

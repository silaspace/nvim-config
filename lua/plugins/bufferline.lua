return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "folke/tokyonight.nvim"
    },
    config = function()
        require("bufferline").setup({
            options = {
                separator_style = "slant",
                diagnostics = "nvim_lsp",
                always_show_bufferline = true,
                show_buffer_close_icons = false,
                show_close_icon = false,
            },
        })

        vim.keymap.set("n", "q", ":bdelete<CR>")             -- close current buffer
        vim.keymap.set("n", "=", ":BufferLineCycleNext<CR>") -- next buffer
        vim.keymap.set("n", "-", ":BufferLineCyclePrev<CR>") -- previous buffer
        vim.keymap.set("n", "+", ":BufferLineMoveNext<CR>")  -- move buffer right
        vim.keymap.set("n", "_", ":BufferLineMovePrev<CR>")  -- move buffer left
    end
}


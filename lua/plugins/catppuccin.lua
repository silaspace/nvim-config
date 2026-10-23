vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" }
})

require("catppuccin").setup({
    flavour = "mocha",
    -- let the terminal (ghostty) background show through, including bufferline and lualine
    transparent_background = true,
})

vim.cmd.colorscheme("catppuccin-nvim")

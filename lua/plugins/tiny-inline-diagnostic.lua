vim.pack.add({
    "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
})

-- Disable default inline diagnostics
vim.diagnostic.config({
    virtual_text = false,
})

require("tiny-inline-diagnostic").setup({
    preset = "modern",

    options = {
        show_source = {
            enabled = true,
        },
    },

    multilines = {
        enabled = true,
    },
})

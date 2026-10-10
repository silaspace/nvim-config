return {
    "nvim-treesitter/nvim-treesitter",
    -- main is the rewrite for Neovim 0.12; it compiles parsers with
    -- tree-sitter-cli (not the npm build) and does not support lazy-loading
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        local ts = require("nvim-treesitter")
        local available = ts.get_available()

        -- install the parser for a buffer's language on first use, then enable
        -- highlighting and indent, which the plugin no longer does itself
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(args.match)
                if not vim.list_contains(available, lang) then
                    return
                end

                -- install is asynchronous, and a no-op if already installed
                ts.install(lang):await(function()
                    vim.schedule(function()
                        if pcall(vim.treesitter.start, args.buf, lang) then
                            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                        end
                    end)
                end)
            end,
        })
    end
}

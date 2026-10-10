-- update parsers whenever the plugin itself is updated; registered before
-- vim.pack.add so it is in place for the event
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
            if not ev.data.active then
                vim.cmd.packadd("nvim-treesitter")
            end
            vim.cmd("TSUpdate")
        end
    end,
})

-- main is the rewrite for Neovim 0.12; it compiles parsers with
-- tree-sitter-cli (not the npm build) and does not support lazy-loading
vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

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

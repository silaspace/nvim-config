-- leader keys, set before any plugin keymaps are defined
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- editor options
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.spell = true
vim.opt.spelllang = {"en_gb"}

-- SSH clipboard
vim.g.clipboard = "osc52"

-- set indentation options
vim.opt.tabstop = 4        -- Number of spaces in a <Tab>
vim.opt.shiftwidth = 4     -- Number of spaces for autoindent
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.autoindent = true  -- Copy indent from current line when starting a new line
vim.opt.smartindent = true -- Smarter autoindent
vim.opt.softtabstop = 4    -- Number of spaces for <Tab> in insert mode (including backspace)

-- reload buffers when the underlying file changes on disk (e.g. external
-- edits), so the language server gets the new contents instead of the stale
-- in-memory buffer. autoread alone only checks on certain events, so a
-- checktime autocmd forces the reload.
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    pattern = "*",
    callback = function()
        if vim.fn.mode() ~= "c" and vim.fn.getcmdwintype() == "" then
            vim.cmd("checktime")
        end
    end,
})


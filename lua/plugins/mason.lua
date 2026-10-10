return {
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup({ PATH = "append" })
    end
}


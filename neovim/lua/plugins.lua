local plugin_dir = vim.fn.stdpath("data") .. "/lazy"
local lazypath = plugin_dir .. "/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",                     -- latest stable release
        lazypath,

    }
end
vim.opt.rtp:prepend(lazypath)
local plugin_specs = {
    {
        "shaunsingh/nord.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme nord]])
        end,
    },
    { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },

    -- file explorer
    {
        "nvim-tree/nvim-tree.lua",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("config.nvim-tree")
        end,

    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("config.lualine")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("gitsigns").setup()
        end,

    },
    {
        "nvim-treesitter/nvim-treesitter",

        event = "VeryLazy",
        build = ":TSUpdate",
        config = function()
            require("config.treesitter")
        end,

    },
    -- Manage your yank history
    {
        "gbprod/yanky.nvim",
        config = function()
            require("config.yanky")
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufRead", "BufNewFile" },
        config = function()
            require("config.lsp")
        end,
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },



}

require("lazy").setup {
    spec = plugin_specs,
    ui = {
        border = "rounded",
        title = "Plugin Manager",
        title_pos = "center",

    },
    install = { colorscheme = { "nord" } },
    rocks = {
        enabled = false,

    },

}

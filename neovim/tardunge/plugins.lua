local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	-- snapshot = "july-24",
	snapshot_path = fn.stdpath("config") .. "/snapshots",
	max_jobs = 50,
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
		prompt_border = "rounded", -- Border style of prompt popups.
	},
})

-- Install plugins here.
return require("packer").startup({
	function(use)
		---------------------
		-- Package Manager --
		---------------------

		use("wbthomason/packer.nvim")

		-- Icons
		use("nvim-tree/nvim-web-devicons")

		-- Statusline
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "nvim-tree/nvim-web-devicons", opt = true },
		})

		-- Color Scheme
		use("shaunsingh/nord.nvim")

		-- File Explorer
		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"nvim-tree/nvim-web-devicons",
			},
		})

		-- Reload Nvim
		use({
			"famiu/nvim-reload",
			requires = {
				"nvim-lua/plenary.nvim",
			},
		})

		-- For search
		use({ "ibhagwan/fzf-lua", requires = { "nvim-tree/nvim-web-devicons" } })

		-- For git modifations
		use({
			"lewis6991/gitsigns.nvim",
		})

		-- Clipboard
		use("gbprod/yanky.nvim")
		use("chrisgrieser/cmp_yanky")

		-- Treesitter Syntax highlighter and language parser
		-- faster than coc.
		use("nvim-treesitter/nvim-treesitter")

		-- rainbow colors for parantheses
		use("p00f/nvim-ts-rainbow")

		-- auto-completion
		use("hrsh7th/nvim-cmp")
		use("L3MON4D3/LuaSnip")
		use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path") -- path completions
		-- use 'hrsh7th/cmp-cmdline' -- cmdline completions
		use("saadparwaiz1/cmp_luasnip") -- snippet completions
		use("hrsh7th/cmp-nvim-lsp")
		-- use 'hrsh7th/cmp-emoji'
		-- use 'hrsh7th/cmp-nvim-lua'
		-- use { 'tzachar/cmp-tabnine', run = './install.sh' }

		-- LSP (Formatter, Linter, DAP)
		use("neovim/nvim-lspconfig")
		use("williamboman/mason-lspconfig.nvim")
		use("mfussenegger/nvim-dap")
		use("nvimtools/none-ls.nvim")
		use("williamboman/mason.nvim")
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})

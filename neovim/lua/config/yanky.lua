-- Clipboard configuration.
require("yanky").setup({
	ring = {
		history_length = 100,
		storage = "shada",
		-- storage_path = vim.fn.stdpath("data") .. "/databases/yanky.db", -- Only for sqlite storage
		sync_with_numbered_registers = true,
		cancel_event = "update",
		ignore_registers = { "_" }, -- black hole register. use this to ignore_registers.
		update_register_on_cycle = false,
	},
	picker = {
		select = {
			action = nil, -- nil to use default put action
		},
		telescope = {
			use_default_mappings = true, -- if default mappings should be used
			mappings = nil, -- nil to use default mappings or no mappings (see `use_default_mappings`)
		},
	},
	system_clipboard = {
		sync_with_ring = true,
		clipboard_register = nil,
	},
	highlight = {
		on_put = true,
		on_yank = true,
		timer = 500,
	},
	preserve_cursor_position = {
		enabled = true,
	},
	textobj = {
		enabled = true,
	},
})

-- Bindings

vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")

-- set blackhole register for x and d, so that vim doesn't automatically save the
-- deleted text in the default register.
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true })
vim.api.nvim_set_keymap("v", "x", '"_x', { noremap = true })
-- dd and p doesn't work.
--vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true })
--vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true })

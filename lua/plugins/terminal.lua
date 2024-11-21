return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			size = 55, -- Width of the terminal window in vertical mode
			open_mapping = [[<C-CR>]], -- Keybinding to toggle terminal
			hide_numbers = true,
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "vertical",
			close_on_exit = true,
			shell = vim.o.shell,
		})
	end,
}

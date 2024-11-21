return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			-- Jump to next snippet placeholder or perform indentation with Tab
			vim.keymap.set("i", "<Tab>", function()
				if require("luasnip").expand_or_jumpable() then
					require("luasnip").jump(1)
				else
					-- Default indentation behavior
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", true)
				end
			end, { noremap = true, silent = true })

			-- Jump to previous snippet placeholder with Shift+Tab
			vim.keymap.set("i", "<S-Tab>", function()
				if require("luasnip").jumpable(-1) then
					require("luasnip").jump(-1)
				else
					-- You can define behavior for Shift+Tab if needed, like outdentation
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "n", true)
				end
			end, { noremap = true, silent = true })
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					-- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
					-- ["<C-g>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}

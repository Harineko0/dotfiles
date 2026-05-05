return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"pyright",
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local bufnr = event.buf

					local map = function(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, {
							buffer = bufnr,
							desc = desc,
						})
					end

					map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
					map("n", "gr", vim.lsp.buf.references, "References")
					map("n", "K", vim.lsp.buf.hover, "Hover")
					map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
					map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
					map("n", "<leader>fd", vim.diagnostic.open_float, "Line Diagnostics")
					map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
					map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
				end,
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim", "Snacks" },
						},
					},
				},
			})

			vim.lsp.enable({
				"lua_ls",
				"ts_ls",
				"pyright",
			})
		end,
	},
}

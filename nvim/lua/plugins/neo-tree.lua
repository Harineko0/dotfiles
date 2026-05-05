return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		opts = {
			close_if_last_window = false,
			enable_git_status = true,
			enable_diagnostics = true,

			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				use_libuv_file_watcher = true,
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					hide_gitignored = true,
				},
			},

			window = {
				position = "left",
				width = 32,
				mappings = {
					["<space>"] = "none",
					["o"] = "open",
					["<cr>"] = "open",
					["S"] = "open_split",
					["s"] = "open_vsplit",
					["t"] = "open_tabnew",
					["a"] = "add",
					["d"] = "delete",
					["r"] = "rename",
					["c"] = "copy",
					["m"] = "move",
					["q"] = "close_window",
					["R"] = "refresh",
					["?"] = "show_help",
				},
			},
		},
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle filesystem left<cr>", desc = "Toggle Explorer" },
			{ "<leader>o", "<cmd>Neotree focus filesystem left<cr>", desc = "Focus Explorer" },
		},
	},
}

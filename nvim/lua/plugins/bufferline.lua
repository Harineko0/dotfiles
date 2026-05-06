return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		keys = {
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
			{ "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
			{ "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "Pick Close Buffer" },
			{ "<leader>bd", "<cmd>bdelete<cr>", desc = "Delete Buffer" },
			{ "<leader>bD", "<cmd>BufferLineCloseOthers<cr>", desc = "Delete Other Buffers" },
			{ "<leader>b]", "<cmd>BufferLineMoveNext<cr>", desc = "Move Buffer Right" },
			{ "<leader>b[", "<cmd>BufferLineMovePrev<cr>", desc = "Move Buffer Left" },
		},
		opts = {
			options = {
				mode = "buffers",
				themable = true,
				numbers = "none",
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				indicator = { style = "icon", icon = "▎" },
				buffer_close_icon = "󰅖",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(_, _, diagnostics_dict)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or "")
						s = s .. n .. sym
					end
					return s
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						text_align = "center",
						separator = true,
					},
				},
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = false,
				show_tab_indicators = true,
				separator_style = "slant",
				always_show_bufferline = true,
				hover = { enabled = true, delay = 200, reveal = { "close" } },
			},
		},
	},
}

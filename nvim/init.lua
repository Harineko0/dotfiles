-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

-- Basic settings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- Load plugins
require("lazy").setup("plugins", {
	change_detection = {
		notify = false,
	},
})

-- VS Code 風:
-- - nvim                    → カレントディレクトリが Git repo 内なら Git root を左ツリーで開く
-- - nvim .                  → . が Git repo 内なら Git root を左ツリーで開く
-- - nvim path/to/file       → そのファイルが Git repo 内なら Git root を左ツリーで開く
-- - Git repo でなければツリーは開かない
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local function git_root(start_path)
			local path = vim.fn.fnamemodify(start_path, ":p")

			if vim.fn.isdirectory(path) == 0 then
				path = vim.fn.fnamemodify(path, ":h")
			end

			local result = vim.fn.systemlist({
				"git",
				"-C",
				path,
				"rev-parse",
				"--show-toplevel",
			})

			if vim.v.shell_error ~= 0 or not result[1] or result[1] == "" then
				return nil
			end

			return result[1]
		end

		local start_path

		if vim.fn.argc() > 0 then
			start_path = vim.fn.argv(0)
		else
			start_path = vim.fn.getcwd()
		end

		local root = git_root(start_path)

		if not root then
			return
		end

		-- Neo-tree がロードされる前にコマンドを叩くケースを避ける
		vim.schedule(function()
			vim.cmd("Neotree show filesystem left dir=" .. vim.fn.fnameescape(root))

			-- nvim path/to/file の場合は、右側にそのファイルの編集画面を残す
			-- nvim / nvim . の場合は、右側の空バッファへフォーカスする
			vim.cmd("wincmd l")
		end)
	end,
})

-- 起動時に VS Code 風の下部 terminal を開く
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.schedule(function()
			-- Git repository 内でない場合は開かない
			local result = vim.fn.systemlist({
				"git",
				"-C",
				vim.fn.getcwd(),
				"rev-parse",
				"--show-toplevel",
			})

			if vim.v.shell_error ~= 0 or not result[1] or result[1] == "" then
				return
			end

			-- snacks.nvim の bottom terminal を開く
			Snacks.terminal(nil, {
				win = {
					position = "bottom",
					height = 0.30,
				},
			})

			-- terminal を開いたあと、編集領域へ戻る
			vim.cmd("wincmd k")
		end)
	end,
})

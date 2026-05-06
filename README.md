# dotfiles

Personal dotfiles for [github.com/Harineko0](https://github.com/Harineko0).

## Contents

- `nvim/` — Neovim configuration (Lua, [lazy.nvim](https://github.com/folke/lazy.nvim))

## Setup

Symlink (or copy) the directories into `~/.config`:

```sh
ln -s "$PWD/nvim" ~/.config/nvim
```

On first launch, `lazy.nvim` bootstraps itself and installs every plugin listed below.

## Neovim

### Behavior

- VS Code-like layout: on startup inside a Git repository, Neo-tree opens on the left and a Snacks bottom terminal opens at 30% height.
- Leader key is `<Space>`; local leader is `\`.
- Format-on-save via `conform.nvim`.
- Colorscheme: `sakura` (dark).

### Plugins

| Plugin | Purpose |
| --- | --- |
| [folke/lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [folke/snacks.nvim](https://github.com/folke/snacks.nvim) | Picker, explorer, terminal, dashboard, lazygit, notifier, indent guides, scroll, etc. |
| [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File tree (left sidebar) |
| [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client configs |
| [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) + [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | LSP/tool installer (`lua_ls`, `ts_ls`, `pyright`) |
| [saghen/blink.cmp](https://github.com/Saghen/blink.cmp) | Completion (LSP / path / snippets / buffer) |
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlight & indent (lua, vim, js/ts/tsx, html, css, json, markdown) |
| [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) | Formatting (stylua, prettier, black, gofmt, rustfmt) |
| [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git gutter signs, hunk navigation, blame |
| [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | LazyGit integration |
| [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Floating terminal / LazyGit float |
| [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | VS Code-style file tab bar |
| [anAcc22/sakura.nvim](https://github.com/anAcc22/sakura.nvim) | Colorscheme |

### Shortcuts

Leader = `<Space>`.

#### Files & search (snacks.picker)

| Key | Action |
| --- | --- |
| `<leader><space>` | Smart find files |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help pages |

#### Explorer

| Key | Action |
| --- | --- |
| `<leader>e` | Toggle file explorer |
| `<leader>o` | Focus Neo-tree |

Inside Neo-tree: `o` / `<CR>` open, `S` split, `s` vsplit, `t` new tab, `a` add, `d` delete, `r` rename, `c` copy, `m` move, `R` refresh, `q` close, `?` help.

#### Terminal

| Key | Action |
| --- | --- |
| `<leader>tt` | Toggle terminal |
| `<leader>tb` | Bottom terminal (VS Code-like) |
| `<C-\>` | Toggle floating terminal (toggleterm) |

#### Git

| Key | Action |
| --- | --- |
| `<leader>gg` | LazyGit |
| `]h` / `[h` | Next / previous hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |

#### LSP (active when an LSP attaches)

| Key | Action |
| --- | --- |
| `gd` | Go to definition |
| `gr` | References |
| `K` | Hover docs |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>fd` | Line diagnostics (float) |
| `[d` / `]d` | Previous / next diagnostic |

#### Buffers / Tabs (bufferline)

| Key | Action |
| --- | --- |
| `<S-h>` | Previous tab |
| `<S-l>` | Next tab |
| `<leader>bp` | Pick buffer by letter |
| `<leader>bc` | Pick buffer to close |
| `<leader>bd` | Delete current buffer |
| `<leader>bD` | Close all other buffers |
| `<leader>b[` | Move tab left |
| `<leader>b]` | Move tab right |

#### Misc

| Key | Action |
| --- | --- |
| `<leader>nh` | Notification history |

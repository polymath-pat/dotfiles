require "nvchad.mappings"

local map = vim.keymap.set

-- deletes/changes go to the black hole register (moved from init.lua)
map({ "n", "x" }, "d", '"_d')
map({ "n", "x" }, "D", '"_D')
map({ "n", "x" }, "c", '"_c')
map({ "n", "x" }, "C", '"_C')
map({ "n", "x" }, "x", '"_x')

-- search with "very magic" regex
map({ "n", "v" }, "/", [[/\v]])
map("n", "<localleader><space>", "<cmd>noh<CR>", { desc = "Clear search highlight" })

-- <tab> jumps to matching bracket (overrides NvChad's next-buffer)
map({ "n", "v" }, "<tab>", "%")

-- buffers: <C-n>/<C-p> (overrides NvChad's <C-n> = nvim-tree)
map("n", "<C-n>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<C-p>", "<cmd>bprev<CR>", { desc = "Prev buffer" })
map("n", "<localleader>tt", "<cmd>bp<CR>", { desc = "Prev buffer" })

-- file tree on your old NERDTree key
map("n", "<C-t>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })

-- disable arrow keys
for _, key in ipairs { "<up>", "<down>", "<left>", "<right>" } do
  map({ "n", "i" }, key, "<nop>")
end

-- jj to exit insert mode (NvChad's jk still works too)
map("i", "jj", "<ESC>")

-- ; as : in visual/operator-pending too (NvChad already does normal mode)
map({ "v", "o" }, ";", ":")

-- vertical split and jump into it
map("n", "<localleader>w", "<C-w>v<C-w>l", { desc = "Vertical split" })

-- toggles
map("n", "<localleader>cc", "<cmd>set colorcolumn=85<CR>", { desc = "Show colorcolumn" })
map("n", "<localleader>cco", "<cmd>set colorcolumn=0<CR>", { desc = "Hide colorcolumn" })
map("n", "<localleader>l", "<cmd>set list!<CR>", { desc = "Toggle whitespace chars" })
map("n", "<localleader>s", "<cmd>set invspell<CR>", { desc = "Toggle spelling" })

-- strip trailing whitespace
map("n", "<localleader>W", [[<cmd>%s/\s\+$//e<CR><cmd>let @/=''<CR>]], { desc = "Strip trailing whitespace" })

-- edit config in a vertical split
map("n", "<localleader>ev", "<cmd>vsplit $MYVIMRC<CR>", { desc = "Edit init.lua" })

-- LSP rename on F2 (K and gd are already set by NvChad's LSP config)
map("n", "<F2>", vim.lsp.buf.rename, { desc = "LSP rename" })

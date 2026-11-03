require "nvchad.options"

local o = vim.opt

-- indentation: 4 spaces (NvChad defaults to 2)
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true

-- line numbers / cursorline
o.number = true
o.relativenumber = true
o.cursorline = true
o.cursorlineopt = "both" -- NvChad only highlights the number column by default

-- search
o.ignorecase = true
o.smartcase = true
o.showmatch = true
o.gdefault = true -- :s replaces all matches on a line by default

-- text
o.wrap = true
o.textwidth = 79
-- formatoptions is set in autocmds.lua (filetype plugins overwrite it here)

-- whitespace display (toggle with ,l)
o.listchars = { tab = "» ", eol = "¬" }

-- command-line completion
o.wildmode = "list:longest"

-- undo (stored in Neovim's default state dir, not ~/.config)
o.undofile = true
o.undolevels = 1000
o.undoreload = 10000

-- terraform plugin
vim.g.terraform_align = 1
vim.g.terraform_fmt_on_save = 1

-- :sf -> :setfiletype
vim.cmd [[cabbrev sf <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'setfiletype' : 'sf')<cr>]]

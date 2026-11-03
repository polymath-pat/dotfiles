local autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup("user_autocmds", { clear = true })

-- formatoptions gets reset by filetype plugins, so reapply it per buffer
autocmd("FileType", {
  group = group,
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions = "qrn1"
  end,
})

-- Python: highlight text past column 120, no wrapping
autocmd("FileType", {
  group = group,
  pattern = "python",
  callback = function()
    vim.api.nvim_set_hl(0, "Excess", { bg = "#000000" })
    vim.fn.matchadd("Excess", [[\%120v.*]])
    vim.opt_local.wrap = false
  end,
})

-- auto-save all buffers when Neovim loses focus
autocmd("FocusLost", {
  group = group,
  command = "silent! wall",
})

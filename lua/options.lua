require "nvchad.options"

vim.opt.relativenumber = true

vim.o.cursorlineopt = "both" -- to enable cursorline!
vim.opt.scrolloff = 15

vim.g.copilot_no_tab_map = true
-- Make sure nvim-tree is open on editor open
if vim.fn.argc(-1) == 0 then
  vim.cmd "NvimTreeToggle"
end

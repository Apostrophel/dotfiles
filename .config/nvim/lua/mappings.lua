require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Open terminal and run live-server
vim.keymap.set('n', '<leader>ls', function()
  vim.cmd('split')
  vim.cmd('terminal live-server --port=3000 --host=localhost')
end)
-- Easy escape from terminal mode back to normal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Move between splits easily
vim.keymap.set('n', '<C-h>', '<C-w>h')  -- Move to left split
vim.keymap.set('n', '<C-j>', '<C-w>j')  -- Move to bottom split  
vim.keymap.set('n', '<C-k>', '<C-w>k')  -- Move to top split
vim.keymap.set('n', '<C-l>', '<C-w>l')  -- Move to right split

-- change inside underscore
vim.keymap.set({'o', 'x'}, 'i_', function()
  vim.cmd('normal! T_vt_')
end, { desc = "Inner underscore segment" })

vim.keymap.set({'o', 'x'}, 'a_', function()
  vim.cmd('normal! F_vf_')
end, { desc = "Around underscore segment" })  

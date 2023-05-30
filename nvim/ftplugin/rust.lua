local keymap = require('dompa.utils')

local inoremap = keymap.inoremap
local nnoremap = keymap.nnoremap

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

nnoremap('<leader>cr', '<cmd>!cargo run<CR>')
nnoremap('<leader>cb', '<cmd>!cargo build<CR>')
nnoremap('<leader>cc', '<cmd>!cargo check<CR>')
nnoremap('<leader>cd', '<cmd>!cargo doc --open --document-private-items<CR>')

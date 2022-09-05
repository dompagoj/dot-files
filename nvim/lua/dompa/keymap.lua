local keymap = require('dompa.utils')
local api = require('nvim-tree.api')

local inoremap = keymap.inoremap
local nnoremap = keymap.nnoremap

vim.g.mapleader = " "

inoremap('<S-Tab>', '<C-d>')
nnoremap('<C-b>', '<cmd>Ex<CR>')
-- nnoremap('<leader>w', '<cmd>bd<CR>')
nnoremap('<leader>w', '<cmd>BufferClose<CR>')

nnoremap('<leader>e', api.tree.focus)

nnoremap('<C-p>', ':Files<Cr>')
nnoremap('<leader>f', ':Rg<Cr>')

nnoremap('<M-x>', '<cmd>WhichKey <CR>')

-- -- vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', 'F12', , { noremap = true, silent = true })

nnoremap('<F12>', '<cmd>lua vim.diagnostic.goto_next()<CR>')
nnoremap('<F24>', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
nnoremap('<M-.>', '<cmd>lua vim.lsp.buf.code_action()<CR>')

nnoremap('<M-p>', '<cmd> lua vim.lsp.buf.hover() <CR>')

nnoremap('<M-left>', '<Cmd>BufferPrevious 1<CR>')
nnoremap('<M-right>', '<Cmd>BufferNext 1<CR>')

nnoremap('<M-1>', '<Cmd>BufferGoto 1<CR>')
nnoremap('<M-2>', '<Cmd>BufferGoto 2<CR>')
nnoremap('<M-3>', '<Cmd>BufferGoto 3<CR>')
nnoremap('<M-4>', '<Cmd>BufferGoto 4<CR>')
nnoremap('<M-5>', '<Cmd>BufferGoto 5<CR>')
nnoremap('<M-6>', '<Cmd>BufferGoto 6<CR>')
nnoremap('<M-7>', '<Cmd>BufferGoto 7<CR>')
nnoremap('<M-8>', '<Cmd>BufferGoto 8<CR>')
nnoremap('<M-9>', '<Cmd>BufferGoto 9<CR>')


vim.g.AutoPairsShortcutToggle = ''

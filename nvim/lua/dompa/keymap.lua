local keymap = require('dompa.utils')
local api = require('nvim-tree.api')
local telescope = require('telescope.builtin')

local inoremap = keymap.inoremap
local nnoremap = keymap.nnoremap

vim.g.mapleader = " "

nnoremap('<C-R>', '<cmd>edit! <CR>')

inoremap('<S-Tab>', '<C-d>')


nnoremap('<C-p>', function()
  telescope.find_files({
    find_command = { 'rg', '--files', '--hidden' },
    file_ignore_patterns = { 'node_modules', 'target', '.git/.*' },
  })
end)

nnoremap('<C-E>', telescope.buffers)
nnoremap('<M-e>', '<cmd>NvimTreeFindFile<CR>')
nnoremap('<C-b>', '<cmd>NvimTreeFindFileToggle<CR> <cmd>NvimTreeResize 50<CR>')

nnoremap('<M-o>', telescope.lsp_document_symbols)
nnoremap('<M-O>', telescope.lsp_dynamic_workspace_symbols)

nnoremap('gd', telescope.lsp_definitions)
nnoremap('gtd', telescope.lsp_type_definitions)
nnoremap('gi', telescope.lsp_implementations)

nnoremap('gD', '<cmd>Lspsaga lsp_finder<CR>')
nnoremap('<F12>', '<cmd>Lspsaga diagnostic_jump_next<CR>')
nnoremap('<F24>', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
nnoremap('<M-.>', '<cmd>Lspsaga code_action<CR>')
nnoremap('<F2>', '<cmd>Lspsaga rename<CR>')
nnoremap('<M-p>', '<cmd>Lspsaga hover_doc<CR>')
nnoremap('<M-P>', vim.lsp.buf.signature_help)

nnoremap('<M-x>', '<cmd>WhichKey <CR>')

nnoremap('<M-t>', '<cmd>ToggleTerm direction=float<CR>')

-- nnoremap('gd', vim.lsp.buf.definition)
-- nnoremap('gD', vim.lsp.buf.declaration)
-- nnoremap('gi', vim.lsp.buf.implementation)


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


nnoremap('<M-C-L>', function()
  vim.lsp.buf.format { async = true }
end)


vim.g.AutoPairsShortcutToggle = ''
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<M-t>', '<cmd>ToggleTerm <CR>', opts)
  -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  -- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  -- vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  -- vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  -- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')


-- LEADER KEYMAPS --
local crates = require('crates')

nnoremap('<leader>ss', '<cmd>wa<CR>')
nnoremap('<leader>cu', crates.upgrade_crate)
nnoremap('<leader>cU', crates.upgrade_all_crates)
nnoremap('<leader>cr', crates.open_repository)
nnoremap('<leader>cD', crates.open_documentation)
nnoremap('<leader>w', '<cmd>BufferClose!<CR>')
nnoremap('<leader>q', '<cmd>q!<CR>')


nnoremap('<leader>r', telescope.lsp_references)
nnoremap('<leader>d', telescope.diagnostics)
nnoremap('<leader>sf', telescope.live_grep)
nnoremap('<leader>sg', telescope.git_status)
nnoremap('<leader>f', telescope.current_buffer_fuzzy_find)

local gs = require 'gitsigns'
nnoremap('gr', gs.reset_hunk)
nnoremap('<leader>g', gs.blame_line)

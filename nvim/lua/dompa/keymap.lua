local keymap = require('dompa.utils')
local api = require('nvim-tree.api')
local telescope = require('telescope.builtin')
local saga = require('lspsaga')
saga.init_lsp_saga()

local inoremap = keymap.inoremap
local nnoremap = keymap.nnoremap

vim.g.mapleader = " "

nnoremap('<C-R>', '<cmd>edit! <CR>')

inoremap('<S-Tab>', '<C-d>')
nnoremap('<C-b>', '<cmd>Ex<CR>')
-- nnoremap('<leader>w', '<cmd>bd<CR>')
nnoremap('<leader>w', '<cmd>BufferClose!<CR>')

nnoremap('<leader>e', api.tree.focus)

nnoremap('<C-p>', function()
  telescope.find_files({
    find_command = { 'rg', '--files' },
  })
end)

nnoremap('<leader>r', telescope.lsp_references)
nnoremap('<leader>F', telescope.live_grep)
nnoremap('<leader>f', telescope.current_buffer_fuzzy_find)
nnoremap('<C-E>', telescope.buffers)

nnoremap('<M-o>', telescope.lsp_document_symbols)
nnoremap('<M-O>', telescope.lsp_dynamic_workspace_symbols)

nnoremap('gd', telescope.lsp_definitions)
nnoremap('gtd', telescope.lsp_type_definitions)
nnoremap('gi', telescope.lsp_implementations)
nnoremap('<leader>d', telescope.diagnostics)

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


nnoremap('<M-C-L>', vim.lsp.buf.formatting)


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


local Terminal = require('toggleterm.terminal').Terminal


local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    print('Closed!')
    vim.cmd('edit!')
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })


local crates = require('crates')

nnoremap('<leader>cu', crates.upgrade_crate)
nnoremap('<leader>cU', crates.upgrade_all_crates)
nnoremap('<leader>cr', crates.open_repository)
nnoremap('<leader>cD', crates.open_documentation)
nnoremap('<leader>cd', '<cmd>!cargo doc --open --document-private-items<CR>')

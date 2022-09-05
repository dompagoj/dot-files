require('dompa.packer')

require('nvim-tree').setup({
  disable_netrw = true,
  filters = {
    dotfiles = false,
    custom = { '.git' },
    exclude = {},
  },
})
require("mason").setup()

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.cmd('colorscheme gruvbox')
vim.cmd('filetype plugin indent on')
vim.cmd('set mouse+=a')

-- nnoremap('<leader>pv', '<cmd>Ex<CR>')

require('dompa.cpm_opts')
require 'lspconfig'.tsserver.setup {}

-- omnisharp lsp config
require 'lspconfig'.omnisharp.setup {
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  end,
  cmd = { "/usr/bin/omnisharp", "--languageserver", "--hostPID", tostring(pid) },
}

vim.diagnostic.config({
  update_in_insert = true
})

require('dompa.keymap')

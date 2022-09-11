require('dompa.packer')
require('impatient').enable_profile()

require('nvim-tree').setup({
  disable_netrw = true,
  filters = {
    dotfiles = false,
    custom = { '.git' },
    exclude = {},
  },
})
require("mason").setup()
require('mason-lspconfig').setup()

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
vim.opt.swapfile = false

vim.opt.wrap = false

-- vim.cmd('colorscheme gruvbox')
vim.cmd('colorscheme codedark')
vim.cmd('filetype plugin indent on')
vim.cmd('set mouse+=a')

-- nnoremap('<leader>pv', '<cmd>Ex<CR>')
require('dompa.lsp')
require('dompa.symbol-outline')
require('dompa.null-ls')

require('dompa.keymap')

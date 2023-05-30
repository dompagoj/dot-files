vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('dompa.packer')
require('impatient')

require('nvim-tree').setup({
  disable_netrw = true,
  filters = {
    dotfiles = false,
    custom = { '^\\.git/.*' }
  },
  actions = {
    open_file = {
      resize_window = true
    },
  },
})
require("mason").setup()
require('mason-lspconfig').setup()

require('dompa.opts')

require('nvim-ts-autotag').setup()

-- nnoremap('<leader>pv', '<cmd>Ex<CR>')
require('dompa.lsp')
require('dompa.symbol-outline')
require('dompa.null-ls')

require('dompa.keymap')

-- require("telescope").load_extension("flutter")

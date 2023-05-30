vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.updatetime = 300

vim.opt.wrap = false
vim.opt.clipboard = vim.opt.clipboard + 'unnamedplus'

-- vim.cmd('colorscheme gruvbox')
-- vim.cmd('colorscheme codedark')
-- vim.cmd("colorscheme carbonfox")
-- vim.cmd('colorscheme github_dark_default')

-- vim.g.falcon_airline = 1
-- vim.g.airline_theme = 'falcon'
-- vim.cmd('colorscheme falcon')

vim.cmd("colorscheme kanagawa-wave")


vim.cmd('filetype plugin indent on')
vim.cmd('set mouse+=a')
vim.cmd('set clipboard+=unnamedplus')

vim.g.rustfmt_command = "cargo +nightly fmt"

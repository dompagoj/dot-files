--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option('updatetime', 300)

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])


-- Completion Plugin Setup
local cmp = require 'cmp'
local lsp_kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })

cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    -- Add tab support
    ['<up>'] = cmp.mapping.select_prev_item(),
    ['<down>'] = cmp.mapping.select_next_item(),
    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<TAB>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  -- Installed sources:
  sources = {
    { name = 'path' }, -- file paths
    { name = 'vsnip' },
    { name = 'nvim_lsp', keyword_length = 3 }, -- from language server
    { name = 'nvim_lsp_signature_help' }, -- display function signatures with current parameter emphasized
    { name = 'nvim_lua', keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
    { name = 'crates' },
    -- { name = 'buffer', keyword_length = 2 }, -- source current buffer
  },
  -- window = {
  --   completion = cmp.config.window.bordered(),
  --   documentation = cmp.config.window.bordered(),
  -- },
  window = {
    documentation = {
      border = "rounded",
      winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
    },
    completion = cmp.config.window.bordered(),
    -- completion = {
    --   winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    --   col_offset = -3,
    --   side_padding = 1,
    -- }
    -- completion = {
    --   border = "rounded",
    --   winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
    -- },
  },
  experimental = {
    ghost_text = true,
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  formatting = {
    fields = { "kind", "abbr", 'menu' },
    format = function(entry, vim_item)
      -- vim_item.kind = kind_icons[vim_item.kind] or ""
      -- return vim_item

      local kind = lsp_kind(entry, vim_item)
      print(kind)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. strings[1] .. " "
      kind.menu = "    (" .. strings[2] .. ")"

      return kind


      -- Kind icons
      -- vim_item.kind = kind_icons[vim_item.kind]

      -- -- NOTE: order matters
      -- vim_item.menu = ({
      --   nvim_lsp = " ",
      --   nvim_lua = " ",
      --   luasnip = " ",
      --   buffer = " ",
      --   path = " ",
      --   emoji = " ",
      -- })[entry.source.name]

      -- return vim_item
    end,
  },
})


cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }


vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])


-- Completion Plugin Setup
local cmp = require 'cmp'
local lsp_kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 75 })
local compare = require("cmp.config.compare")

local lspkind_comparator = function(conf)
  local lsp_types = require('cmp.types').lsp
  return function(entry1, entry2)
    if entry1.source.name ~= 'nvim_lsp' then
      if entry2.source.name == 'nvim_lsp' then
        return false
      else
        return nil
      end
    end
    local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
    local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]

    local priority1 = conf.kind_priority[kind1] or 0
    local priority2 = conf.kind_priority[kind2] or 0
    if priority1 == priority2 then
      return nil
    end
    return priority2 < priority1
  end
end

local label_comparator = function(entry1, entry2)
  return entry1.completion_item.label < entry2.completion_item.label
end

cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert'
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
    { name = 'nvim_lsp',               max_item_count = 20 }, -- from language server
    { name = 'nvim_lsp_signature_help' },                     -- display function signatures with current parameter emphasized
    { name = 'nvim_lua' },                                    -- complete neovim's Lua runtime API such vim.lsp.*
    { name = 'crates' },
    { name = 'path' },                                        -- file paths
    { name = 'vsnip' },
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
  },
  sorting = {
    comparators = {
      -- compare.length,
      compare.exact,
      lspkind_comparator({
        kind_priority = {
          Field = 11,
          Property = 11,
          Constant = 10,
          Enum = 10,
          EnumMember = 10,
          Event = 10,
          Function = 10,
          Method = 10,
          Operator = 10,
          Reference = 10,
          Struct = 10,
          Variable = 9,
          File = 8,
          Folder = 8,
          Class = 5,
          Color = 5,
          Module = 5,
          Keyword = 2,
          Constructor = 1,
          Interface = 1,
          Text = 1,
          TypeParameter = 1,
          Unit = 1,
          Value = 1,
          Snippet = 0,
        },
      }),
      label_comparator,
    },
    -- comparators = {
    --   compare.exact,
    --   compare.order,
    --   compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
    --   -- compare.length,
    --   -- compare.kind,
    --   -- compare.offset,
    --   -- compare.sort_text,
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
      local lsp_item = lsp_kind(entry, vim_item)
      local strings = vim.split(lsp_item.kind, "%s", { trimempty = true })
      lsp_item.kind = " " .. strings[1] .. " "

      if strings[2] ~= nil then
        lsp_item.menu = "    (" .. strings[2] .. ")"
      end

      return lsp_item
    end,
  },
})

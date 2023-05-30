require('dompa.cpm_opts')
local nvim_lsp = require 'lspconfig'

local capabilities = require('cmp_nvim_lsp').default_capabilities()



local on_attach = function(client, bufnr)
  if (client.name ~= 'null-ls') then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end
end


local rt = require('rust-tools')

rt.setup({
  capabilities = capabilities,
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy"
      },
      lens = {
        enable = true,
      },
      rustfmt = {
        extraArgs = { "+nightly" }
      }
    },
  },
})


nvim_lsp.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

vim.diagnostic.config {
  update_in_insert = false
}

nvim_lsp.volar.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

nvim_lsp.omnisharp.setup {
  capabilities = capabilities
}

nvim_lsp.tailwindcss.setup {
  capabilities = capabilities
}

-- nvim_lsp.clangd.setup {
--   capabilities = capabilities
-- }

nvim_lsp.cssls.setup {
  capabilities = capabilities
}

-- require("flutter-tools").setup {}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    underline = true,
    signs = false,
  }
)

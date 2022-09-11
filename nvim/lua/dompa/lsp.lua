require('dompa.cpm_opts')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


local on_attach = function(client, bufnr)
  if (client.name ~= 'null-ls') then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
  print(client.name)
end

local rt = {
  capabilities = capabilities,
  server = {
    settings = {
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false

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
        }
      },
    }
  },
}
require('rust-tools').setup(rt)


require 'lspconfig'.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach
}


-- omnisharp lsp config
require 'lspconfig'.omnisharp.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    client.server_capabilities.documentFormattingProvider = false
  end,
  cmd = { "/home/domagoj/.local/share/nvim/mason/bin/omnisharp", "--languageserver", "--hostPID", tostring(pid) },
}

vim.diagnostic.config({
  update_in_insert = true
})

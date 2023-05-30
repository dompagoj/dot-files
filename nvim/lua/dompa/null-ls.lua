local null_ls = require('null-ls')

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.csharpier,
    null_ls.builtins.formatting.prettier,
    -- null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.diagnostics.eslint,
  }
}

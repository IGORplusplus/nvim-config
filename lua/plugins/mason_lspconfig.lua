-- Setup Mason and Mason-LSPConfig
-- Function to disable diagnostics and set up navigation
local on_attach = function(client, bufnr)
  -- Disable diagnostics (error/warning messages)
  client.handlers["textDocument/publishDiagnostics"] = function() end

  -- Disable virtual text (inline error/warning messages)
  vim.diagnostic.config({
    virtual_text = false,
    signs = false,
    underline = false,
  })

  -- Set up LSP keybindings for navigation
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Go to References" })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover for documentation" })
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename Symbol" })
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Actions" })
end

-- Configure each LSP server
local lspconfig = require('lspconfig')

lspconfig.clangd.setup({
  on_attach = on_attach,
})
lspconfig.lua_ls.setup({
  on_attach = on_attach,
})
lspconfig.pyright.setup({
  on_attach = on_attach,
})
lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
})
lspconfig.gopls.setup({
  on_attach = on_attach,
})
lspconfig.html.setup({
  on_attach = on_attach,
})
lspconfig.cssls.setup({
  on_attach = on_attach,
})
lspconfig.biome.setup({
  on_attach = on_attach,
})
lspconfig.bashls.setup({
  on_attach = on_attach,
})
lspconfig.jsonls.setup({
  on_attach = on_attach,
})
lspconfig.yamlls.setup({
  on_attach = on_attach,
})
lspconfig.zls.setup({
  on_attach = on_attach,
})
lspconfig.tinymist.setup({
  on_attach = on_attach,
})



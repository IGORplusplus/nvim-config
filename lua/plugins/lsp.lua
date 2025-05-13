-- ~/.config/nvim/lua/plugins/lsp.lua


local lspconfig = require('lspconfig')
local mason_lspconfig = require("mason-lspconfig")
local blink_cmp = require("blink.cmp")

-- Get enhanced capabilities from blink.cmp
local capabilities = blink_cmp.get_lsp_capabilities()

-- Setup each LSP server with capabilities


-- Define the LSP servers and their configurations
local servers = {
  clangd = {},
  lua_ls = {
    settings = {
      Lua = {
        workspace = { 
        maxPreload = 1000,
        preloadFileSize = 50000,
        -- Only include relevant folders
        library = {
          vim.env.VIMRUNTIME,
          -- Add any other specific folders you need
        },
	checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  },
  pyright = {},
  rust_analyzer = {},
  gopls = {},
  html = {},
  cssls = {},
  bashls = {},
  jsonls = {},
  yamlls = {},
  zls = {},
  tinymist = {},
 
    --[[
  typst_lsp = {
    cmd = { "typst-lsp" },
    filetypes = { "typst" },
    root_dir = function(fname)
      return vim.fn.getcwd()  -- Set root directory for Typst projects
    end,
  },
  ]]--

  -- Custom setup for Svelte LSP
--[[
  svelteserver = {
    cmd = { "svelteserver", "--stdio" },  -- or the correct path to the svelte server executable
    filetypes = { "svelte" },
    root_dir = function(fname)
      return vim.fn.getcwd()  -- Set root directory for Svelte projects
    end,
  },
]]--
}

-- Setup the servers
for name, config in pairs(servers) do
  lspconfig[name].setup(config)
end

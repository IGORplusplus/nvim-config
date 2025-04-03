-- Boot trap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set leader keys before loading lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Define your keymaps
vim.keymap.set('n', '<Leader>fj', ':Ex<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")
vim.keymap.set("n", "<leader>sv", "<C-w>v")  -- Split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s")  -- Split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=")  -- Make windows equal
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>")  -- Close window
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>")
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>")
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>")
vim.keymap.set('n', '<C-h>', '<C-w>h' )
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Lazy.nvim plugin configuration
require("lazy").setup({
  {
    'christoomey/vim-tmux-navigator',
    config = function()
      -- You don't need to manually bind keys here as the plugin
      -- automatically handles tmux pane navigation for you.
      -- Just enable the plugin and it will work out of the box.
    end,
  },
  {
      "kylechui/nvim-surround",
      version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
	  require("nvim-surround").setup({
	      -- Configuration here, or leave empty to use defaults
	  })
      end
  },

  {
    "nvim-treesitter/nvim-treesitter", -- Add the Tree-sitter plugin
    run = ':TSUpdate', -- Ensure parsers are updated on installation
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = "all", -- Install all available parsers
        highlight = {
          enable = true,              -- Enable syntax highlighting
          additional_vim_regex_highlighting = false, -- Disable Vim's native highlighting
        },
        indent = {
          enable = true,              -- Enable indentation based on Tree-sitter
        },
        autopairs = {
          enable = true,              -- Enable automatic pairing for brackets, etc.
        },
        incremental_selection = {
          enable = true,              -- Enable incremental selection (e.g., select syntax nodes)
          keymaps = {
            init_selection = "<CR>",  -- Keymap for initial selection
            node_incremental = "<Tab>", -- Keymap to increment selection
            scope_incremental = "<C-S>", -- Increment selection by scope
            node_decremental = "<S-Tab>", -- Decrement selection
          },
        },
      }
    end,
  },

  {
    "folke/tokyonight.nvim", 
    config = function()
      vim.cmd.colorscheme "tokyonight" 
    end,
  },
  -- Import other plugins here
  {
    import = "plugins.spec",  -- Replace with the actual plugin spec
    import = "plugins.telescope",
    -- Add other plugin imports as needed
  },
  -- Install settings
  install = { colorscheme = { "tokyonight" } },
  -- Plugin update checker
  checker = { enabled = true },
})


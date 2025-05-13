-- Bootstrap lazy.nvim
--
--
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

--[[
vim.keymap.set("n", "<leader>yf", function()
  require("yazi").open_yazi()
end, { desc = "Open Yazi file manager" })
]]--

--these are telescope keymaps

vim.api.nvim_set_keymap("n", "<leader>fs", "<cmd>lua require('telescope.builtin').live_grep()<CR>", { desc = "Find string in cwd" })

vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    -- Keymap for finding recent files
vim.api.nvim_set_keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    -- Keymap for finding string under cursor
vim.api.nvim_set_keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })


vim.keymap.set("n", "<leader>nh", ":nohl<CR>")
vim.keymap.set("n", "<leader>sv", "<C-w>v")  -- Split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s")  -- Split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=")  -- Make windows equal
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>")  -- Close window

--tabs are retarded to work with, sorry
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>") -- new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") --close tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>") -- next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>") -- previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>")

--navigation
vim.keymap.set('n', '<C-Left>', '<C-w>h')
vim.keymap.set('n', '<C-Down>', '<C-w>j')
vim.keymap.set('n', '<C-Up>', '<C-w>k')
vim.keymap.set('n', '<C-Right>', '<C-w>l')

vim.keymap.set('n', "<leader>td", ":Td<CR>", {silent = true})



-- Lazy.nvim plugin configuration
require("lazy").setup({


      {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",  -- or use "main" if you want the latest version
    dependencies = {
      "nvim-lua/plenary.nvim",  -- Required by Telescope
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",  -- This will build the native fzf extension
        config = function()
          -- Inside the config block, we load the fzf extension
          require("telescope").load_extension("fzf")
        end
      },
    },
    config = function()
      -- General Telescope configuration
      require("telescope").setup({
        defaults = {
          -- You can add your general Telescope settings here if needed
          prompt_prefix = "> ",
          color_devicons = true,
        },
      })
    end
  },


    {
	'numToStr/Comment.nvim',
	opts = {
        -- add any options here
	}
    },

{
  'echasnovski/mini.files',
  version = false,
  config = function()
    local MiniFiles = require("mini.files")
    vim.keymap.set("n", "<leader>fm", function()
	MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
	MiniFiles.reveal_cwd()
    end, { desc = "Open mini.files to cwd" })
  end,
},


{
  'echasnovski/mini.trailspace',
  version = false,
  config = function()
    require('mini.trailspace').setup()
    -- Keymap to remove trailing whitespace
    vim.keymap.set('n', '<leader>tw', MiniTrailspace.trim, { desc = 'Trim trailing whitespace' })
    -- Keymap to remove only trailing blank lines at end of file
    vim.keymap.set('n', '<leader>tb', MiniTrailspace.trim_last_lines, { desc = 'Trim blank lines at EOF' })
  end
},


{
  'echasnovski/mini.surround',
  version = false, -- or a specific version/tag
  config = function()
    require('mini.surround').setup()
  end,
},





  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
	    require("plugins.statusline").setup()
    end
  },


  {
    "nvim-treesitter/nvim-treesitter", -- Add the Tree-sitter plugin
    run = ':TSUpdate', -- Ensure parsers are updated on installation
    lazy = false,
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
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "fl", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "ft", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<C-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
},


  { 'williamboman/mason.nvim', config = function() require('plugins.mason') end },

  -- mason-lspconfig setup second
  { 'williamboman/mason-lspconfig.nvim', config = function() require('plugins.mason_lspconfig') end   },

  -- nvim-lspconfig setup third
  { 'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp',},
    config = function() require('plugins.lsp')
    end
  },

  {
  "nvimtools/none-ls.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("null-ls").setup({})
  end,
  },


  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      -- Set Kanagawa as the default colorscheme
      vim.cmd("colorscheme kanagawa-dragon")  -- Use 'kanagawa-wave' theme
    end,
  },
  { "rose-pine/neovim", name = "rose-pine" },

  {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = false,
    highlight = {
	keyword = "bg",
	after = "",

    },
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
    event = "VeryLazy",
  },


  --[[ {
    'hrsh7th/nvim-cmp',  -- nvim-cmp plugin
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',  -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer',    -- Buffer source for nvim-cmp
      'hrsh7th/cmp-path',      -- Path source for nvim-cmp
      'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
      'L3MON4D3/LuaSnip',  -- Snippet engine for nvim-cmp
    },
  }, ]]



  {
    import = "plugins.harpoon",
  },





  -- Import other plugins here
  {
    import = "plugins.nerdfonts",
    import = "plugins.telescope",
    import = "plugins.statusline",
    import = "plugins.flash",
    import = "plugins.cmp",
  },

  -- Install settings
  -- Plugin update checker
  checker = { enabled = true },
})


local function set_transparency_and_theme()
    -- Set the Kanagawa color theme
    vim.cmd('colorscheme kanagawa-dragon')

    -- Make Neovim transparent (for background)
    vim.api.nvim_set_var('transparent_background', true)  -- Make background transparent
    vim.cmd([[
        hi Normal guibg=NONE ctermbg=NONE
        hi SignColumn guibg=NONE ctermbg=NONE
        hi StatusLine guibg=NONE ctermbg=NONE
        hi StatusLineNC guibg=NONE ctermbg=NONE
        hi VertSplit guibg=NONE ctermbg=NONE
	hi LineNr guibg=NONE ctermbg=NONE
        hi CursorLineNr guibg=NONE ctermbg=NONE
        hi CursorLine guibg=NONE ctermbg=NONE
    ]])  -- Set transparency for various UI elements

end

-- Run the function to set transparency and theme on start
set_transparency_and_theme()

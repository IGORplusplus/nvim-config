require('lazy').setup({
  -- Add the plugin for pane navigation
  {
    'christoomey/vim-tmux-navigator',
    config = function()
      -- Customize the key mappings if needed
      vim.api.nvim_set_keymap('n', '<C-h>', '<Cmd>lua require("vim-tmux-navigator").navigate("h")<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<C-j>', '<Cmd>lua require("vim-tmux-navigator").navigate("j")<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<C-k>', '<Cmd>lua require("vim-tmux-navigator").navigate("k")<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<C-l>', '<Cmd>lua require("vim-tmux-navigator").navigate("l")<CR>', { noremap = true, silent = true })
    end,
  }
})

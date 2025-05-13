return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",          -- Required for Telescope
    { 
      "nvim-telescope/telescope-fzf-native.nvim",  -- FZF extension for Telescope
      build = "make",  -- Ensure we build the native extension
      config = function() 
        require('telescope').load_extension('fzf')  -- Load the extension after it's built
      end
    },
  },


  config = function()
    -- Set keymaps for Telescope
    local keymap = vim.keymap  -- for conciseness


	local opts = require('telescope.themes').get_ivy({
	cwd = vim.fn.stdpath("config")
	})
 end,
}


--TODO: change up the other search functions to fully use it


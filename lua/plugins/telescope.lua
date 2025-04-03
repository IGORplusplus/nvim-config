
return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
	"nvim-lua/plenary.nvim",    
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },



  config = function()
    -- Set keymaps for Telescope
    local keymap = vim.keymap  -- for conciseness


	local opts = require('telescope.themes').get_ivy({
	cwd = vim.fn.stdpath("config")
	})



    -- Keymap for finding files
    keymap.set("n", "<leader>fd", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    
    -- Keymap for finding recent files
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    
    -- Keymap for live grep search
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    
    -- Keymap for finding string under cursor
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
  end,
}


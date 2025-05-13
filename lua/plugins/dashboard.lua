return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  dependencies = { 
      "nvim-teleescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
      dependencies = {
        { "nvim-lua/plenary.nvim" }, -- needed by telescope
     },
    },
  config = function()
    require('dashboard').setup({
      theme = 'doom', -- or 'doom'
      config = {
    header = {
    },
center = {

         { 
            icon = "  ", 
            desc = "New File", 
            action = "ene | startinsert", 
            key = "n" 
          },

	{
	    icon = "  ",  -- Icon for quit
	    desc = "Quit NVIM", 
	    action = "qa",
	    key = "q"
	},
	},
      },
    })
  end,
}

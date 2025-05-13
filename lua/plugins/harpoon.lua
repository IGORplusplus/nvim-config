return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    local list = harpoon:list()

vim.keymap.set("n", "<leader>a", function() list:add() end, { noremap = true, desc = "Harpoon: Add file" })
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(list) end, { noremap = true, desc = "Harpoon: Toggle Quick Menu" })

vim.keymap.set("n", "<leader>h", function() list:select(1) end, { noremap = true, desc = "Harpoon: Go to file 1" })
vim.keymap.set("n", "<leader>j", function() list:select(2) end, { noremap = true, desc = "Harpoon: Go to file 2" })
vim.keymap.set("n", "<leader>k", function() list:select(3) end, { noremap = true, desc = "Harpoon: Go to file 3" })
vim.keymap.set("n", "<leader>l", function() list:select(4) end, { noremap = true, desc = "Harpoon: Go to file 4" })
  end,
}


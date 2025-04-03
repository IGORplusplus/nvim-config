--make it so that tabs and spaces are as desired
--add new keymaps
--add treesitter, plenary, telescope
--make command line how it was

require("config.lazy")
vim. wo. relativenumber = true
vim.opt.shiftwidth = 4
if true then
    print "much better"
end

-- Prevent delete operation from saving to any register
-- Send deleted content to register 'a'
vim.api.nvim_set_keymap('n', 'd', '"ad', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'd', '"ad', { noremap = true, silent = true })

vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true}),
    callback = function()
        vim.highlight.on_yank()
    end,
})


function ColorMyPencils(color)
    -- Make sure the colorscheme is loaded first
    color = color or "kanagawa-wave"  -- Default to "kanagawa-wave"
    vim.cmd("colorscheme " .. color)  -- Apply the colorscheme
    -- Set transparency for various UI elements
    vim.api.nvim.set_hl(0, "Normal", {bg = "none"})
    vim.api.nvim.set_hl(0, "NormalFloat", {bg = "none"})
    vim.api.nvim.set_hl(0, "NonText", {bg = "none"})
    vim.api.nvim.set_hl(0, "LineNr", {bg = "none"})
    vim.api.nvim.set_hl(0, "EndOfBuffer", {bg = "none"})
    vim.api.nvim.set_hl(0, "Pmenu", {bg = "none"})
    vim.api.nvim.set_hl(0, "PmenuSel", {bg = "none"})
    vim.api.nvim.set_hl(0, "FloatBorder", {bg = "none"})
    vim.api.nvim.set_hl(0, "StatusLine", {bg = "none"})
    vim.api.nvim.set_hl(0, "StatusLineNC", {bg = "none"})
end

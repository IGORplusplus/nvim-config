local M = {}

function M.open_yazi()
  -- Create a scratch buffer (no file)
  local buf = vim.api.nvim_create_buf(false, true)

  -- Set the buffer to be a terminal
  vim.api.nvim_buf_set_option(buf, 'buftype', 'terminal')

  -- Set the buffer as the current buffer
  vim.api.nvim_set_current_buf(buf)

  -- Start a terminal in that buffer, running "yazi"
  vim.fn.termopen("yazi", {
    on_exit = function()
      -- Optionally, close the buffer when the terminal exits
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  })

  -- Enter terminal mode immediately so you can interact
  vim.cmd("startinsert")
end

return M

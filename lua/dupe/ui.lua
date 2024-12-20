local utils = require("dupe.utils")

---@class CustomModule
local M = {}

M.close_float = function(buf, win)
  if buf ~= nil and vim.api.nvim_buf_is_valid(buf) then
    vim.api.nvim_buf_delete(buf, { force = true })
  end

  if win ~= nil and vim.api.nvim_win_is_valid(win) then
    vim.api.nvim_win_close(win, true)
  end
end

M.create_float_window = function(regs, opts, config)
  -- Create a scratch buffer
  local buf = vim.api.nvim_create_buf(false, true)

  -- Insert the lines into the buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, regs)

  -- Open the buffer in a floating window for display
  local width = 50
  local height = 10
  local float = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = (vim.o.lines - height) / 2,
    col = (vim.o.columns - width) / 2,
    style = "minimal",
    border = "rounded",
  })

  -- This sets line numbers, but we are using custom markers
  if config.show_line_numbers then
    vim.api.nvim_set_option_value("number", true, { win = float })
  end

  -- Set bindings for menu
  vim.keymap.set("n", "<ESC>", function()
    M.close_float(buf, float)
  end, { buffer = buf, silent = true })

  vim.keymap.set("n", "q", function()
    M.close_float(buf, float)
  end, { buffer = buf, silent = true })

  vim.keymap.set("n", "<CR>", function()
    -- Get cursor line number while in the float window
    local line_number = vim.api.nvim_win_get_cursor(0)[1]

    -- Close the floating window before pasting
    M.close_float(buf, float)

    -- Paste the selected register
    utils.paste_from_register_by_menu_selection(line_number, opts)
  end, { buffer = buf, silent = true })
end

return M

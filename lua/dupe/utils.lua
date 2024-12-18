local M = {}

M.registers = {
  '"',
  "0",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "a",
  "b",
  "c",
  "d",
  "e",
  "f",
  "g",
  "h",
  "i",
  "j",
  "k",
  "l",
  "m",
  "n",
  "o",
  "p",
  "q",
  "r",
  "s",
  "t",
  "u",
  "v",
  "w",
  "x",
  "y",
  "z",
  "-",
}

M.format_line = function(line)
  -- Remove all whitespace at the start
  local whitespace_removed = string.gsub(line, "^%s+", "")
  -- Remove all new lines
  local trimmed = string.gsub(whitespace_removed, "[\r\n^J]", " ")
  return trimmed
end

M.delete_range = function()
  -- Get positions so we know what to delete
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  local start_line = start_pos[2]
  local start_col = start_pos[3]
  local end_line = end_pos[2]
  local end_col = end_pos[3]

  -- Adjust for 0-based indexing
  start_line = start_line - 1
  start_col = start_col - 1
  end_line = end_line - 1
  end_col = end_col

  local buf = vim.api.nvim_get_current_buf()
  local mode = vim.fn.visualmode()
  -- Check if the selection is linewise
  -- We need to delete differently based on linewise or characterwise
  if mode == "V" then
    -- Linewise deletion (like dd)
    vim.api.nvim_buf_set_lines(buf, start_line, end_line + 1, false, {})
  else
    -- Characterwise deletion
    vim.api.nvim_buf_set_text(buf, start_line, start_col, end_line, end_col, {})
  end
end

M.paste_from_register_by_menu_selection = function(line_number, opts)
  -- If called in visual mode there will be a range selection
  if opts.range > 0 then
    -- We want to delete the range first before pasting
    M.delete_range()
  end

  local reg
  for i, value in ipairs(M.registers) do
    if i == line_number then
      reg = value
    end
  end
  -- using capital P to paste before cursor
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('"' .. reg .. "P", true, true, true), "n", true)
end

return M

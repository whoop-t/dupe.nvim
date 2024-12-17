---@class CustomModule
local M = {}

M.get_line_delete_registers = function()
  local regs = {}
  for i = 1, 9 do
    -- Get contents of register
    local contents = vim.fn.getreg(tostring(i))
    -- Remove all whitespace at the start
    local whitespace_removed = string.gsub(contents, "^%s+", "")
    -- Remove all new lines
    local trimmed = string.gsub(whitespace_removed, "[\r\n^J]", " ")
    table.insert(regs, trimmed)
  end

  return regs
end

return M

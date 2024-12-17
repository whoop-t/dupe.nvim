---@class CustomModule
local M = {}

M.get_one_through_nine_regs = function()
  local regs = {}
  for i = 1, 9 do
    -- Get contents of register
    local contents = vim.fn.getreg(tostring(i))
    -- Remove all whitespace at the start
    -- local whitespace_removed = string.gsub(contents, "^%s+", "")
    -- Remove all new lines
    local trimmed = string.gsub(contents, "[\r\n^J]", " ")
    if trimmed ~= "" then
      table.insert(regs, trimmed)
    end
  end

  return regs
end

return M

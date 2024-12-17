local utils = require("dupe.utils")

---@class CustomModule
local M = {}

M.get_all_registers = function()
  local regs = {}
  for _, value in ipairs(utils.registers) do
    -- Get contents of register and format it to look better in the menu
    local line = utils.format_line(vim.fn.getreg(value))

    table.insert(regs, line)
  end

  return regs
end

M.clear_all_registers = function()
  for _, reg in ipairs(utils.registers) do
    vim.fn.setreg(reg, "")
  end
end

return M

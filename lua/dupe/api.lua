local utils = require("dupe.utils")

---@class CustomModule
local M = {}

M.get_all_registers = function(config)
  local regs = {}
  for _, value in ipairs(utils.registers) do
    -- Get contents of register and format it to look better in the menu
    local line = utils.format_line(vim.fn.getreg(value), value)

    -- Add columns to menu
    if config.show_register_names then
      line = string.format('"%s  %s', value, line)
    end

    table.insert(regs, line)
  end

  return regs
end

return M

local utils = require("dupe.utils")

---@class CustomModule
local M = {}

local all_registers_length = 35

M.get_all_registers = function()
  local regs = {}
  for i = 1, all_registers_length do
    -- Get contents of register
    local contents
    if i <= 9 then
      contents = vim.fn.getreg(tostring(i))
    else
      local ascii = i + utils.string_byte_offset
      contents = vim.fn.getreg(string.char(ascii))
    end
    local line = utils.format_line(contents)

    table.insert(regs, line)
  end

  return regs
end

M.get_line_delete_registers = function()
  local regs = {}
  for i = 1, 9 do
    -- Get contents of register
    local contents = vim.fn.getreg(tostring(i))

    local line = utils.format_line(contents)
    table.insert(regs, line)
  end

  return regs
end

M.clear_all_registers = function()
  for _, reg in ipairs({
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
    "*",
  }) do
    vim.fn.setreg(reg, "")
  end
end

return M

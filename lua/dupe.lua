-- main module file
local ui = require("dupe.ui")
local api = require("dupe.api")

---@class Config
---@field opt string Your config option
local config = {
  show_line_numbers = false,
  show_register_names = true
}

local M = {}

---@type Config
M.config = config

---@param args Config?
-- you can define your setup function here. Usually configurations can be merged, accepting outside params and
-- you can also put some validation here for those.
M.setup = function(args)
  M.config = vim.tbl_deep_extend("force", M.config, args or {})
end

M.show_all_registers = function(opts)
  local regs = api.get_all_registers(M.config)
  return ui.create_float_window(regs, opts, M.config)
end

return M

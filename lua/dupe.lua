-- main module file
local ui = require("dupe.ui")
local api = require("dupe.api")

---@class Config
---@field opt string Your config option
local config = {
}

---@class
local M = {}

---@type Config
M.config = config

---@param args Config?
-- you can define your setup function here. Usually configurations can be merged, accepting outside params and
-- you can also put some validation here for those.
M.setup = function(args)
  M.config = vim.tbl_deep_extend("force", M.config, args or {})
end

M.show_line_delete_registers = function()
  local lines = api.get_line_delete_registers()
  return ui.create_float_window(lines)
end

return M

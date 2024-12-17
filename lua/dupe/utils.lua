local M = {}

M.string_byte_offset = 87

M.format_line = function(line)
  -- Remove all whitespace at the start
  local whitespace_removed = string.gsub(line, "^%s+", "")
  -- Remove all new lines
  local trimmed = string.gsub(whitespace_removed, "[\r\n^J]", " ")
  return trimmed
end

return M

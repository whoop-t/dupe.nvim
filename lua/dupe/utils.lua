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

return M

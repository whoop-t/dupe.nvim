vim.api.nvim_create_user_command("DupeShowAll", function(opts)
  require("dupe").show_all_registers(opts)
end, { range = true })
vim.api.nvim_create_user_command("DupeClearAll", require("dupe").clear_all_registers, {})

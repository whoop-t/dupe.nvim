vim.api.nvim_create_user_command("DupeShowAll", require("dupe").show_all_registers, {})
vim.api.nvim_create_user_command("DupeShowLineDeletes", require("dupe").show_line_delete_registers, {})
vim.api.nvim_create_user_command("DupeClearAll", require("dupe").clear_all_registers, {})

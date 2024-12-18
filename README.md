# dupe.nvim

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/ellisonleao/nvim-plugin-template/lint-test.yml?branch=main&style=for-the-badge)
![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)

Delete and yank register menus for neovim.

> **Note:** This is in active development and subject to change.

![demo](https://github.com/user-attachments/assets/c460ae24-00da-49dd-a88f-ee15eb61b9c8)

## Install
```lua
-- lazy
{
  "whoop-t/dupe.nvim",
  keys = {
    { "<leader>p", ":DupeShowAll<CR>", mode = {"n", "v"}, desc = "Dupe Show Menu" },
  },
}
```

## Keymaps
```lua
-- lazy
  keys = {
    { "<leader>p", ":DupeShowAll<CR>", mode = {"n", "v"}, desc = "Dupe Show Menu" },
  }

-- nvim
vim.keymap.set({'n', 'v'}, '<leader>p', ":DupeShowAll<CR>", { desc = "Dupe Show Menu" })
```

## Commands
```lua
-- Show all registers and their contents
-- On selection, paste the contents
:DupeShowAll
```

## How it works
You can open the menu and select a register to paste from in normal mode and it will paste like using the "p"

It also works with visual selection modes and will paste over whatever is visually selected

## TODO

- [x] 1. Allow for range pasting(delete range and then paste from selected register)
- [ ] 2. Expose command or autocommand to allow user to select register to yank too(delete? change?)
- [ ] 3. Expose option to auto back up of all deletes/yanks to a-z registers
    - line deletes are auto saved in 1-9 registers
    - line yanks, small yanks and small deletes are only stored in the unnamed/0 buffer by default
        - small = word sized yanks/deletes(yw, yiw, etc)

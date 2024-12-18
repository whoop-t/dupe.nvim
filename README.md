# dupe.nvim

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/ellisonleao/nvim-plugin-template/lint-test.yml?branch=main&style=for-the-badge)
![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)

Delete and yank register menus for neovim.

> **Note:** This is in active development and subject to change.

## Install
```lua
-- lazy
{
  "whoop-t/dupe.nvim",
  opts = {}
}
```

## Commands
```lua
-- Show all registers and their contents
:DupeShowAll
    
-- Clear all registers
:DupeClearAll
```

## Uses
You can open the menu and select a register to paste from in normal mode
It also works with visual selection modes and will paste over whatever is visually selected

## TODO

- [x] 1. Allow for range pasting(delete range and then paste from selected register)
- [ ] 2. Expose command or autocommand to allow user to select register to yank too(delete? change?)
- [ ] 3. Expose option to auto back up of all deletes/yanks to a-z registers
    - line deletes are auto saved in 1-9 registers
    - line yanks, small yanks and small deletes are only stored in the unnamed/0 buffer by default
        - small = word sized yanks/deletes(yw, yiw, etc)

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- Zen master movement
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
map("n", "n", "nzzzv", { desc = "Next search result centered" })
map("n", "N", "Nzzzv", { desc = "Previous search result centered" })

-- Stay in visual mode when indenting
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Move lines up and down
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Clear search highlights
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- Better paste (don't yank replaced text)
map("x", "p", [["_dP]], { desc = "Paste without yanking" })

-- Folder view (like VS Code sidebar)
map("n", "<leader>b", "<cmd>Neotree toggle<cr>", { desc = "Toggle folder view" })

-- Fuzzy find files (git files only)
map("n", "<C-p>", function() Snacks.picker.git_files() end, { desc = "Find files (git)" })

-- Toggle autocomplete
vim.g.cmp_enabled = true
map("n", "<leader>ua", function()
  vim.g.cmp_enabled = not vim.g.cmp_enabled
  if vim.g.cmp_enabled then
    vim.notify("Autocomplete enabled")
  else
    vim.notify("Autocomplete disabled")
  end
end, { desc = "Toggle autocomplete" })

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Best remap ever
map("x", "<leader>p", '"_dP', { desc = "Paste without losing" })

-- Move code blocks with proper indention
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move code blocks down " })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move code blocks up " })

-- Move half a page down without sacrifising the visibility
map("n", "<C-d>", "<C-d>zz", { desc = "Move half a page down " })
map("n", "<C-u>", "<C-u>zz", { desc = "Move half a page up " })

-- Vim harpoon
map("n", "<leader>lh", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', {
  desc = "List the vim harpoon files",
})
map("n", "<leader>ah", ':lua require("harpoon.mark").add_file()<CR>', {
  desc = "Add a file to the harpoon list",
})
map("n", "<C-k>", ':lua require("harpoon.ui").nav_next()<CR>', {
  desc = "Switch between files in the harpoon list foward",
})
map("n", "<C-j>", ':lua require("harpoon.ui").nav_prev()<CR>', {
  desc = "Switch between files in the harpoon list backward",
})

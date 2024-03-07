local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    ["<leader>ff"] = "",
    ["<leader>fw"] = "",
  },
}

-- Your custom mappings
M.general = {
  n = {
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
  },
}

return M

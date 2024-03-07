local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    ["<leader>ff"] = "",
    ["<leader>fw"] = "",
    ["<leader>/"] = "",
  },
}

-- Your custom mappings
M.general = {
  n = {
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>ff"] = { "<cmd> Telescope live_grep follow=true no_ignore=true hidden=true <CR>", "Find all" },
  },
}

M.Remote = {
  n = {
    ["<leader>rc"] = { "<cmd> RemoteSSHFSConnect<CR>", "Remote Connect" },
    ["<leader>re"] = { "<cmd> RemoteSSHFSEdit<CR>", "Edit SSH Config" },
    ["<leader>rd"] = { "<cmd> RemoteSSHFSDisconnect<CR>", "Disconnect Remote Connection" },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<C-_>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<C-_>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

return M

require "nvchad.mappings"
local map = vim.keymap.set

-- General mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map({ "i", "n", "v" }, "<C-c>", "<Esc>", { desc = "Overridden escape" })

-- Telescope
map("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Telescope Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep <cr>", { desc = "Telescope Find files" })
map("n", "<C-o>", "o <Esc>", { desc = "NewLine" })

-- Comments
map("n", "<C-_>", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Comment line" })

map(
  "v",
  "<C-_>",
  "<Esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Comment line in Visual Mode" }
)

-- Python helpers
map("n", "<C-b>", function()
  vim.api.nvim_put({ "import pdb; pdb.set_trace()" }, "", true, true)
end, { desc = "Python Breakpoint" })

-- Copilot
map(
  "i",
  "<C-j>",
  'copilot#Accept("\\<CR>")',
  { desc = "Use copilot", remap = false, expr = true, replace_keycodes = false }
)

vim.g.copilot_no_tab_map = true

map("n", "<leader>ccq", function()
  local input = vim.fn.input "Quick Chat: "
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end, { desc = "CopilotChat - Quick chat" })

map("n", "<leader>cc", "<cmd>:CopilotChatToggle<cr>", { desc = "CopilotChat - Toggle" })

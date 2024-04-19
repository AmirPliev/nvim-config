local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    markdown = { "prettier" },
    python = { "black" },
    rust = { "rustfmt" },
    typescriptreact = { "prettier" },
    javascriptreact = { "prettier" },
    shell = { "shfmt" },
    bash = { "shfmt" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)

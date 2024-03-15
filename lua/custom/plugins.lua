local plugins = {

	{
		"github/copilot.vim",
		lazy = false,
	},

	{
		"nosduco/remote-sshfs.nvim",
		lazy = false,
		config = function()
			require("remote-sshfs").setup({
				mounts = {
					unmount_on_exit = true, -- run sshfs as foreground, will unmount on vim exit
				},

				handlers = {
					on_disconnect = {
						clean_mount_folders = false, -- remove mount point folder on disconnect/unmount
					},
				},

				ui = {
					confirm = {
						connect = false, -- prompt y/n when host is selected to connect to
					},
				},
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		-- Everything in opts will be passed to setup()
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				svelte = { { "prettierd", "prettier" } },
			},
			-- Set up format-on-save
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
			-- Customize formatters
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				-- defaults
				"vim",
				"lua",

				-- web dev
				"html",
				"css",
				"javascript",
				"typescript",
				"svelte",
				"tsx",
				"json",
				-- "vue", "svelte",

				-- low level
				"c",
				"zig",
				"rust",
				"python",
			},
		},
	},

	-- In order to modify the `lspconfig` configuration:
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},

	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {
			automatic_installation = true,
			ensure_installed = {
				"lua-language-server",
				"html-lsp",
				"pyright",
				"prettier",
				"stylua",
				"black",
				"flake8",
				"mypy",
				"isort",
				"deno",
				"eslint_d",
				"svelte-language-server",
			},
		},
	},
}

return plugins

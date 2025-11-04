-- Autoformat
return {
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = false,
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters = {
			biome = {
				require_cwd = true,
			},
			prettier = {
				require_cwd = true,
			},
		},
		formatters_by_ft = {
			javascript = { "biome", "prettier" },
			javascriptreact = { "biome", "prettier" },
			typescript = { "biome", "prettier" },
			typescriptreact = { "biome", "prettier" },
			json = { "biome", "prettier" },
			lua = { "stylua" },
		},
	},
}

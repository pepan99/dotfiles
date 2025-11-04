-- Which-key for keybind hints
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		delay = 200, -- delay before which-key pops up (ms)
		icons = {
			mappings = vim.g.have_nerd_font,
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		-- Document existing key chains
		wk.add({
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>g", group = "[G]it" },
			{ "<leader>t", group = "[T]est (.NET)" },
			{ "<leader>d", group = "[D]otnet/Debug" },
			{ "<leader>f", group = "[F]ind" },
			{ "<leader>u", group = "[U]I toggles" },
			{ "<leader>e", group = "[E]xplorer" },
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>w", group = "[W]orkspace" },
		})
	end,
}

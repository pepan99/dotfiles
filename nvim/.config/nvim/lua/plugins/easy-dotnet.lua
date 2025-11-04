return {
	"GustavEikaas/easy-dotnet.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		local function get_secret_path(secret_guid)
			local path = ""
			local home_dir = vim.fn.expand("~")
			if require("easy-dotnet.extensions").isWindows() then
				local secret_path = home_dir
					.. "\\AppData\\Roaming\\Microsoft\\UserSecrets\\"
					.. secret_guid
					.. "\\secrets.json"
				path = secret_path
			else
				local secret_path = home_dir .. "/.microsoft/usersecrets/" .. secret_guid .. "/secrets.json"
				path = secret_path
			end
			return path
		end

		local dotnet = require("easy-dotnet")
		dotnet.setup({
			lsp = {
				enabled = true,
				roslynator_enabled = true,
				analyzer_assemblies = {},
				config = {},
			},
			debugger = {
				bin_path = nil,
				auto_register_dap = true,
				mappings = {
					-- Fixed: Changed from "T" to avoid conflicts
					open_variable_viewer = { lhs = "<leader>dv", desc = "[D]ebugger [V]ariable viewer" },
				},
			},
			test_runner = {
				viewmode = "float",
				vsplit_width = nil,
				vsplit_pos = nil,
				enable_buffer_test_execution = true,
				noBuild = true,
				icons = {
					passed = "",
					skipped = "",
					failed = "",
					success = "",
					reload = "",
					test = "",
					sln = "󰘐",
					project = "󰘐",
					dir = "",
					package = "",
				},
				mappings = {
					-- All test mappings now use <leader>t prefix to avoid conflicts
					run_test_from_buffer = { lhs = "<leader>tr", desc = "[T]est [R]un from buffer" },
					peek_stack_trace_from_buffer = { lhs = "<leader>tp", desc = "[T]est [P]eek stack trace" },
					filter_failed_tests = { lhs = "<leader>tf", desc = "[T]est [F]ilter failed" },
					debug_test = { lhs = "<leader>td", desc = "[T]est [D]ebug" },
					go_to_file = { lhs = "g", desc = "go to file" },
					run_all = { lhs = "<leader>tR", desc = "[T]est [R]un all" },
					run = { lhs = "<leader>tr", desc = "[T]est [R]un" },
					peek_stacktrace = { lhs = "<leader>tp", desc = "[T]est [P]eek stacktrace" },
					expand = { lhs = "o", desc = "expand" },
					expand_node = { lhs = "E", desc = "expand node" },
					-- Fixed: Changed from "-" to "=" to avoid conflict with Oil
					expand_all = { lhs = "=", desc = "expand all" },
					collapse_all = { lhs = "W", desc = "collapse all" },
					close = { lhs = "q", desc = "close testrunner" },
					refresh_testrunner = { lhs = "<C-r>", desc = "refresh testrunner" },
				},
				additional_args = {},
			},
			new = {
				project = {
					prefix = "sln",
				},
			},
			terminal = function(path, action, args)
				args = args or ""
				local commands = {
					run = function()
						return string.format("dotnet run --project %s %s", path, args)
					end,
					test = function()
						return string.format("dotnet test %s %s", path, args)
					end,
					restore = function()
						return string.format("dotnet restore %s %s", path, args)
					end,
					build = function()
						return string.format("dotnet build %s %s", path, args)
					end,
					watch = function()
						return string.format("dotnet watch --project %s %s", path, args)
					end,
				}
				local command = commands[action]()
				if require("easy-dotnet.extensions").isWindows() == true then
					command = command .. "\r"
				end
				vim.cmd("vsplit")
				vim.cmd("term " .. command)
			end,
			secrets = {
				path = get_secret_path,
			},
			csproj_mappings = true,
			fsproj_mappings = true,
			auto_bootstrap_namespace = {
				type = "block_scoped",
				enabled = true,
				use_clipboard_json = {
					behavior = "prompt",
					register = "+",
				},
			},
			server = {
				log_level = nil,
			},
			picker = "telescope",
			background_scanning = true,
			notifications = {
				handler = function(start_event)
					local spinner = require("easy-dotnet.ui-modules.spinner").new()
					spinner:start_spinner(start_event.job.name)
					return function(finished_event)
						spinner:stop_spinner(finished_event.result.msg, finished_event.result.level)
					end
				end,
			},
			diagnostics = {
				default_severity = "error",
				setqflist = false,
			},
		})

		-- Commands
		vim.api.nvim_create_user_command("Secrets", function()
			dotnet.secrets()
		end, {})

		-- Keybindings - Fixed: Changed from <C-p> to <leader>dr to avoid conflict with Telescope
		vim.keymap.set("n", "<leader>dr", function()
			dotnet.run_project()
		end, { desc = "[D]otnet [R]un project" })

		-- Additional helpful keybindings
		vim.keymap.set("n", "<leader>db", function()
			dotnet.build()
		end, { desc = "[D]otnet [B]uild" })

		vim.keymap.set("n", "<leader>dt", function()
			dotnet.test()
		end, { desc = "[D]otnet [T]est" })
	end,
}

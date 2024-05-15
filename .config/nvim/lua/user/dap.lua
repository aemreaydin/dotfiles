local M = {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text" },
}

M.config = function()
	local dap = require("dap")
	local dapui = require("dapui")
	local wk = require("which-key")

	local function get_args(config)
		local args = type(config.args) == "function" and (config.args() or {}) or config.args or {}
		config = vim.deepcopy(config)
		---@cast args string[]
		config.args = function()
			local new_args = vim.fn.input("Run with args: ", table.concat(args, " ")) --[[@as string]]
			return vim.split(vim.fn.expand(new_args) --[[@as string]], " ")
		end
		return config
	end
	wk.register({
		["<leader>du"] = {
			function() dapui.toggle({}) end,
			"Dap UI",
		},
		["<leader>de"] = {
			function() dapui.eval() end,
			"Eval",
			mode = { "n", "v" },
		},
		["<leader>dB"] = {
			function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
			"Breakpoint Condition",
		},
		["<leader>db"] = {
			function() dap.toggle_breakpoint() end,
			"Toggle Breakpoint",
		},
		["<leader>dc"] = {
			function() dap.continue() end,
			"Continue",
		},
		["<leader>da"] = {
			function() dap.continue({ before = get_args }) end,
			"Run with Args",
		},
		["<leader>dC"] = {
			function() dap.run_to_cursor() end,
			"Run to Cursor",
		},
		["<leader>dg"] = {
			function() dap.goto_() end,
			"Go to Line (No Execute)",
		},
		["<leader>di"] = {
			function() dap.step_into() end,
			"Step Into",
		},
		["<leader>dj"] = {
			function() dap.down() end,
			"Down",
		},
		["<leader>dk"] = {
			function() dap.up() end,
			"Up",
		},
		["<leader>dl"] = {
			function() dap.run_last() end,
			"Run Last",
		},
		["<leader>do"] = {
			function() dap.step_out() end,
			"Step Out",
		},
		["<leader>dO"] = {
			function() dap.step_over() end,
			"Step Over",
		},
		["<leader>dp"] = {
			function() dap.pause() end,
			"Pause",
		},
		["<leader>dr"] = {
			function() dap.repl.toggle() end,
			"Toggle REPL",
		},
		["<leader>dR"] = {
			function() dap.clear_breakpoints() end,
			"Clear All Breakpoints",
		},
		["<leader>ds"] = {
			function() dap.session() end,
			"Session",
		},
		["<leader>dt"] = {
			function() dap.terminate() end,
			"Terminate",
		},
		["<leader>dw"] = {
			function() require("dap.ui.widgets").hover() end,
			"Widgets",
		},
	})
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	dap.adapters = {
		lldb = {
			type = "executable",
			command = "lldb-dap",
			name = "lldb",
		},
	}
	dap.configurations = {
		cpp = {
			{
				name = "Launch",
				type = "lldb",
				request = "launch",
				program = function()
					return coroutine.create(function(coro)
						local opts = {}
						pickers
							.new(opts, {
								prompt_title = "Path to executable",
								finder = finders.new_oneshot_job(
									{ "fd", "--no-ignore", "--type", "x", "--exclude", "CMakeFiles" },
									{}
								),
								sorter = conf.generic_sorter(opts),
								attach_mappings = function(buffer_number)
									actions.select_default:replace(function()
										actions.close(buffer_number)
										coroutine.resume(coro, action_state.get_selected_entry()[1])
									end)
									return true
								end,
							})
							:find()
					end)
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		},
	}
	dapui.setup({})
	dap.listeners.before.attach.dapui_config = function() dapui.open() end
	dap.listeners.before.launch.dapui_config = function() dapui.open() end
	dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
	dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
	require("nvim-dap-virtual-text").setup()
end

return M

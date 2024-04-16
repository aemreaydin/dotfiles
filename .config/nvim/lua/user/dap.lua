local M = {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
}

M.config = function()
	local dap = require("dap")
	local dapui = require("dapui")
	local wk = require("which-key")
	wk.register({
		d = {
			name = "Dap",
			t = {
				function()
					dapui.toggle()
				end,
				"Toggle UI",
			},
			b = { "<cmd>DapToggleBreakpoint<cr>", "Toggle Breakpoint" },
			c = { "<cmd>DapContinue<cr>", "Continue" },
			s = { "<cmd>DapStepOver<cr>", "Step Over" },
			i = { "<cmd>DapStepInto<cr>", "Step Into" },
			o = { "<cmd>DapStepOut<cr>", "Step Out" },
			r = {
				function()
					dapui.open({ reset = true })
				end,
				"Reset UI",
			},
			C = {
				function()
					dap.clear_breakpoints()
					require("notify")("Breakpoints cleared", "warn")
				end,
				"Clear All Breakpoints",
			},
			T = {
				function()
					dapui.toggle({})
					dap.terminate()
					require("notify")("Debugger session ended", "warn")
				end,
				"Terminate Debugger",
			},
		},
	}, { prefix = "<leader>" })
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	dap.adapters = {
		lldb = {
			type = "executable",
			command = "lldb-vscode",
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
								finder = finders.new_oneshot_job({ "fd", "--no-ignore", "--type", "x" }, {}),
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
	dap.listeners.before.attach.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
	end
	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
	end

	local api = vim.api
	local keymap_restore = {}
	dap.listeners.after["event_initialized"]["me"] = function()
		for _, buf in pairs(api.nvim_list_bufs()) do
			local keymaps = api.nvim_buf_get_keymap(buf, "n")
			for _, keymap in pairs(keymaps) do
				if keymap.lhs == "K" then
					table.insert(keymap_restore, keymap)
					api.nvim_buf_del_keymap(buf, "n", "K")
				end
			end
		end
		api.nvim_set_keymap("n", "K", '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { silent = true })
	end

	dap.listeners.after["event_terminated"]["me"] = function()
		for _, keymap in pairs(keymap_restore) do
			api.nvim_buf_set_keymap(keymap.buffer, keymap.mode, keymap.lhs, keymap.rhs, { silent = keymap.silent == 1 })
		end
		keymap_restore = {}
	end
end

return M

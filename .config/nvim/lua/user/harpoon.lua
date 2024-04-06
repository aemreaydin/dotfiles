local M = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
}

M.config = function()
	local harpoon = require("harpoon")
	local wk = require("which-key")

	harpoon.setup({})

	local conf = require("telescope.config").values
	local function toggle_telescope(harpoon_files)
		local file_paths = {}
		for _, item in ipairs(harpoon_files.items) do
			table.insert(file_paths, item.value)
		end

		require("telescope.pickers")
			.new({}, {
				prompt_title = "Harpoon",
				finder = require("telescope.finders").new_table({
					results = file_paths,
				}),
				previewer = conf.file_previewer({}),
				sorter = conf.generic_sorter({}),
			})
			:find()
	end
	wk.register({
		h = {
			name = "Harpoon",
			a = {
				function()
					harpoon:list():add()
				end,
				"Add To Harpoon",
			},
			d = {
				function()
					harpoon:list():remove()
					vim.api.nvim_buf_delete(0, {})
				end,
				"Remove From Harpoon",
			},
			s = {
				function()
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				"List",
			},
			t = {
				function()
					toggle_telescope(harpoon:list())
				end,
				"Telescope List",
			},
		},
		["1"] = {
			function()
				harpoon:list():select(1)
			end,
			"1st Harpoon",
		},
		["2"] = {
			function()
				harpoon:list():select(2)
			end,
			"2nd Harpoon",
		},
		["3"] = {
			function()
				harpoon:list():select(3)
			end,
			"3rd Harpoon",
		},
		["4"] = {
			function()
				harpoon:list():select(4)
			end,
			"4th Harpoon",
		},
		["["] = {
			function()
				harpoon:list():prev()
			end,
			"Prev Harpoon",
		},
		["]"] = {
			function()
				harpoon:list():next()
			end,
			"Next Harpoon",
		},
	}, { prefix = "<leader>" })
end

return M

local buffer = {}

-- Big thanks to telescope!!!
buffer.get_loaded_buffers = function()
	local Path = require("plenary.path")
	local function buf_in_cwd(bufname, cwd)
		if cwd:sub(-1) ~= Path.path.sep then
			cwd = cwd .. Path.path.sep
		end
		local bufname_prefix = bufname:sub(1, #cwd)
		return bufname_prefix == cwd
	end
	return vim.tbl_filter(function(bufnr)
		if 1 ~= vim.fn.buflisted(bufnr) then
			return false
		end
		if not vim.api.nvim_buf_is_loaded(bufnr) then
			return false
		end
		local bufname = vim.api.nvim_buf_get_name(bufnr)
		if not buf_in_cwd(bufname, vim.loop.cwd()) then
			return false
		end
		return true
	end, vim.api.nvim_list_bufs())
end

buffer.delete_buffer_and_window_if_last = function()
	local function is_split_window()
		local win_count = #vim.api.nvim_tabpage_list_wins(0)
		return win_count > 1
	end

	vim.cmd("Bdelete")
	local loaded_buffers = buffer.get_loaded_buffers()
	if #loaded_buffers == 1 and is_split_window() then
		vim.api.nvim_command("close")
	elseif #loaded_buffers == 0 then
		vim.cmd("q")
	end
end

buffer.prev_on_original_buffer_on_split = function()
	local curr_buf = vim.api.nvim_get_current_buf()
	vim.cmd("bprev")
	vim.cmd("vsplit #" .. curr_buf)
end

return buffer

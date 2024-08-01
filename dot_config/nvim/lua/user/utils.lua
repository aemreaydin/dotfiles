local utils = {}

utils.is_no_name_buf = function(buf)
	return vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf) == ""
end

return utils

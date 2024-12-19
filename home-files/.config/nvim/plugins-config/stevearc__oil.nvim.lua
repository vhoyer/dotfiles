require("oil").setup()

if (vim.fn.has('win32')) then
	vim.keymap.set('n', '<leader>n', '<CMD>Oil<CR>', {
			noremap = true,
		})
end

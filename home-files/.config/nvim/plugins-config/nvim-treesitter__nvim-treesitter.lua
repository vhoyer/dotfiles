-- idk bro, this entire file seems to do absolutely nothing :D
require('nvim-treesitter').setup({
	ensure_installed = { 'gdscript', 'gdshader', 'godot_resource' },
	highlight = {
		enabled = true,
	},
})


local augroup = vim.api.nvim_create_augroup('TreeSitterFiletypeGroup', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
	pattern = {
		'*.godot',
		'*.gshader',
		'*.tres',
		'*.tscn',
	},
	callback = function() vim.treesitter.start() end,
	group = augroup,
	desc = 'Enable highlighting through neovim using treesitter'
})

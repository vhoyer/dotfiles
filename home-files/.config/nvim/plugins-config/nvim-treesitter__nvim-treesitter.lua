require('nvim-treesitter').setup({})

local augroup = vim.api.nvim_create_augroup('TreeSitterFiletypeGroup', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
	pattern = {
		'gdscript',
		'gdshader',
		'gdresource',
	},
	callback = function() vim.treesitter.start() end,
	group = augroup,
	desc = 'Enable highlighting through neovim using treesitter'
})

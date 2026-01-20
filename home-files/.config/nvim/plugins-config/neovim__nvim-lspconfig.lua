local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.eslint.setup({
	capabilities = capabilities,
	---@diagnostic disable-next-line: unused-local
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
})

lspconfig.stylelint_lsp.setup({
	capabilities = capabilities,
	filetypes = { "css", "less", "scss", "sugarss", "vue", "wxss", "javascriptreact", "typescriptreact" },
	settings = {
		stylelintplus = {
			autoFixOnFormat = true,
			autoFixOnSave = true,
		},
	},
})

local vue_language_server_path = vim.fn.expand('$MASON/packages/vue-language-server/node_modules/@vue/language-server')

lspconfig.ts_ls.setup({
	capabilities = capabilities,
	init_options = {
		plugins = {
			{
				name = '@vue/typescript-plugin',
				location = vue_language_server_path,
				languages = { 'vue' },
			},
		},
	},
	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})

lspconfig.volar.setup({
	capabilities = capabilities,
})

lspconfig.vimls.setup({
	capabilities = capabilities,
})

-- lspconfig.bashls.setup({
-- 	capabilities = capabilities,
-- })

lspconfig.dockerls.setup({
	capabilities = capabilities,
})

lspconfig.docker_compose_language_service.setup({
	capabilities = capabilities,
})

lspconfig.cssls.setup({
	capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
	capabilities = capabilities,
})

lspconfig.gdscript.setup({
	name = 'Godot',
	cmd = {'ncat.exe', '127.0.0.1', '6005'},
	-- cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
	root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
	capabilities = capabilities,
})

lspconfig.gdshader_lsp.setup({
	capabilities = capabilities,
})

-- Global mappings.
vim.keymap.set('n', ',R', ':LspRestart<CR>')
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', ',e', vim.diagnostic.open_float)
vim.keymap.set('n', '[e', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']e', vim.diagnostic.goto_next)
vim.keymap.set('n', ',q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set({ 'n', 'v' }, ',f', vim.lsp.buf.code_action, opts)

		vim.keymap.set('n', ',=', function()
			vim.lsp.buf.format { async = true }
		end, opts)

		vim.keymap.set('n', ',d', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', ',D', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', ',t', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', ',i', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', ',r', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)

		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
	end,
})

-- use undercurl instead of underline for diagnostics
vim.cmd [[
hi DiagnosticUnderlineError gui=undercurl
hi DiagnosticUnderlineWarn gui=undercurl
]]

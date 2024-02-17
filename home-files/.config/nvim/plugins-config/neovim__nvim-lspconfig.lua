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
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
			client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = 'LuaJIT'
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME
							-- "${3rd}/luv/library"
							-- "${3rd}/busted/library",
						}
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						-- library = vim.api.nvim_get_runtime_file("", true)
					}
				}
			})

			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
		return true
	end
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

lspconfig.tsserver.setup({
	capabilities = capabilities,
})

lspconfig.volar.setup({
	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
})

lspconfig.vimls.setup({
	capabilities = capabilities,
})

lspconfig.bashls.setup({
	capabilities = capabilities,
})

lspconfig.dockerls.setup({
	capabilities = capabilities,
})

lspconfig.docker_compose_language_service.setup({
	capabilities = capabilities,
})

-- Global mappings.
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

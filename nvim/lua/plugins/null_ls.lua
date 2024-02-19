local null_ls = require("null-ls")
local command_resolver = require("null-ls.helpers.command_resolver")

local format = null_ls.builtins.formatting
local diag = null_ls.builtins.diagnostics

local is_pnp = vim.fn.findfile(".pnp.cjs", ".")
local is_yarn = vim.fn.findfile("yarn.lock", ".")
local is_npm = vim.fn.findfile("package-lock.json", ".")

local with_dynamic_command = function(source)
	if is_yarn and is_pnp then
		return source.with({
			dynamic_command = command_resolver.from_yarn_pnp(),
		})
	end

	if is_npm or is_yarn then
		return source.with({
			dynamic_command = command_resolver.from_node_modules(),
		})
	end

	return source
end

null_ls.setup({
	debug = true,
	sources = {
		format.prettier,
		format.black,
		format.stylua,
		format.isort,
        format.npm_groovy_lint,
		diag.flake8,
		with_dynamic_command(diag.eslint),
		null_ls.builtins.completion.spell,
	},
})

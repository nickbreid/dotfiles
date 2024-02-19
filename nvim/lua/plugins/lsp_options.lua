local utils = require("utils")

local M = {}

M.eslint = {
	root_dir = require("lspconfig").util.root_pattern("package.json"),
	settings = { nodePath = "/Users/nick.reid/dev/fender/.yarn/sdks" },
}

M.pyright = {
	commands = {
		PyrightOrganizeImports = {
			utils.py_organize_imports,
			description = "Organize Imports",
		},
	},
	settings = {
		pyright = {
			disableOrganizeImports = false,
			disableLanguageServices = false,
			verboseOutput = true,
		},
		python = {},
	},
}

M.tsserver = {
	commands = {
		OrganizeImports = {
			utils.ts_organize_imports,
			description = "Organize Imports",
		},
	},
}

return M

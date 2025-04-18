local null_ls = require("null-ls")

local opts = {
	sources = {
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.diagnostics.mypy,
		null_ls.builtins.diagnostics.ruff,
		null_ls.builtins.diagnostics.flake8,
		null_ls.builtins.diagnostics.clang_tidy,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.diagnostics.clippy,
	},
}
return opts

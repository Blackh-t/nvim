require("core.options")
require("core.keymaps")
--require("core.snippets")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	require("plugins.neotree"),
	require("plugins.colortheme2"),
	require("plugins.bufferline"),
	require("plugins.treesitter"),
	require("plugins.lualine"),
	require("plugins.telescore"),
	require("plugins.lsp"),
	require("plugins.autocompletion"),
	require("plugins.gitsigns"),
	require("plugins.alpha"),
	require("plugins.none-ls"),
	require("plugins.misc"),
	require("plugins.indent-blankline"),
	require("plugins.flutter"),
	require("plugins.rustfm"),
	require("plugins.treesitter-context"),
	require("plugins.tiny-dianostic"),
})

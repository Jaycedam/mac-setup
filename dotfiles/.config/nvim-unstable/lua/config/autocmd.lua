-- native LSP completion
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

-- -- Auto-reload theme when it changes
-- local function setup_dynamic_colors()
-- 	vim.api.nvim_create_augroup("DynamicColors", { clear = true })
-- 	vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
-- 		group = "DynamicColors",
-- 		callback = function()
-- 			local file = vim.fn.expand("~/.config/nvim/lua/config/options.lua")
-- 			if vim.fn.filereadable(file) == 1 then
-- 				local current_mtime = vim.fn.getftime(file)
-- 				local last_mtime = vim.g.dynamic_colors_mtime or -1
-- 				if current_mtime > last_mtime then
-- 					vim.cmd("luafile " .. file)
-- 					vim.g.dynamic_colors_mtime = current_mtime
-- 				end
-- 			end
-- 		end,
-- 	})
--
-- 	vim.o.autoread = true
-- end
--
-- setup_dynamic_colors()

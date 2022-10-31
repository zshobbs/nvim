local cmp_status_ok, cmp = pcall(require, "copilot")
if not cmp_status_ok then
  return
end

-- using this table and only enable for a few filetypes
vim.g.copilot_filetypes = { ["*"] = false, python = true }

-- imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")
-- vim.g.copilot_no_tab_map = true
-- vim.keymap.set.keymap("i", "<C-a>", "copilot#Accept('\\<CR>')<CR>", { silent = true })

-- <C-]>                   Dismiss the current suggestion.
-- <Plug>(copilot-dismiss)
--
--                                                 *copilot-i_ALT-]*
-- <M-]>                   Cycle to the next suggestion, if one is available.
-- <Plug>(copilot-next)
--
--                                                 *copilot-i_ALT-[*
-- <M-[>                   Cycle to the previous suggestion.
-- <Plug>(copilot-previous)


vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]

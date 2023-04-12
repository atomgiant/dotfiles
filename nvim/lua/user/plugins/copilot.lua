return {
  "github/copilot.vim", 
  lazy = false,
  enable = true,
  init = function()
    vim.g.copilot_assume_mapped = true -- assume Tab is mapped
    vim.g.copilot_no_tab_map = true -- disable Tab mapping
  end,
  config = function()
    vim.keymap.set("i", "<C-CR>", function() return vim.fn["copilot#Accept"]("<CR>") end, { expr = true, silent = true })
  end,
}

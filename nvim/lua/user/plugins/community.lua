return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  
  -- { -- override nvim-cmp plugin
  --   "hrsh7th/nvim-cmp",
  --   -- override the options table that is used in the `require("cmp").setup()` call
  --   opts = function(_, opts)
  --     -- opts parameter is the default options table
  --     -- the function is lazy loaded so cmp is able to be required
  --     local cmp = require "cmp"
  --     local snip_status_ok, luasnip = pcall(require, "luasnip")
  --     if not snip_status_ok then return end
  --
  --     -- modify the mapping part of the table
  --     opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
  --       local copilot_keys = vim.fn["copilot#Accept"]()
  --       if copilot_keys ~= "" then
  --         vim.api.nvim_feedkeys(copilot_keys, "i", true)
  --       -- if vim.b._copilot_suggestion ~= nil then
  --       --   vim.fn.feedkeys(vim.api.nvim_replace_termcodes(vim.fn['copilot#Accept'](), true, true, true), '')
  --       elseif cmp.visible() then
  --         cmp.select_next_item()
  --       elseif luasnip.expand_or_jumpable() then
  --         luasnip.expand_or_jump()
  --       elseif has_words_before() then
  --         cmp.complete()
  --       else
  --         fallback()
  --       end
  --     end, { "i", "s" })
  --     
  --     -- return the new table to be used
  --     return opts
  --   end,
  -- },
}

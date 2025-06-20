return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",     -- LSP source
    "hrsh7th/cmp-buffer",       -- Buffer words
    "hrsh7th/cmp-path",         -- Filesystem paths
    "hrsh7th/cmp-cmdline",      -- Command line completion
    "L3MON4D3/LuaSnip",         -- Snippet engine (required!)
    "saadparwaiz1/cmp_luasnip", -- Snippet completion source
    "rafamadriz/friendly-snippets", -- Community snippet collection (optional)
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}

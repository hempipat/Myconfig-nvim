return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  event = "InsertEnter",
  dependencies = {
    "L3MON4D3/LuaSnip",

    -- Adds LSP completion capabilities
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'saadparwaiz1/cmp_luasnip',

  -- 'rafamadriz/friendly-snippets',
  },
  
  config = function()
    -- [[ Configure nvim-cmp ]]
    -- See `:help cmp`
    local cmp = require 'cmp'
    local luasnip = require "luasnip"

    require('luasnip.loaders.from_vscode').lazy_load()
    -- luasnip.config.setup {}

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    completion = {
      completeopt = 'menu,menuone,noinsert',
    },
    mapping = cmp.mapping.preset.insert {
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete {},
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    sorting = {
      comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          -- cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
          -- cmp.config.compare.exact,
          -- cmp.config.compare.locality,

          --[[ function (entry1, entry2)
            local result = vim.stricmp(entry1.completion_item.label, entry2.completion_item.label)

            if result < 0 then
              return true
            end
          end ]]
        }
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp'},
      { name = 'luasnip'},
      { name = 'buffer'},
      -- { name = 'path' },
      --[[ {
        name = 'nvim_lsp',
        entry_filter = function (entry, ctx)

          if entry:get_kind() == 15 then
            return false
          end

          return true
        end
      }, ]]
    }),
    formatting = {
      -- fields = { "kind", "abbr", "menu"},
      --[[ format = function (entry, vim_item)
        vim_item.kind = 'kind'
        vim_item.menu = 'menu'

        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          look = "[Dict]",
          buffer = "[Buffer]",
        })[entry.source.name] ]]
        -- vim_item.kind = lspkind.presets.default[vim_item]
        -- vim_item.menu = ({
        --   nvim_lsp = "[LSP]"
        -- })[entry.source.name]
        format = require("lspkind").cmp_format({
          mode = "text_symbol",
          maxwidth = 50,
          ellipsis_char = "...",
          menu = {
            luasnip = "[SNIP]",
            nvim_lsp = "[LSP]",
            buffer = "[BUF]"
          },
        })

        -- vim_item.abbr = vim_item.abbr:match("[^(]+")
        -- return vim_item
      -- end
    },
  }
  end,
}

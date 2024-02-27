local diagnostic_signs = { Error = "", Warn = "", Hint = "󱧤", Info = "" }
local on_attach = require("plugins.utils.utils").on_attach

local config = function()
  -- require("neoconf").setup({})
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  local lspconfig = require("lspconfig")
  local capabilities = cmp_nvim_lsp.default_capabilities()

  for type, icon in pairs(diagnostic_signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  -- lua
  lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
          Lua = {
                -- make the language server recognize "vim" global
                diagnostics = {
                    globals = { 'vim', 'require' },
                },
                workspace = {
                    -- make language server aware of runtime files
                    library = {
                        --[[ checkThirdParty = false, ]]
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
            },
        },
    })

   -- typescript
    lspconfig.tsserver.setup({
        capabilities = capabilities,
        filetypes = {
            "typescript",
            "javascript",
            "typescriptreact",
            "javascriptreact",
        },
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
        init_options = {
            preferences = {
                disableSuggestions = true,
            }
        }
        --[[ settings = {
            typescript = {
                format = {
                    indentSize = vim.o.shiftwidth,
                    convertTabsToSpaces = vim.o.expandtab,
                    tabSize = vim.o.tabstop,
                },
            },
            javascript = {
                format = {
                    indentSize = vim.o.shiftwidth,
                    convertTabsToSpaces = vim.o.expandtab,
                    tabSize = vim.o.tabstop,
                },
            },
            completions = {
                completeFunctionCalls = true,
            },
        }, ]]
    })

  -- ESLint
    lspconfig.eslint.setup({
        capabilities = capabilities,
        settings = {
            -- helps eslint find the eslintrc ehn it's placed in a subfolder instead of the cwd root
            workspaceDirectory = { mode = "auto" },
        },
    })

  -- json
    lspconfig.jsonls.setup({
        capabilities = capabilities,
        filetypes = { "json", "jsonc" },
        --[[ settings = {
            json = {
                enable = true,
            },
            validate = { enable  = true },
        }, ]]
    })
  -- Emmet
    lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = {
            "typescriptreact",
            "javascriptreact",
            "javascript",
            "css",
            "sass",
            "scss",
            "html",
        }
        --[[ settings = {
            init_options = {
                html = {
                    options = {
                       -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                       ["bem.enabled"] = true,
                    },
                },
            },
        }, ]]
    })

  -- CSS
  lspconfig.cssls.setup({
    capabilities = capabilities,
  })


  -- python
  lspconfig.pyright.setup({
    capabilities = capabilities,
      settings = {
        pyright = {
          disableOrganizeImports = false,
            analysis = {
              useLibraryCodeForTypes = true,
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              autoImportCompletions = true,
            },
        },
      },
  })

  -- configure xml server
  lspconfig.lemminx.setup({
    capabilities = capabilities,
  })

  -- configure java server
  -- lspconfig.jdtls.setup({
  --     on_attach = on_attach,
  -- })

  local luacheck = require("efmls-configs.linters.luacheck")
  local stylua = require("efmls-configs.formatters.stylua")
  local prettier_d = require("efmls-configs.formatters.prettier_d")
  local google_java_format = require("efmls-configs.formatters.google_java_format")

  -- configure efm server
    lspconfig.efm.setup({
        filetypes = {
            "lua",
            "html",
            "javascript",
            "java"
            -- "sql",
        },
        init_options = {
            documentFormatting = true,
            documentRangeFormatting = true,
            hover = true,
            documentSymbol = true,
            codeAction = true,
            completion = true,
        },
        settings = {
            languages = {
                lua = { luacheck, stylua },
                html = { prettier_d },
                java = { google_java_format },
                -- sql = { sql }
            }
        }
    })

end

return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  config = config,
  lazy = false,
  dependencies = {
  { 'williamboman/mason.nvim' },
  "creativenull/efmls-configs-nvim",
  -- 'williamboman/mason-lspconfig.nvim',

  -- Useful status updates for LSP
  -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
  { 'j-hui/fidget.nvim', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    -- 'folke/neodev.nvim',
  },
}

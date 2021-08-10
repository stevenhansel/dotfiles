local lsp = require("lspconfig")
local protocol = require("vim.lsp.protocol")

local defaults = {noremap = true, silent = true}

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", defaults)

  protocol.CompletionItemKind = {
    "", -- Text
    "", -- Method
    "", -- Function
    "", -- Constructor
    "", -- Field
    "", -- Variable
    "", -- Class
    "ﰮ", -- Interface
    "", -- Module
    "", -- Property
    "", -- Unit
    "", -- Value
    "", -- Enum
    "", -- Keyword
    "﬌", -- Snippet
    "", -- Color
    "", -- File
    "", -- Reference
    "", -- Folder
    "", -- EnumMember
    "", -- Constant
    "", -- Struct
    "", -- Event
    "ﬦ", -- Operator
    "" -- TypeParameter
  }
end

lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"},
  init_options = {
    hostInfo = "neovim"
  }
}

lsp.gopls.setup {}

lsp.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = {
    "javascript",
    "javascriptreact",
    "json",
    "typescript",
    "typescriptreact",
    "css",
    "less",
    "scss",
    "markdown",
    "pandoc"
  },
  init_options = {
    linters = {
      eslint = {
        command = "./node_modules/.bin/eslint",
        rootPatterns = {".git"},
        debounce = 100,
        args = {
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json"
        },
        sourceName = "eslint",
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "[eslint] ${message} [${ruleId}]",
          security = "severity"
        },
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      }
    },
    filetypes = {
      javascript = "eslint",
      javascriptreact = "eslint",
      typescript = "eslint",
      typescriptreact = "eslint"
    }
  }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = ""
    }
  }
)

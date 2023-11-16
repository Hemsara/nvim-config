return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          -- Golang
          nls.builtins.diagnostics.revive.with({
            filetypes = { "go" },
          }),
          nls.builtins.formatting.gofumpt.with({
            filetypes = { "go" },
          }),
          nls.builtins.formatting.goimports.with({
            filetypes = { "go" },
          }),
          nls.builtins.code_actions.gomodifytags.with({
            filetypes = { "go" },
          }),
        },
      }
    end,
  },
}

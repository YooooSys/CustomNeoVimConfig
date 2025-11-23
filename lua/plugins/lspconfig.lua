return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
  },

  config = function()
    vim.diagnostic.config({
      underline = true,
    })

    vim.api.nvim_set_option_value("signcolumn", "yes:2", { scope = "local" })

    local capabilities = require("blink.cmp").get_lsp_capabilities()
    local lspconfig = require("lspconfig")

    local on_attach = function(client, bufnr)
      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
    end

    lspconfig.clangd.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig.csharp_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig.omnisharp.setup({
    cmd = { "/home/Yoooo/.dotnet/tools/omnisharp" }, -- explicit path
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
    end,
})
 end,
}

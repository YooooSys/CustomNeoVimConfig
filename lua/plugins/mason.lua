return {
  "mason-org/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim" },
  opts = {},  -- Mason default options
  config = function()
    -- Setup Mason

    -- Setup Mason-LSPconfig to ensure OmniSharp is installed
    require("mason").setup({
      ensure_installed = { "omnisharp" },
      automatic_installation = true, -- optional, auto install LSPs if missing
    })
  end,
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.loop or vim.uv).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)
-- Setup lazy.nvim with plugins
require("lazy").setup({
  spec = {
    { import = "plugins" },

    -- Treesitter for syntax highlighting
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = { "lua", "c", "cpp", "python", "c_sharp"}, 
          highlight = { enable = true },
        })
      end,
    },

    change_detection = { notify = false },

    -- Disable hererocks if you don’t use LuaRocks
    rocks = { hererocks = false },
  }
})

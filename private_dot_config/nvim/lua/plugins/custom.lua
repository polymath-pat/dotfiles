-- ~/.config/nvim/lua/plugins/custom.lua
return {
  -- send text to tmux
  {
    "jpalardy/vim-slime",
    lazy = false,
    init = function()
      vim.g.slime_target = "tmux"
      vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
      vim.g.slime_dont_ask_default = 1
    end,
  },

  -- git
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "GBrowse" },
  },

  -- terraform
  { "hashivim/vim-terraform", ft = { "terraform", "hcl" } },

  -- ansible
  { "pearofducks/ansible-vim", ft = { "yaml", "yaml.ansible" } },
}
-- Your own plugins. lazy.nvim loads every file in lua/plugins/,
-- so this sits alongside NvChad's starter lua/plugins/init.lua.
return {
  -- send text to tmux (replaces tslime; config stays in lua/slime.lua)
  { "jpalardy/vim-slime", lazy = false },

  -- git
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "GBrowse" },
  },

  -- terraform (fmt on save, alignment)
  { "hashivim/vim-terraform", ft = { "terraform", "hcl" } },

  -- ansible
  { "pearofducks/ansible-vim", ft = { "yaml", "yaml.ansible" } },
}

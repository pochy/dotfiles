require("nvim-surround").setup({
  aliases = {
    ["<"] = "t",
  },
  keymaps = {
    normal = "sa",
    delete = "sd",
    change = "sr",
  },
})

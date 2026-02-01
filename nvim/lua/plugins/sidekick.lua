-- ai.sidekick: NES (inline suggestions) をデフォルト無効にする
-- 有効にする場合は <leader>uN でトグル可能
return {
  {
    "folke/sidekick.nvim",
    opts = {
      nes = {
        enabled = false,
      },
    },
  },
}

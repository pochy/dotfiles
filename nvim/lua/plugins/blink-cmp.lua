-- blink.cmp: 補完の一時オン/オフ切り替え
-- キーマップ: <Leader>ux でコード補完をトグル（uc は Conceal Level で使用中のため）
local function toggle_completion()
  if pcall(require, "blink.cmp") then
    require("blink.cmp").hide()
  end
  vim.b.completion = not vim.b.completion
  local state = vim.b.completion and "ON" or "OFF"
  vim.notify("コード補完: " .. state, vim.log.levels.INFO)
end

return {
  "saghen/blink.cmp",
  keys = {
    { "<leader>ux", toggle_completion, mode = { "i", "n" }, desc = "Toggle code completion" },
  },
  opts = function(_, opts)
    vim.g.completion_enabled = false

    -- 補完の有効/無効は vim.b.completion で制御（true = 有効、それ以外 = 無効）
    opts.enabled = function()
      return vim.b.completion == true
    end

    return opts
  end,
}

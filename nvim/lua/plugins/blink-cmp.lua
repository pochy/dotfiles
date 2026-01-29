-- blink.cmp: 補完の一時オン/オフ切り替え
-- キーマップ: <Leader>ux でコード補完をトグル（uc は Conceal Level で使用中のため）
return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    -- 補完の有効/無効は vim.b.completion で制御（nil または true = 有効、false = 無効）
    opts.enabled = function()
      return vim.b.completion ~= false
    end

    local function toggle_completion()
      if pcall(require, "blink.cmp") then
        require("blink.cmp").hide()
      end
      vim.b.completion = (vim.b.completion == false) and true or false
      local state = vim.b.completion and "ON" or "OFF"
      vim.notify("コード補完: " .. state, vim.log.levels.INFO)
    end

    vim.keymap.set({ "i", "n" }, "<leader>ux", toggle_completion, { desc = "Toggle code completion" })
    return opts
  end,
}

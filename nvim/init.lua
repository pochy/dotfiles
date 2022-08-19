require('base')
require('highlights')
require('keymaps')
require('plugins')


-- OSを判定する
-- if os.execute('uname -a | grep Linux') ~= '' then
-- end
if os.execute('uname -a | grep microsoft') ~= '' then
  -- Windows WSL2環境でクリップボードを共有する
  vim.cmd('augroup wsl_clip')
  vim.cmd('autocmd!')
  vim.cmd("autocmd TextYankPost * :call system('clip.exe', @\")")
  vim.cmd('augroup END')
end

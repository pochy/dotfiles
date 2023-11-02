local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup {
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}

local ts_status_ok, ts_comment = pcall(require, "ts_context_commentstring")
if not ts_status_ok then
  return
end

ts_comment.setup {}

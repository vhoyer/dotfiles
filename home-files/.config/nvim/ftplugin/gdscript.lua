-- Highlight GDScript format string specifiers: %s, %d, %.2f, %%, etc.
-- Only applies inside string nodes (via treesitter), not globally.
local ns = vim.api.nvim_create_namespace('gdscript_fmt')
local pattern = '%%[-+ #0]*%d*%.?%d*[sdiXxofeEgGcv%%]'

local function apply_fmt_highlights(bufnr)
  vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

  local ok, parser = pcall(vim.treesitter.get_parser, bufnr, 'gdscript')
  if not ok then return end

  local tree = parser:parse()[1]
  if not tree then return end

  local query = vim.treesitter.query.parse('gdscript', '(string) @str')

  for _, node in query:iter_captures(tree:root(), bufnr, 0, -1) do
    local sr, sc, er, ec = node:range()
    for row = sr, er do
      local line = vim.api.nvim_buf_get_lines(bufnr, row, row + 1, false)[1] or ''
      local cs = row == sr and sc or 0
      local ce = row == er and ec or #line
      local sub = line:sub(cs + 1, ce)
      local pos = 1
      while true do
        local s, e = sub:find(pattern, pos)
        if not s then break end
        vim.api.nvim_buf_add_highlight(bufnr, ns, '@string.escape', row, cs + s - 1, cs + e)
        pos = e + 1
      end
    end
  end
end

local bufnr = vim.api.nvim_get_current_buf()
apply_fmt_highlights(bufnr)

vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI' }, {
  buffer = bufnr,
  callback = function(ev) apply_fmt_highlights(ev.buf) end,
})

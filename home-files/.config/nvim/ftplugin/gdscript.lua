-- Highlight GDScript format string specifiers: %s, %d, %.2f, %%, etc.
-- matchadd priority 101 puts this above treesitter's string highlight (100)
vim.fn.matchadd('@string.escape', '%[-+ #0]*\\d*\\.\\?\\d*[sdiXxofeEgGcv%]', 101)

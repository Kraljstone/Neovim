-- Open nvim-tree when opening a directory (only when explicitly opening a directory)
-- Note: nvim-tree with hijack_netrw=true should handle this automatically,
-- but this ensures it works correctly
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  callback = function(data)
    local file = data.file
    -- Check if file exists and is a directory
    if file and vim.fn.isdirectory(file) == 1 then
      -- If a directory was opened, change to it
      vim.cmd.cd(file)
      -- nvim-tree with hijack_netrw should already open, but schedule this as a fallback
      vim.schedule(function()
        local ok, tree = pcall(require, 'nvim-tree.api')
        if ok then
          -- Only open if nvim-tree isn't already visible
          local tree_exists = tree.tree.is_visible()
          if not tree_exists then
            tree.tree.open({ find_file = false, update_root = true })
          end
        end
      end)
    end
  end,
  once = true,
})

-- Enable synchronized scrolling in diffview
-- This enables scrollbind for all diff windows (works with diffview and native vim diff)
-- Use multiple events to catch all diff windows as they're created
vim.api.nvim_create_autocmd({ 'BufWinEnter', 'WinEnter', 'WinNew' }, {
  callback = function()
    if vim.wo.diff then
      vim.wo.scrollbind = true
      vim.wo.cursorbind = true
    end
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank({ higroup = 'IncSearch', timeout = 200 })
  end,
})

-- Auto create directories when saving
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    local file = vim.fn.expand('<afile>')
    local dir = vim.fn.fnamemodify(file, ':p:h')
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end,
})

-- Remove trailing whitespace
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    local save_cursor = vim.fn.getpos('.')
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos('.', save_cursor)
  end,
})

-- Auto resize splits
vim.api.nvim_create_autocmd('VimResized', {
  callback = function()
    vim.cmd('wincmd =')
  end,
})

-- Return to last edit position
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Filetype specific settings
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Toggle paste mode when pasting from external applications
-- This prevents auto-indentation issues when pasting
-- Only check when entering insert mode (more efficient)
vim.api.nvim_create_autocmd('InsertEnter', {
  callback = function()
    if vim.o.paste then
      vim.opt.paste = false
    end
  end,
})

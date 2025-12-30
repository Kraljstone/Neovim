-- Neovim Configuration

-- Suppress diffview buffer creation errors (set up very early, before plugins load)
-- These errors occur when diffview tries to diff files in git index that can't be accessed
-- The error can appear with different prefixes like ':0:', 'LOCAL:', etc.
local function should_suppress_error(msg)
  if type(msg) ~= 'string' then
    return false
  end
  -- Match "Failed to create diff buffer" with any prefix or suffix
  return msg:match('Failed to create diff buffer') ~= nil
end

-- Intercept all error writing methods
local original_error = vim.api.nvim_err_writeln
vim.api.nvim_err_writeln = function(msg)
  if should_suppress_error(msg) then
    -- Silently ignore these specific errors
    return
  end
  return original_error(msg)
end

-- Also intercept through vim.api.nvim_out_write (some plugins use this)
local original_out_write = vim.api.nvim_out_write
vim.api.nvim_out_write = function(msg)
  if should_suppress_error(msg) then
    return
  end
  return original_out_write(msg)
end

-- Also intercept messages through the message history
local original_echo = vim.api.nvim_echo
vim.api.nvim_echo = function(chunks, history, opts)
  if chunks and type(chunks) == 'table' then
    for _, chunk in ipairs(chunks) do
      if type(chunk) == 'string' and should_suppress_error(chunk) then
        return -- Suppress the message
      elseif type(chunk) == 'table' and chunk[2] and should_suppress_error(chunk[2]) then
        return -- Suppress the message
      end
    end
  end
  return original_echo(chunks, history, opts)
end

-- Also suppress through vim.notify (set up early)
local original_notify = vim.notify
vim.notify = function(msg, level, opts)
  if should_suppress_error(msg) then
    -- Silently ignore these specific errors
    return
  end
  return original_notify(msg, level, opts)
end

-- Note: We can't override vim.cmd as it's used by many plugins
-- Instead, we'll handle errors through other channels

-- Note: vim.fn.echoerr is a built-in function and shouldn't be overridden

-- Also create a global error handler
vim.api.nvim_create_autocmd('VimEnter', {
  once = true,
  callback = function()
    -- Patch diffview after it loads (reduced delay for better performance)
    vim.defer_fn(function()
      local ok, diffview = pcall(require, 'diffview')
      if ok then
        -- Try to patch diffview's error handling
        local ok_utils, utils = pcall(require, 'diffview.utils')
        if ok_utils and utils and utils.error then
          local original_error = utils.error
          utils.error = function(msg, ...)
            if should_suppress_error(tostring(msg)) then
              return
            end
            return original_error(msg, ...)
          end
        end
      end
    end, 500) -- Reduced from 1000ms to 500ms
  end,
})

-- Suppress specific deprecation warnings from plugins
-- This filters out warnings we can't fix (they're in plugin code)
local original_deprecate = vim.deprecate
vim.deprecate = function(name, alternative, version, plugin, backtrace)
  -- Suppress vim.tbl_islist deprecation (plugins will update eventually)
  if name == 'vim.tbl_islist' then
    return
  end
  -- Call original for other deprecations
  return original_deprecate(name, alternative, version, plugin, backtrace)
end

local function safe_require(name)
  local ok, err = pcall(require, name)
  if not ok then
    vim.notify('Error loading ' .. name .. ': ' .. tostring(err), vim.log.levels.ERROR)
  end
end

safe_require('options')
safe_require('keymaps')
safe_require('plugins')
safe_require('autocmds')
safe_require('lsp')

-- Load theme after plugins are loaded
vim.schedule(function()
  local ok, _ = pcall(vim.cmd, 'colorscheme dracula_pro')
  if ok then
    vim.g.dracula_colorterm = 0
  else
    -- Fallback to dracula if dracula_pro_buffy is not available
    local ok2, _ = pcall(vim.cmd, 'colorscheme dracula')
    if ok2 then
      vim.g.dracula_colorterm = 0
    else
      -- Fallback to default colorscheme
      vim.cmd('colorscheme default')
    end
  end
  vim.cmd('syntax enable')
  
  -- Ensure lualine is loaded
  pcall(function()
    require('lualine').setup()
  end)
end)
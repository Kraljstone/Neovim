-- Neovim Configuration

-- WARNING: Fragile workaround for diffview buffer creation errors
-- These errors occur when diffview tries to diff files in git index that can't be accessed
-- The error can appear with different prefixes like ':0:', 'LOCAL:', etc.
--
-- This intercepts error messages at the Neovim API level, which is less fragile than
-- monkey-patching diffview internals but still not ideal. The primary patching happens
-- in plugins.lua where we can access diffview modules directly.
--
-- TODO: Consider opening an issue upstream at https://github.com/sindrets/diffview.nvim
-- to request proper error handling for inaccessible files in git index.

local function should_suppress_error(msg)
  if type(msg) ~= 'string' then
    return false
  end
  -- Match "Failed to create diff buffer" with any prefix or suffix
  return msg:match('Failed to create diff buffer') ~= nil
end

-- Intercept error writing methods as a fallback (primary patching is in plugins.lua)
-- This provides defense-in-depth but the main fix should be in the plugin config
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
      elseif type(chunk) == 'table' and chunk[1] and type(chunk[1]) == 'string' and should_suppress_error(chunk[1]) then
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
-- Note: vim.fn.echoerr is a built-in function and shouldn't be overridden

-- Additional fallback: try to patch diffview.utils.error if available
-- This is a secondary attempt; primary patching happens in plugins.lua config
vim.api.nvim_create_autocmd('VimEnter', {
  once = true,
  callback = function()
    local function try_patch_utils(retries_left)
      if retries_left <= 0 then
        return
      end
      
      local ok, diffview = pcall(require, 'diffview')
      if ok then
        local ok_utils, utils = pcall(require, 'diffview.utils')
        if ok_utils and utils and utils.error and type(utils.error) == 'function' and not utils._error_patched_init then
          local original_error = utils.error
          utils.error = function(msg, ...)
            if should_suppress_error(tostring(msg)) then
              return
            end
            return original_error(msg, ...)
          end
          utils._error_patched_init = true
        end
      else
        -- Retry if diffview isn't loaded yet
        vim.defer_fn(function()
          try_patch_utils(retries_left - 1)
        end, 100)
      end
    end
    
    try_patch_utils(5) -- Try up to 5 times with 100ms delays
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
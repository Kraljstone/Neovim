-- Neovim Configuration
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
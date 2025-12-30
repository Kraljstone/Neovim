-- LSP Configuration using native Neovim 0.11+ API
-- This file sets up all LSP servers

local function setup_lsp()
  -- Check if native LSP config API is available (Neovim 0.11+)
  if not vim.lsp or not vim.lsp.config then
    vim.notify('vim.lsp.config not available. Please use Neovim 0.11+', vim.log.levels.ERROR)
    return
  end
  
  local ok_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
  if not ok_cmp then
    vim.notify('Failed to load cmp_nvim_lsp, using default capabilities', vim.log.levels.WARN)
  end
  
  -- Setup completion capabilities
  local capabilities = ok_cmp and cmp_nvim_lsp.default_capabilities() or vim.lsp.protocol.make_client_capabilities()
  
  -- Helper function for root directory detection
  local function root_pattern(...)
    local patterns = {...}
    return function(fname)
      for _, pattern in ipairs(patterns) do
        local root = vim.fs.find(pattern, { path = vim.fs.dirname(fname), upward = true })[1]
        if root then
          return vim.fs.dirname(root)
        end
      end
      return vim.fs.dirname(fname)
    end
  end
  
  -- Helper function to check if any client supports a method (defined outside on_attach for performance)
  local function check_capability(bufnr, method_name, capability_key)
      local clients = vim.lsp.get_clients({ bufnr = bufnr })
      if #clients == 0 then
        local all_clients = vim.lsp.get_clients()
        for _, c in ipairs(all_clients) do
          if c.attached_buffers and c.attached_buffers[bufnr] then
            table.insert(clients, c)
          end
        end
      end
      
      if #clients == 0 then
        return false, {}
      end
      
      local has_support = false
      local client_names = {}
      for _, c in ipairs(clients) do
        table.insert(client_names, c.name)
        local caps = c.server_capabilities
        if caps and (caps[capability_key] == true or (type(caps[capability_key]) == 'table' and caps[capability_key] ~= nil)) then
          has_support = true
        end
      end
      
      return has_support, client_names
  end
  
  -- LSP keymaps
  local on_attach = function(client, bufnr)
    local map = vim.keymap.set
    local opts = { buffer = bufnr, noremap = true, silent = true }
    
    -- Go to definition (gd - standard Neovim keybinding)
    map('n', 'gd', function()
      local has_support, client_names = check_capability(bufnr, 'definition', 'definitionProvider')
      if not has_support then
        if #client_names > 0 then
          vim.notify(
            string.format(
              'Go to definition not supported by attached LSP clients: %s. For JS/TS files, ensure ts_ls is running.',
              table.concat(client_names, ', ')
            ),
            vim.log.levels.WARN
          )
        else
          local ft = vim.bo.filetype
          vim.notify(string.format('No LSP client attached for %s. Check :LspInfo for server status.', ft), vim.log.levels.WARN)
        end
        return
      end
      vim.lsp.buf.definition()
    end, opts)
    
    map('n', 'gi', vim.lsp.buf.implementation, opts)
    
    -- Go to references (gr - standard Neovim keybinding)
    map('n', 'gr', function()
      local has_support, client_names = check_capability(bufnr, 'references', 'referencesProvider')
      if not has_support then
        if #client_names > 0 then
          vim.notify(
            string.format(
              'Find references not supported by attached LSP clients: %s.',
              table.concat(client_names, ', ')
            ),
            vim.log.levels.WARN
          )
        else
          local ft = vim.bo.filetype
          vim.notify(string.format('No LSP client attached for %s. Check :LspInfo for server status.', ft), vim.log.levels.WARN)
        end
        return
      end
      vim.lsp.buf.references()
    end, opts)
    
    -- Hover and signature help
    map('n', 'K', vim.lsp.buf.hover, opts)
    map('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    
    -- Code actions
    map('n', '<leader>rn', vim.lsp.buf.rename, opts)
    map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    
    -- Diagnostics
    map('n', '[d', vim.diagnostic.goto_prev, opts)
    map('n', ']d', vim.diagnostic.goto_next, opts)
    map('n', '<leader>d', vim.diagnostic.open_float, opts)
    
    -- LSP status command
    map('n', '<leader>ls', function()
      local all_clients = vim.lsp.get_clients()
      local attached_clients = {}
      for _, client in ipairs(all_clients) do
        if client.attached_buffers and client.attached_buffers[bufnr] then
          table.insert(attached_clients, client)
        end
      end
      if #attached_clients == 0 then
        vim.notify('No LSP clients attached to this buffer', vim.log.levels.INFO)
      else
        local msg = 'LSP clients: '
        for i, client in ipairs(attached_clients) do
          msg = msg .. client.name
          if i < #attached_clients then msg = msg .. ', ' end
        end
        vim.notify(msg, vim.log.levels.INFO)
      end
      
      -- Also show all configured servers
      local configured = vim.lsp.get_clients()
      if #configured > 0 then
        local config_msg = 'All configured servers: '
        for i, client in ipairs(configured) do
          config_msg = config_msg .. client.name .. ' (' .. (client.attached_buffers and client.attached_buffers[bufnr] and 'attached' or 'not attached') .. ')'
          if i < #configured then config_msg = config_msg .. ', ' end
        end
        vim.notify(config_msg, vim.log.levels.INFO)
      end
    end, opts)
  end
  
  -- TypeScript/JavaScript LSP
  local ok_ts, err_ts = pcall(function()
    -- Check if typescript-language-server is available
    if vim.fn.executable('typescript-language-server') ~= 1 then
      vim.notify('typescript-language-server not found in PATH. Install it with: npm install -g typescript-language-server', vim.log.levels.WARN)
      return -- Don't try to setup if not available
    end
    
    local config = {
      cmd = { 'typescript-language-server', '--stdio' },
      filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
      root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
      on_attach = on_attach,
      capabilities = capabilities,
      -- Use default root detection (more reliable)
      -- Remove custom root_dir to let Neovim handle it automatically
      -- Settings to handle TypeScript installation gracefully
      settings = {
        typescript = {
          -- Try to use workspace TypeScript, but don't fail if not found
          prefer = { 'workspace' },
        },
        javascript = {
          prefer = { 'workspace' },
        },
      },
      init_options = {
        hostInfo = 'neovim',
      },
    }
    
    vim.lsp.config('ts_ls', config)
    vim.lsp.enable('ts_ls')
  end)
  if not ok_ts then
    vim.notify('Failed to setup ts_ls: ' .. tostring(err_ts), vim.log.levels.ERROR)
  end
  
  -- JSON LSP
  local ok_json, err_json = pcall(function()
    vim.lsp.config('jsonls', {
      cmd = { 'vscode-json-language-server', '--stdio' },
      filetypes = { 'json', 'jsonc' },
      root_markers = { 'package.json', 'tsconfig.json', '.git' },
      on_attach = on_attach,
      capabilities = capabilities,
    })
    vim.lsp.enable('jsonls')
  end)
  if not ok_json then
    vim.notify('Failed to setup jsonls: ' .. tostring(err_json), vim.log.levels.WARN)
  end
  
  -- ESLint LSP
  local ok_eslint, err_eslint = pcall(function()
    vim.lsp.config('eslint', {
      cmd = { 'vscode-eslint-language-server', '--stdio' },
      filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
      root_markers = { '.eslintrc', '.eslintrc.js', '.eslintrc.json', 'package.json', '.git' },
      on_attach = on_attach,
      capabilities = capabilities,
    })
    vim.lsp.enable('eslint')
  end)
  if not ok_eslint then
    vim.notify('Failed to setup eslint: ' .. tostring(err_eslint), vim.log.levels.WARN)
  end
  
  -- Lua LSP
  local ok_lua, err_lua = pcall(function()
    vim.lsp.config('lua_ls', {
      cmd = { 'lua-language-server' },
      filetypes = { 'lua' },
      root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          diagnostics = { globals = { 'vim' } },
          workspace = { 
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })
    vim.lsp.enable('lua_ls')
  end)
  if not ok_lua then
    vim.notify('Failed to setup lua_ls: ' .. tostring(err_lua), vim.log.levels.WARN)
  end
end

-- Setup LSP after a short delay to ensure plugins are loaded
vim.schedule(function()
  vim.defer_fn(setup_lsp, 200) -- 200ms delay
end)

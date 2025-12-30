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
    
    -- Try to find global TypeScript installation as fallback
    local function find_global_typescript()
      -- First, try to find via npm in current environment (respects NVM)
      local npm_global = vim.fn.system('npm root -g 2>/dev/null'):gsub('%s+', '')
      if npm_global and npm_global ~= '' then
        local ts_path = npm_global .. '/typescript'
        if vim.fn.isdirectory(ts_path) == 1 then
          return ts_path
        end
      end
      
      -- Try to find in current Node version's lib (for NVM users)
      local node_path = vim.fn.system('which node 2>/dev/null'):gsub('%s+', '')
      if node_path and node_path ~= '' then
        -- Extract Node version path from binary location
        local node_dir = vim.fn.fnamemodify(node_path, ':h:h')
        local ts_path = node_dir .. '/lib/node_modules/typescript'
        if vim.fn.isdirectory(ts_path) == 1 then
          return ts_path
        end
      end
      
      -- Search all NVM versions (fallback)
      local nvm_base = vim.fn.expand('~/.nvm/versions/node')
      if vim.fn.isdirectory(nvm_base) == 1 then
        -- Use find command to locate TypeScript in any NVM version
        local find_cmd = string.format('find %s -maxdepth 3 -type d -name "typescript" -path "*/node_modules/typescript" 2>/dev/null | head -1', nvm_base)
        local found_path = vim.fn.system(find_cmd):gsub('%s+', '')
        if found_path and found_path ~= '' and vim.fn.isdirectory(found_path) == 1 then
          return found_path
        end
      end
      
      -- Common global TypeScript locations (fallback)
      local possible_paths = {
        vim.fn.expand('~/.npm-global/lib/node_modules/typescript'),
        '/usr/local/lib/node_modules/typescript',
        '/opt/homebrew/lib/node_modules/typescript', -- Homebrew on macOS
      }
      
      for _, path in ipairs(possible_paths) do
        if vim.fn.isdirectory(path) == 1 then
          return path
        end
      end
      
      return nil
    end
    
    local global_ts_path = find_global_typescript()
    
    if global_ts_path then
      vim.notify('TypeScript LSP: Found global TypeScript at ' .. global_ts_path, vim.log.levels.INFO)
    else
      vim.notify(
        'TypeScript LSP: No global TypeScript found. ' ..
        'Install with: npm install -g typescript ' ..
        '(or in workspace: npm install typescript)',
        vim.log.levels.WARN
      )
    end
    
    local config = {
      cmd = { 'typescript-language-server', '--stdio' },
      filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
      root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        typescript = {
          -- Try workspace first, then fallback to bundled
          prefer = { 'workspace', 'bundled' },
        },
        javascript = {
          prefer = { 'workspace', 'bundled' },
        },
      },
      init_options = {
        hostInfo = 'neovim',
        -- Set tsserver.path in init_options (this is what typescript-language-server expects)
        tsserver = global_ts_path and {
          path = global_ts_path,
        } or nil,
      },
    }
    
    vim.lsp.config('ts_ls', config)
    
    -- Set up error handler for LSP client errors
    vim.api.nvim_create_autocmd('User', {
      pattern = 'LspAttach',
      callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.name == 'ts_ls' then
          -- Monitor for initialization errors
          vim.schedule(function()
            -- Check if client is still valid after a short delay
            vim.defer_fn(function()
              local clients = vim.lsp.get_clients({ name = 'ts_ls' })
              if #clients == 0 then
                vim.notify(
                  'TypeScript LSP failed to initialize. ' ..
                  'Install TypeScript in workspace: npm install typescript ' ..
                  '(or globally: npm install -g typescript)',
                  vim.log.levels.WARN
                )
              end
            end, 1000)
          end)
        end
      end,
    })
    
    -- Wrap enable in error handling to catch initialization failures
    local ok_enable, enable_err = pcall(function()
      vim.lsp.enable('ts_ls')
    end)
    if not ok_enable then
      vim.notify(
        'TypeScript LSP failed to enable: ' .. tostring(enable_err) ..
        '. Ensure TypeScript is installed in workspace or globally.',
        vim.log.levels.WARN
      )
    end
  end)
  if not ok_ts then
    vim.notify('Failed to setup ts_ls: ' .. tostring(err_ts), vim.log.levels.WARN)
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

-- Note: If you see TypeScript LSP errors about missing TypeScript installation,
-- install TypeScript in your workspace: npm install typescript
-- Or globally: npm install -g typescript
-- The LSP will automatically use workspace TypeScript if available, or fallback to bundled/global

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- File explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup({
        view = {
          width = 50,  -- Wider sidebar to show longer file names
          side = 'left',
        },
        hijack_netrw = true,
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true,
        },
        renderer = {
          icons = {
            glyphs = {
              git = {
                unstaged = '✗',
                staged = '✓',
                unmerged = '⌥',
                renamed = '➜',
                untracked = '★',
                deleted = '⊘',
                ignored = '◌',
              },
            },
          },
        },
      })
    end,
  }
  
  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = { 
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-file-browser.nvim'},
    },
    config = function()
      require('telescope').setup({
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
          preview = {
            check_mime_type = true,
            timeout = 250,
          },
        },
        pickers = {
          buffers = {
            previewer = false,  -- Disable preview for buffers to avoid invalid buffer errors
            initial_mode = 'normal',
          },
          find_files = {
            previewer = false,  -- Disable preview to avoid buffer errors
          },
          live_grep = {
            previewer = false,  -- Disable preview to avoid buffer errors
          },
          oldfiles = {
            previewer = false,  -- Disable preview to avoid buffer errors
          },
        },
        extensions = {
          file_browser = {
            theme = 'ivy',
            hijack_netrw = false,  -- Disable to avoid conflict with nvim-tree
          },
        },
      })
      require('telescope').load_extension('file_browser')
    end,
  }
  
  -- Modern file explorer (alternative to nvim-tree)
  use {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup({
        default_file_explorer = false,  -- Disable to avoid conflict with nvim-tree
        columns = { 'icon' },
        view_options = {
          show_hidden = true,
        },
      })
    end,
  }
  
  -- LSP completion capabilities
  use {
    'hrsh7th/cmp-nvim-lsp',
    config = function()
      -- Diagnostic configuration (can be set up early)
      vim.schedule(function()
        pcall(function()
          vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            update_in_insert = false,
            underline = true,
            severity_sort = true,
            float = {
              focusable = false,
              style = 'minimal',
              border = 'rounded',
              source = 'always',
              header = '',
              prefix = '',
            },
          })
          
          -- Signs for diagnostics
          local signs = { Error = '✗', Warn = '⚠', Hint = '💡', Info = 'ℹ' }
          for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
          end
        end)
      end)
    end,
  }
  
  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      local ok, cmp = pcall(require, 'cmp')
      if not ok then return end
      local ok2, luasnip = pcall(require, 'luasnip')
      if not ok2 then return end
      
      pcall(function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end)
      
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        }),
      })
      
      -- Use buffer source for `/` and `?`
      pcall(function()
        cmp.setup.cmdline({ '/', '?' }, {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = 'buffer' }
          }
        })
      end)
      
      -- Use cmdline & path source for ':'
      pcall(function()
        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = 'path' }
          }, {
            { name = 'cmdline' }
          })
        })
      end)
    end,
  }
  
  -- Auto pairs
  use {
    'windwp/nvim-autopairs',
    requires = { 'hrsh7th/nvim-cmp' },
    config = function()
      local ok, autopairs = pcall(require, 'nvim-autopairs')
      if not ok then return end
      autopairs.setup()
      
      -- Setup cmp integration
      vim.schedule(function()
        local ok2, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
        if not ok2 then return end
        local ok3, cmp = pcall(require, 'cmp')
        if not ok3 then return end
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
      end)
    end,
  }
  
  -- Comments
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }
  
  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'lua',
          'vim',
          'javascript',
          'typescript',
          'json',
          'html',
          'css',
          'python',
          'bash',
          'markdown',
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  }
  
  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      vim.schedule(function()
        -- Make sure statusline is enabled
        vim.opt.laststatus = 3
        
        local function get_time()
          return os.date('%H:%M')
        end
        
        local ok, lualine = pcall(require, 'lualine')
        if not ok then return end
        
        lualine.setup({
          options = {
            theme = 'auto',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            always_divide_middle = true,
            globalstatus = false,
            disabled_filetypes = { statusline = {}, winbar = {} },
          },
        sections = {
          lualine_a = {
            {
              'mode',
              fmt = function(str)
                return ' ' .. str:upper() .. ' '
              end,
              separator = { right = '' },
            }
          },
          lualine_b = {
            {
              'branch',
              icon = '󰘬',
              fmt = function(str)
                return ' ' .. str .. ' '
              end,
              separator = { right = '' },
            },
            {
              'diff',
              symbols = {
                added = '󰐕 ',
                modified = '󰏫 ',
                removed = '󰍴 '
              },
              separator = { right = '' },
            },
            {
              'diagnostics',
              symbols = {
                error = '✗ ',
                warn = '⚠ ',
                info = 'ℹ ',
                hint = '💡 '
              },
              separator = { right = '' },
            }
          },
          lualine_c = {
            {
              'filename',
              path = 1,
              file_status = true,
              symbols = {
                modified = ' ●',
                readonly = ' 󰈡',
                unnamed = ' [No Name]',
                newfile = ' [New]',
              },
              separator = { left = '', right = ' ' },
            }
          },
          lualine_x = {
            {
              'filetype',
              icon_only = false,
              fmt = function(str)
                return ' ' .. str:upper() .. ' '
              end,
              separator = { left = '  ', right = ' ' },
            },
            {
              'encoding',
              fmt = function(str)
                return ' ' .. str:upper() .. ' '
              end,
              separator = { left = ' ', right = ' ' },
            },
            {
              get_time,
              icon = '󰥔',
              fmt = function(str)
                return ' ' .. str .. ' '
              end,
              separator = { left = ' ', right = '' },
            }
          },
          lualine_y = {
            {
              'progress',
              fmt = function(str)
                return ' ' .. str .. ' '
              end,
              separator = { left = ' ', right = ' ' },
            }
          },
          lualine_z = {
            {
              'location',
              fmt = function(str)
                return ' ' .. str .. ' '
              end,
              separator = { left = ' ', right = '' },
            }
          }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        })
      end)
    end,
  }
  
  -- Git signs
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  }
  
  -- Git wrapper (fugitive)
  use {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Git status' })

      local ThePrimeagen_Fugitive = vim.api.nvim_create_augroup('ThePrimeagen_Fugitive', {})

      local autocmd = vim.api.nvim_create_autocmd

      autocmd('BufWinEnter', {
        group = ThePrimeagen_Fugitive,
        pattern = '*',
        callback = function()
          if vim.bo.ft ~= 'fugitive' then
            return
          end

          local bufnr = vim.api.nvim_get_current_buf()
          local opts = { buffer = bufnr, remap = false }

          vim.keymap.set('n', '<leader>p', function()
            vim.cmd.Git('push')
          end, opts)

          -- rebase always
          vim.keymap.set('n', '<leader>P', function()
            vim.cmd.Git({ 'pull', '--rebase' })
          end, opts)

          -- NOTE: It allows me to easily set the branch i am pushing and any tracking
          -- needed if i did not set the branch up correctly
          vim.keymap.set('n', '<leader>t', ':Git push -u origin ', opts)
        end,
      })

      -- Diff resolution shortcuts
      vim.keymap.set('n', 'gu', '<cmd>diffget //2<CR>', { desc = 'Get left diff' })
      vim.keymap.set('n', 'gh', '<cmd>diffget //3<CR>', { desc = 'Get right diff' })
    end,
  }
  
  -- Modern diff viewer
  use {
    'sindrets/diffview.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- WARNING: Fragile monkey-patching of diffview internals
      -- This patches internal module functions (error, create_diff_buffer) which may break
      -- on plugin updates. Module paths (diffview.buffer, diffview.utils, etc.) are
      -- implementation details and not part of the public API.
      --
      -- TODO: Consider opening an issue upstream at https://github.com/sindrets/diffview.nvim
      -- to request official configuration options for handling "Failed to create diff buffer"
      -- errors that occur when diffview tries to diff files in git index that can't be accessed.
      --
      -- This workaround suppresses errors for files that can't be diffed (e.g., binary files,
      -- files in git index that are inaccessible). A better solution would be proper error
      -- handling in diffview itself.
      
      local function try_patch_modules()
        local modules_to_patch = {
          'diffview.buffer',
          'diffview.utils',
          'diffview.log',
          'diffview.lib',
        }
        
        local patched_count = 0
        for _, module_name in ipairs(modules_to_patch) do
          local ok, module = pcall(require, module_name)
          if ok and module then
            -- Patch error function if it exists and hasn't been patched
            if module.error and type(module.error) == 'function' and not module._error_patched then
              local original = module.error
              module.error = function(msg, ...)
                if type(msg) == 'string' and msg:match('Failed to create diff buffer') then
                  return
                end
                return original(msg, ...)
              end
              module._error_patched = true
              patched_count = patched_count + 1
            end
            
            -- Patch create_diff_buffer if it exists and hasn't been patched
            if module.create_diff_buffer and type(module.create_diff_buffer) == 'function' and not module._create_diff_buffer_patched then
              local original = module.create_diff_buffer
              module.create_diff_buffer = function(...)
                local ok_create, result = pcall(original, ...)
                if not ok_create then
                  local err = tostring(result)
                  if err:match('Failed to create diff buffer') then
                    return nil
                  end
                  error(result)
                end
                return result
              end
              module._create_diff_buffer_patched = true
              patched_count = patched_count + 1
            end
          end
        end
        
        return patched_count > 0
      end
      
      -- Try to patch modules with retry mechanism instead of arbitrary delay
      -- This is more reliable than a fixed delay but still fragile
      local function attempt_patch(retries_left)
        if retries_left <= 0 then
          -- Don't show warning - init.lua fallback will handle errors
          -- The patching is optional and the error interception in init.lua should cover it
          return
        end
        
        local success = try_patch_modules()
        if not success then
          -- Retry after a short delay if modules aren't ready yet
          vim.defer_fn(function()
            attempt_patch(retries_left - 1)
          end, 100)
        end
      end
      
      -- Try patching immediately after setup
      vim.schedule(function()
        attempt_patch(10) -- Try up to 10 times with 100ms delays (max 1 second)
      end)
      
      -- Also try patching when diffview is actually used (more reliable)
      vim.api.nvim_create_autocmd('User', {
        pattern = 'DiffviewViewOpened',
        once = true,
        callback = function()
          -- Try patching one more time when diffview is actually opened
          vim.schedule(function()
            try_patch_modules()
          end)
        end,
      })
      
      -- Function to enable scrollbind on all diff windows (defined early for scope)
      local function enable_scrollbind()
        local wins = vim.api.nvim_list_wins()
        local diff_wins = {}
        
        -- Collect all diff windows
        for _, win in ipairs(wins) do
          if vim.api.nvim_win_is_valid(win) then
            local ok, diff = pcall(vim.api.nvim_win_get_option, win, 'diff')
            if ok and diff then
              table.insert(diff_wins, win)
            end
          end
        end
        
        -- Enable scrollbind on all diff windows at once
        if #diff_wins > 1 then
          for _, win in ipairs(diff_wins) do
            vim.api.nvim_win_set_option(win, 'scrollbind', true)
            vim.api.nvim_win_set_option(win, 'cursorbind', true)
          end
        end
      end
      
      -- Setup diffview with hooks to suppress buffer creation errors
      require('diffview').setup({
        view = {
          -- Make the file list sidebar wider
          default = {
            layout = 'diff2_horizontal',
            winbar_info = true,
          },
          merge_tool = {
            layout = 'diff3_horizontal',
            disable_diagnostics = true,
          },
        },
        file_panel = {
          listing_style = 'tree',
          tree_options = {
            flatten_dirs = true,
            folder_statuses = 'only_folded',
          },
          win_config = {
            position = 'left',
            width = 50,  -- Wider sidebar for file list
          },
        },
        file_history_panel = {
          win_config = {
            position = 'bottom',
            height = 16,
          },
        },
        keymaps = {
          view = {
            -- Navigate through changes
            ['[c'] = function() require('diffview.actions').prev_conflict() end,
            [']c'] = function() require('diffview.actions').next_conflict() end,
            ['[x'] = function() require('diffview.actions').prev_conflict() end,
            [']x'] = function() require('diffview.actions').next_conflict() end,
          },
          file_panel = {
            -- Navigate files
            ['j'] = function() require('diffview.actions').next_entry() end,
            ['k'] = function() require('diffview.actions').prev_entry() end,
            ['<CR>'] = function()
              local ok, err = pcall(function()
                require('diffview.actions').select_entry()
                -- Move focus to diff view after file opens
                vim.schedule(function()
                  -- Try to use diffview's built-in focus_files action first
                  vim.defer_fn(function()
                    local ok_focus, _ = pcall(function()
                      require('diffview.actions').focus_files()
                    end)
                    
                    -- If focus_files doesn't work, manually find and focus diff windows
                    if not ok_focus then
                      local wins = vim.api.nvim_list_wins()
                      for _, win in ipairs(wins) do
                        if vim.api.nvim_win_is_valid(win) then
                          local ok_win, diff = pcall(vim.api.nvim_win_get_option, win, 'diff')
                          if ok_win and diff then
                            vim.api.nvim_set_current_win(win)
                            enable_scrollbind()
                            break
                          end
                        end
                      end
                    else
                      enable_scrollbind()
                    end
                  end, 150)
                  
                  -- Backup: try again after longer delay
                  vim.defer_fn(function()
                    local wins = vim.api.nvim_list_wins()
                    for _, win in ipairs(wins) do
                      if vim.api.nvim_win_is_valid(win) then
                        local ok_win, diff = pcall(vim.api.nvim_win_get_option, win, 'diff')
                        if ok_win and diff then
                          vim.api.nvim_set_current_win(win)
                          enable_scrollbind()
                          break
                        end
                      end
                    end
                  end, 300)
                end)
              end)
              if not ok then
                -- Silently handle errors - diffview will show its own error messages
              end
            end,
            ['o'] = function() require('diffview.actions').select_entry() end,
            ['<Tab>'] = function() require('diffview.actions').focus_entry() end,
          },
        },
        -- Configuration to handle new files and suppress errors
        diff_binaries = false,
        enhanced_diff_hl = false,
        use_icons = true,
        show_help_hints = false,
        -- Hooks to catch and suppress buffer creation errors
        hooks = {
          diff_buf_read = function()
            -- Suppress errors silently
          end,
        },
      })
      
      -- Enable synchronized scrolling when diffview opens
      vim.api.nvim_create_autocmd('User', {
        pattern = 'DiffviewViewOpened',
        callback = function()
          -- Try multiple times with delays to catch all windows
          vim.schedule(function()
            vim.defer_fn(enable_scrollbind, 50)
            vim.defer_fn(enable_scrollbind, 150)
            vim.defer_fn(enable_scrollbind, 300)
          end)
        end,
      })
      
      -- Also enable when files are opened in diffview
      vim.api.nvim_create_autocmd('User', {
        pattern = 'DiffviewFileOpened',
        callback = function()
          vim.schedule(function()
            -- Function to focus diff view with retries
            local function focus_diff_with_retry(attempt)
              attempt = attempt or 0
              if attempt > 5 then return end
              
              local wins = vim.api.nvim_list_wins()
              local found = false
              
              for _, win in ipairs(wins) do
                if vim.api.nvim_win_is_valid(win) then
                  local ok, diff = pcall(vim.api.nvim_win_get_option, win, 'diff')
                  if ok and diff then
                    vim.api.nvim_set_current_win(win)
                    enable_scrollbind()
                    found = true
                    break
                  end
                end
              end
              
              -- Retry if not found
              if not found then
                vim.defer_fn(function()
                  focus_diff_with_retry(attempt + 1)
                end, 100)
              end
            end
            
            vim.defer_fn(function()
              enable_scrollbind()
              focus_diff_with_retry(0)
            end, 50)
            
            vim.defer_fn(enable_scrollbind, 200)
          end)
        end,
      })
      
      -- Backup: enable scrollbind when entering diff windows
      vim.api.nvim_create_autocmd({ 'WinEnter', 'BufWinEnter', 'WinNew' }, {
        callback = function()
          if vim.wo.diff then
            vim.wo.scrollbind = true
            vim.wo.cursorbind = true
            -- Also trigger the function to sync all windows
            vim.schedule(function()
              enable_scrollbind()
            end)
          end
        end,
      })
    end,
  }
  
  -- Which key
  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup()
    end,
  }
  
  -- Colorscheme
  use {
    'dracula/vim',
    as = 'dracula',
  }
  
  -- Buffer line (better buffer management)
  use {
    'akinsho/bufferline.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('bufferline').setup({
        options = {
          mode = 'buffers',
          separator_style = 'thin',
          always_show_bufferline = true,
        },
      })
    end,
  }
  
  -- Indent guides
  use {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('ibl').setup({
        indent = {
          char = '│',
        },
        scope = {
          enabled = true,
        },
      })
    end,
  }
  
  -- Better terminal
  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup({
        size = 20,
        open_mapping = [[<C-\>]],
        direction = 'horizontal',
      })
    end,
  }
  
  -- Surround text with brackets/quotes
  use {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup()
    end,
  }
  
  -- Better diagnostics
  use {
    'folke/trouble.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('trouble').setup()
    end,
  }
  
  -- TODO comments highlighting
  use {
    'folke/todo-comments.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('todo-comments').setup()
    end,
  }
  
  -- Better escape
  use {
    'max397574/better-escape.nvim',
    config = function()
      require('better_escape').setup({
        timeout = 200,
        default_mappings = true,
      })
    end,
  }
  
  -- Startup screen
  use {
    'goolord/alpha-nvim',
    config = function()
      local alpha = require('alpha')
      local dashboard = require('alpha.themes.dashboard')
      
      dashboard.section.header.val = {
        '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
        '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
        '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
        '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
        '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
        '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
      }
      
      dashboard.section.buttons.val = {
        dashboard.button('e', '📁 New file', ':ene <BAR> startinsert<CR>'),
        dashboard.button('f', '🔍 Find file', ':Telescope find_files<CR>'),
        dashboard.button('r', '📂 Recent files', ':Telescope oldfiles<CR>'),
        dashboard.button('g', '🔎 Find text', ':Telescope live_grep<CR>'),
        dashboard.button('q', '❌ Quit', ':qa<CR>'),
      }
      
      alpha.setup(dashboard.config)
    end,
  }
  
  -- Session management
  use {
    'folke/persistence.nvim',
    config = function()
      require('persistence').setup()
    end,
  }

  -- Auto-save (disabled)
  use {
    'Pocco81/auto-save.nvim',
    config = function()
      require('auto-save').setup({
        enabled = false, -- Disabled - use manual save instead
        execution_message = {
          message = function()
            return 'Auto-saved at ' .. vim.fn.strftime('%H:%M:%S')
          end,
          dim = 0.18,
          cleaning_interval = 1250,
        },
        trigger_events = { 'InsertLeave', 'TextChanged' },
        conditions = {
          exists = true,
          file_is_not_a_directory = true,
          modifiable = true,
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135,
      })
    end,
  }

  -- Undo tree visualization
  use {
    'mbbill/undotree',
    config = function()
      vim.g.undotree_SetFocusOnToggle = true
      vim.g.undotree_WindowLayout = 3
    end,
  }

  -- Project management
  -- Note: This plugin uses deprecated vim.lsp.buf_get_clients() API
  -- Update with :PackerSync to get the latest version which may have a fix
  use {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup({
        detection_methods = { 'pattern' },  -- Removed 'lsp' to avoid deprecated API usage
        patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', '.sln' },
        ignore_lsp = { '*' },  -- Ignore all LSP clients to prevent deprecated API calls
        exclude_dirs = {},
        show_hidden = false,
        silent_chdir = true,
        scope_chdir = 'global',
        datapath = vim.fn.stdpath('data'),
      })
    end,
  }

  -- Better quickfix list
  use {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    config = function()
      require('bqf').setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { '┃', '┃', '━', '━', '┏', '┓', '┗', '┛', '█' },
        },
        func_map = {
          vsplit = '',
          ptogglemode = 'z,',
          stoggleup = '',
        },
        filter = {
          fzf = {
            action_for = { ['ctrl-s'] = 'split' },
            extra_opts = { '--bind', 'ctrl-o:toggle-all', '--prompt', '> ' },
          },
        },
      })
    end,
  }

  -- Colorizer (highlight color codes)
  use {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({
        filetypes = { '*' },
        user_default_options = {
          RGB = true,
          RRGGBB = true,
          names = true,
          RRGGBBAA = true,
          AARRGGBB = false,
          rgb_fn = false,
          hsl_fn = false,
          css = false,
          css_fn = false,
          mode = 'background',
          tailwind = false,
          sass = { enable = false, parsers = { 'css' } },
          virtualtext = '■',
          always_update = false,
        },
        buftypes = {},
      })
    end,
  }

  -- AI Coding Assistant - Codeium/Windsurf (free alternative to Copilot)
  use {
    'Exafunction/codeium.vim',
    branch = 'main',
    config = function()
      -- Codeium keybindings (similar to Copilot)
      vim.keymap.set('i', '<C-J>', function() return vim.fn['codeium#Accept']() end, { expr = true, desc = 'Codeium: Accept' })
      vim.keymap.set('i', '<C-H>', function() return vim.fn['codeium#Clear']() end, { expr = true, desc = 'Codeium: Clear' })
      vim.keymap.set('i', '<C-K>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, desc = 'Codeium: Next' })
      vim.keymap.set('i', '<C-L>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, desc = 'Codeium: Previous' })
    end,
  }
  
  -- Alternative: GitHub Copilot (paid, $10/month)
  -- use {
  --   'github/copilot.vim',
  --   config = function()
  --     -- Copilot keybindings
  --     vim.g.copilot_no_tab_map = true
  --     vim.g.copilot_assume_mapped = true
  --     vim.g.copilot_tab_fallback = ''
  --     
  --     -- Custom keybindings for copilot
  --     vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
  --     vim.api.nvim_set_keymap('i', '<C-H>', '<Plug>(copilot-dismiss)', {})
  --     vim.api.nvim_set_keymap('i', '<C-K>', '<Plug>(copilot-next)', {})
  --     vim.api.nvim_set_keymap('i', '<C-L>', '<Plug>(copilot-previous)', {})
  --   end,
  -- }

  -- Quick navigation - jump to any visible text
  use {
    'ggandor/leap.nvim',
    -- No config needed - leap works with defaults
    -- Default keybindings: s (forward), S (backward), x (till forward), X (till backward), gs (from window)
  }

  -- Better command UI and popup messages (includes nvim-notify)
  use {
    'folke/noice.nvim',
    requires = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      require('noice').setup({
        lsp = {
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = false,
        },
      })
    end,
  }

  -- Better search and replace
  use {
    'nvim-pack/nvim-spectre',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('spectre').setup()
    end,
  }


  -- Quick file switching (harpoon)
  use {
    'ThePrimeagen/harpoon',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require('harpoon')
      harpoon.setup()
    end,
  }

  -- Cloak - Hide sensitive values in files
  use {
    'laytan/cloak.nvim',
    config = function()
      require('cloak').setup({
        enabled = true,
        cloak_character = '*',
        highlight_group = 'Comment',
        patterns = {
          {
            file_pattern = {
              '.env*',
              'wrangler.toml',
              '.dev.vars',
            },
            cloak_pattern = '=.+'
          },
        },
      })
    end,
  }

  -- Conform - Code formatter
  use {
    'stevearc/conform.nvim',
    config = function()
      require('conform').setup({
        format_on_save = {
          timeout_ms = 5000,
          lsp_format = 'fallback',
        },
        -- Don't show errors when formatters aren't available
        notify_on_error = false,
        formatters_by_ft = {
          c = { 'clang-format' },
          cpp = { 'clang-format' },
          lua = { 'stylua' },
          go = { 'gofmt' },
          javascript = { 'prettier' },
          javascriptreact = { 'prettier' },
          typescript = { 'prettier' },
          typescriptreact = { 'prettier' },
          elixir = { 'mix' },
        },
        formatters = {
          ['clang-format'] = {
            prepend_args = { '-style=file', '-fallback-style=LLVM' },
          },
          ['prettier'] = {
            prepend_args = { '--single-quote' },
          },
        },
      })
      vim.keymap.set('n', '<leader>f', function()
        require('conform').format({ bufnr = 0 })
      end, { desc = 'Format buffer' })
    end,
  }

  -- DAP - Debug Adapter Protocol
  -- Setup autocmd group for DAP navigation
  vim.api.nvim_create_augroup('DapGroup', { clear = true })

  -- Define navigation functions before they're used
  local function navigate(args)
    local buffer = args.buf
    local wid = nil
    local win_ids = vim.api.nvim_list_wins()
    for _, win_id in ipairs(win_ids) do
      local win_bufnr = vim.api.nvim_win_get_buf(win_id)
      if win_bufnr == buffer then
        wid = win_id
      end
    end
    if wid == nil then
      return
    end
    vim.schedule(function()
      if vim.api.nvim_win_is_valid(wid) then
        vim.api.nvim_set_current_win(wid)
      end
    end)
  end

  local function create_nav_options(name)
    return {
      group = 'DapGroup',
      pattern = string.format('*%s*', name),
      callback = navigate
    }
  end

  -- nvim-dap core
  use {
    'mfussenegger/nvim-dap',
    lazy = false,
    config = function()
      local dap = require('dap')
      dap.set_log_level('DEBUG')
      vim.keymap.set('n', '<F8>', dap.continue, { desc = 'Debug: Continue' })
      vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Debug: Step Over' })
      vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Debug: Step Into' })
      -- Changed from F12 to F9 to avoid conflict with LSP go-to-definition
      vim.keymap.set('n', '<F9>', dap.step_out, { desc = 'Debug: Step Out' })
      vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>B', function()
        dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end, { desc = 'Debug: Set Conditional Breakpoint' })
    end,
  }

  -- nvim-dap-ui
  use {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      -- Defer loading to ensure dependencies are ready
      vim.schedule(function()
        -- Clear cached failed loads
        package.loaded['dapui'] = nil
        
        local ok, dap = pcall(require, 'dap')
        if not ok then
          vim.notify('nvim-dap not available for dap-ui', vim.log.levels.WARN)
          return
        end
        
        local ok2, dapui = pcall(require, 'dapui')
        if not ok2 then
          -- Don't show error if plugin isn't installed yet
          return
        end

        local function layout(name)
          return {
            elements = {
              { id = name },
            },
            enter = true,
            size = 40,
            position = 'right',
          }
        end

        local name_to_layout = {
          repl = { layout = layout('repl'), index = 0 },
          stacks = { layout = layout('stacks'), index = 0 },
          scopes = { layout = layout('scopes'), index = 0 },
          console = { layout = layout('console'), index = 0 },
          watches = { layout = layout('watches'), index = 0 },
          breakpoints = { layout = layout('breakpoints'), index = 0 },
        }

        local layouts = {}
        for name, config in pairs(name_to_layout) do
          table.insert(layouts, config.layout)
          name_to_layout[name].index = #layouts
        end

        local function toggle_debug_ui(name)
          dapui.close()
          local layout_config = name_to_layout[name]
          if layout_config == nil then
            error(string.format('bad name: %s', name))
          end
          local uis = vim.api.nvim_list_uis()[1]
          if uis ~= nil then
            layout_config.size = uis.width
          end
          pcall(dapui.toggle, layout_config.index)
        end

        vim.keymap.set('n', '<leader>dr', function() toggle_debug_ui('repl') end, { desc = 'Debug: toggle repl ui' })
        vim.keymap.set('n', '<leader>ds', function() toggle_debug_ui('stacks') end, { desc = 'Debug: toggle stacks ui' })
        vim.keymap.set('n', '<leader>dw', function() toggle_debug_ui('watches') end, { desc = 'Debug: toggle watches ui' })
        vim.keymap.set('n', '<leader>db', function() toggle_debug_ui('breakpoints') end, { desc = 'Debug: toggle breakpoints ui' })
        vim.keymap.set('n', '<leader>dS', function() toggle_debug_ui('scopes') end, { desc = 'Debug: toggle scopes ui' })
        vim.keymap.set('n', '<leader>dc', function() toggle_debug_ui('console') end, { desc = 'Debug: toggle console ui' })

        vim.api.nvim_create_autocmd('BufEnter', {
          group = 'DapGroup',
          pattern = '*dap-repl*',
          callback = function()
            vim.wo.wrap = true
          end,
        })

        vim.api.nvim_create_autocmd('BufWinEnter', create_nav_options('dap-repl'))
        vim.api.nvim_create_autocmd('BufWinEnter', create_nav_options('DAP Watches'))

        dapui.setup({
          layouts = layouts,
          enter = true,
        })

        dap.listeners.before.event_terminated.dapui_config = function()
          dapui.close()
        end

        dap.listeners.before.event_exited.dapui_config = function()
          dapui.close()
        end

        dap.listeners.after.event_output.dapui_config = function(_, body)
          if body.category == 'console' then
            dapui.eval(body.output)
          end
        end
      end)
    end,
  }

  -- Mason - LSP/DAP/Linter/Formatter installer (must be before mason-nvim-dap)
  use {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
      -- Ensure Mason's bin directory is in PATH
      local mason_path = vim.fn.stdpath('data') .. '/mason/bin'
      vim.env.PATH = mason_path .. ':' .. vim.env.PATH
    end,
  }

  -- nvim-lspconfig (required by mason-nvim-dap)
  -- LSP configuration is now in lua/lsp.lua
  use {
    'neovim/nvim-lspconfig',
  }

  -- mason-nvim-dap
  use {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'mfussenegger/nvim-dap',
      'neovim/nvim-lspconfig',
    },
    config = function()
      -- Defer setup to ensure all dependencies are fully loaded
      vim.schedule(function()
        -- Clear any cached failed loads
        package.loaded['mason-nvim-dap'] = nil
        package.loaded['mason-core.log'] = nil
        package.loaded['mason-core'] = nil
        
        -- Ensure Mason is loaded first
        local ok, mason = pcall(require, 'mason')
        if not ok then
          -- Don't show error if plugin isn't installed yet
          return
        end

        -- Ensure Mason is set up
        if not mason.setup then
          return
        end

        local ok2, mason_dap = pcall(require, 'mason-nvim-dap')
        if not ok2 then
          -- Don't show error if plugin isn't installed yet
          return
        end

        mason_dap.setup({
          ensure_installed = {
            'delve',
          },
          automatic_installation = true,
          handlers = {
            function(config)
              mason_dap.default_setup(config)
            end,
            delve = function(config)
              table.insert(config.configurations, 1, {
                args = function() return vim.split(vim.fn.input('args> '), ' ') end,
                type = 'delve',
                name = 'file',
                request = 'launch',
                program = '${file}',
                outputMode = 'remote',
              })
              table.insert(config.configurations, 1, {
                args = function() return vim.split(vim.fn.input('args> '), ' ') end,
                type = 'delve',
                name = 'file args',
                request = 'launch',
                program = '${file}',
                outputMode = 'remote',
              })
              mason_dap.default_setup(config)
            end,
          },
        })
      end)
    end,
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
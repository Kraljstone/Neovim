local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- LSP navigation is handled in lsp.lua with buffer-local keymaps
-- Standard Neovim keybindings: gd (definition), gr (references), gD (declaration), gi (implementation)

-- Better navigation
map('n', 'j', 'jzz', opts)
map('n', 'k', 'kzz', opts)
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)

-- File explorer
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>E', ':NvimTreeFocus<CR>', opts)
map('n', '-', ':Oil<CR>', opts)  -- Oil.nvim file explorer

-- File operations
map('n', '<leader>nf', ':lua vim.ui.input({prompt = "New file: "}, function(name) if name then vim.fn.writefile({}, name) vim.cmd("edit " .. name) end end)<CR>', opts)
map('n', '<leader>nd', ':lua vim.ui.input({prompt = "New folder: "}, function(name) if name then vim.fn.mkdir(name, "p") end end)<CR>', opts)

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
map('n', '<leader>fr', ':Telescope oldfiles<CR>', opts)
map('n', '<leader>fe', ':Telescope file_browser<CR>', opts)  -- Telescope file browser

-- Search
map('n', '<leader>H', ':nohlsearch<CR>', opts)  -- Clear highlights (Shift+H to avoid harpoon conflict)
map('n', '<Esc>', function()
  -- Clear search highlight when pressing Esc in normal mode
  if vim.fn.mode() == 'n' then
    vim.cmd('nohlsearch')
  end
end, { noremap = true, silent = true })

-- File operations
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>Q', ':q!<CR>', opts)

-- Window navigation
map('n', '<C-h>', '<C-w>h', opts)  -- Move to left window (file tree)
map('n', '<C-j>', '<C-w>j', opts)  -- Move to window below
map('n', '<C-k>', '<C-w>k', opts)  -- Move to window above
map('n', '<C-l>', '<C-w>l', opts)  -- Move to right window (code)

-- Resize windows
map('n', '<A-h>', ':vertical resize -2<CR>', opts)
map('n', '<A-j>', ':resize -2<CR>', opts)
map('n', '<A-k>', ':resize +2<CR>', opts)
map('n', '<A-l>', ':vertical resize +2<CR>', opts)

-- Move lines
map('v', 'J', ":m '>+1<CR>gv=gv", opts)
map('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Better indenting
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Terminal
map('n', '<leader>t', ':ToggleTerm<CR>', opts)
map('t', '<Esc>', '<C-\\><C-n>', opts)

-- Buffer navigation
map('n', '<Tab>', ':BufferLineCycleNext<CR>', opts)      -- Next buffer (Tab)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)    -- Previous buffer (Shift+Tab)
map('n', '<leader>bn', ':BufferLineCycleNext<CR>', opts)  -- Next buffer
map('n', '<leader>bp', ':BufferLineCyclePrev<CR>', opts)  -- Previous buffer
map('n', '<leader>bc', ':bd<CR>', opts)                   -- Close current buffer (like X button)
map('n', '<leader>bd', ':BufferLinePickClose<CR>', opts)  -- Pick and close buffer
map('n', '<leader>bb', ':Telescope buffers<CR>', opts)   -- List all buffers
map('n', '<leader>ba', function()
  -- Close all buffers except the current one
  local current_buf = vim.api.nvim_get_current_buf()
  local buffers = vim.api.nvim_list_bufs()
  for _, buf in ipairs(buffers) do
    if vim.api.nvim_buf_is_valid(buf) and buf ~= current_buf then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, opts)  -- Close all buffers except current

-- Diagnostics
map('n', '<leader>xx', ':TroubleToggle<CR>', opts)
map('n', '<leader>xw', ':TroubleToggle workspace_diagnostics<CR>', opts)
map('n', '<leader>xd', ':TroubleToggle document_diagnostics<CR>', opts)

-- Sessions
map('n', '<leader>qs', ':lua require("persistence").load()<CR>', opts)
map('n', '<leader>ql', ':lua require("persistence").load({ last = true })<CR>', opts)
map('n', '<leader>qd', ':lua require("persistence").stop()<CR>', opts)

-- Search and replace (Spectre)
map('n', '<leader>sr', ':lua require("spectre").open()<CR>', opts)  -- Open search and replace
map('n', '<leader>sw', ':lua require("spectre").open_visual({select_word=true})<CR>', opts)  -- Search current word

-- Harpoon (quick file switching)
map('n', '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>', opts)  -- Add file to harpoon
map('n', '<leader>hh', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)  -- Toggle harpoon menu
map('n', '<leader>h1', ':lua require("harpoon.ui").nav_file(1)<CR>', opts)  -- Go to file 1
map('n', '<leader>h2', ':lua require("harpoon.ui").nav_file(2)<CR>', opts)  -- Go to file 2
map('n', '<leader>h3', ':lua require("harpoon.ui").nav_file(3)<CR>', opts)  -- Go to file 3
map('n', '<leader>h4', ':lua require("harpoon.ui").nav_file(4)<CR>', opts)  -- Go to file 4

-- Git - View changes
map('n', '<leader>gd', ':DiffviewOpen<CR>', opts)  -- Open diff view (all changes)
map('n', '<leader>gD', ':DiffviewClose<CR>', opts)  -- Close diff view
map('n', '<leader>gh', ':DiffviewFileHistory<CR>', opts)  -- View file history
map('n', '<leader>gs', ':Git<CR>', opts)  -- Open git status (fugitive)
map('n', '<leader>gb', ':Git blame<CR>', opts)  -- View git blame
map('n', '<leader>gl', ':Git log<CR>', opts)  -- View git log

-- Undo tree
map('n', '<leader>u', ':UndotreeToggle<CR>', opts)  -- Toggle undo tree

-- Better paste handling
-- Check if buffer is modifiable before pasting
map('n', 'p', function()
  if vim.bo.modifiable then
    vim.cmd('normal! p')
  else
    vim.notify('Cannot paste: buffer is not modifiable', vim.log.levels.WARN)
  end
end, { noremap = true, silent = false })

map('n', 'P', function()
  if vim.bo.modifiable then
    vim.cmd('normal! P')
  else
    vim.notify('Cannot paste: buffer is not modifiable', vim.log.levels.WARN)
  end
end, { noremap = true, silent = false })

-- Visual mode paste (replace selection)
map('v', 'p', function()
  if vim.bo.modifiable then
    vim.cmd('normal! "_dP')
  else
    vim.notify('Cannot paste: buffer is not modifiable', vim.log.levels.WARN)
  end
end, { noremap = true, silent = false })

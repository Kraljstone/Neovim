-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/aenima/.cache/nvim/packer_hererocks/2.1.1753364724/share/lua/5.1/?.lua;/Users/aenima/.cache/nvim/packer_hererocks/2.1.1753364724/share/lua/5.1/?/init.lua;/Users/aenima/.cache/nvim/packer_hererocks/2.1.1753364724/lib/luarocks/rocks-5.1/?.lua;/Users/aenima/.cache/nvim/packer_hererocks/2.1.1753364724/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/aenima/.cache/nvim/packer_hererocks/2.1.1753364724/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\nê\n\0\0\t\0\26\00106\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\3\0019\2\a\0024\3\6\0009\4\b\1'\6\t\0'\a\n\0'\b\v\0B\4\4\2>\4\1\0039\4\b\1'\6\f\0'\a\r\0'\b\14\0B\4\4\2>\4\2\0039\4\b\1'\6\15\0'\a\16\0'\b\17\0B\4\4\2>\4\3\0039\4\b\1'\6\18\0'\a\19\0'\b\20\0B\4\4\2>\4\4\0039\4\b\1'\6\21\0'\a\22\0'\b\23\0B\4\4\0?\4\0\0=\3\5\0029\2\24\0009\4\25\1B\2\2\1K\0\1\0\vconfig\nsetup\f:qa<CR>\r‚ùå Quit\6q\29:Telescope live_grep<CR>\19üîé Find text\6g\28:Telescope oldfiles<CR>\22üìÇ Recent files\6r\30:Telescope find_files<CR>\19üîç Find file\6f\31:ene <BAR> startinsert<CR>\18üìÅ New file\6e\vbutton\fbuttons\1\a\0\0Ö\1‚ñà‚ñà‚ñà‚ïó   ‚ñà‚ñà‚ïó‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó ‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó ‚ñà‚ñà‚ïó   ‚ñà‚ñà‚ïó‚ñà‚ñà‚ïó‚ñà‚ñà‚ñà‚ïó   ‚ñà‚ñà‚ñà‚ïóè\1‚ñà‚ñà‚ñà‚ñà‚ïó  ‚ñà‚ñà‚ïë‚ñà‚ñà‚ïî‚ïê‚ïê‚ïê‚ïê‚ïù‚ñà‚ñà‚ïî‚ïê‚ïê‚ïê‚ñà‚ñà‚ïó‚ñà‚ñà‚ïë   ‚ñà‚ñà‚ïë‚ñà‚ñà‚ïë‚ñà‚ñà‚ñà‚ñà‚ïó ‚ñà‚ñà‚ñà‚ñà‚ïëâ\1‚ñà‚ñà‚ïî‚ñà‚ñà‚ïó ‚ñà‚ñà‚ïë‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó  ‚ñà‚ñà‚ïë   ‚ñà‚ñà‚ïë‚ñà‚ñà‚ïë   ‚ñà‚ñà‚ïë‚ñà‚ñà‚ïë‚ñà‚ñà‚ïî‚ñà‚ñà‚ñà‚ñà‚ïî‚ñà‚ñà‚ïëè\1‚ñà‚ñà‚ïë‚ïö‚ñà‚ñà‚ïó‚ñà‚ñà‚ïë‚ñà‚ñà‚ïî‚ïê‚ïê‚ïù  ‚ñà‚ñà‚ïë   ‚ñà‚ñà‚ïë‚ïö‚ñà‚ñà‚ïó ‚ñà‚ñà‚ïî‚ïù‚ñà‚ñà‚ïë‚ñà‚ñà‚ïë‚ïö‚ñà‚ñà‚ïî‚ïù‚ñà‚ñà‚ïëë\1‚ñà‚ñà‚ïë ‚ïö‚ñà‚ñà‚ñà‚ñà‚ïë‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó‚ïö‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïî‚ïù ‚ïö‚ñà‚ñà‚ñà‚ñà‚ïî‚ïù ‚ñà‚ñà‚ïë‚ñà‚ñà‚ïë ‚ïö‚ïê‚ïù ‚ñà‚ñà‚ïëÅ\1‚ïö‚ïê‚ïù  ‚ïö‚ïê‚ïê‚ïê‚ïù‚ïö‚ïê‚ïê‚ïê‚ïê‚ïê‚ïê‚ïù ‚ïö‚ïê‚ïê‚ïê‚ïê‚ïê‚ïù   ‚ïö‚ïê‚ïê‚ïê‚ïù  ‚ïö‚ïê‚ïù‚ïö‚ïê‚ïù     ‚ïö‚ïê‚ïù\bval\vheader\fsection\27alpha.themes.dashboard\nalpha\frequire\vÄÄ¿ô\4\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["auto-save.nvim"] = {
    config = { "\27LJ\2\nO\0\0\4\0\5\0\b'\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0B\1\2\2&\0\1\0L\0\2\0\r%H:%M:%S\rstrftime\afn\bvim\19Auto-saved at õ\3\1\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0003\4\4\0=\4\6\3=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\15conditions\1\0\3\15modifiable\2\28file_is_not_a_directory\2\vexists\2\19trigger_events\1\3\0\0\16InsertLeave\16TextChanged\22execution_message\fmessage\1\0\3\22cleaning_interval\3‚\t\fmessage\0\bdim\4äÆèÖ\aΩîú˛\3\0\1\0\b\15conditions\0 clean_command_line_interval\3\0\22execution_message\0\19trigger_events\0\20on_off_commands\2\22write_all_buffers\1\fenabled\1\19debounce_delay\3á\1\nsetup\14auto-save\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/auto-save.nvim",
    url = "https://github.com/Pocco81/auto-save.nvim"
  },
  ["better-escape.nvim"] = {
    config = { "\27LJ\2\n_\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\ftimeout\3»\1\21default_mappings\2\nsetup\18better_escape\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/better-escape.nvim",
    url = "https://github.com/max397574/better-escape.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\nï\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\1\foptions\0\1\0\3\20separator_style\tthin\27always_show_bufferline\2\tmode\fbuffers\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cloak.nvim"] = {
    config = { "\27LJ\2\nÍ\1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\3\0005\4\5\0005\5\4\0=\5\6\4>\4\1\3=\3\a\2B\0\2\1K\0\1\0\rpatterns\17file_pattern\1\0\2\18cloak_pattern\b=.+\17file_pattern\0\1\4\0\0\n.env*\18wrangler.toml\14.dev.vars\1\0\4\20highlight_group\fComment\rpatterns\0\fenabled\2\20cloak_character\6*\nsetup\ncloak\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/cloak.nvim",
    url = "https://github.com/laytan/cloak.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    config = { "\27LJ\2\nö\3\0\0\v\0\15\0\0276\0\0\0009\0\1\0009\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0015\0\6\0006\1\a\0\18\3\0\0B\1\2\4H\4\fÄ'\6\b\0\18\a\4\0&\6\a\0066\a\0\0009\a\t\a9\a\n\a\18\t\6\0005\n\v\0=\5\f\n=\6\r\n=\6\14\nB\a\3\1F\4\3\3R\4Ú\127K\0\1\0\nnumhl\vtexthl\ttext\1\0\3\vtexthl\0\ttext\0\nnumhl\0\16sign_define\afn\19DiagnosticSign\npairs\1\0\4\tWarn\b‚ö†\nError\b‚úó\tHint\tüí°\tInfo\b‚Ñπ\nfloat\1\0\6\vsource\valways\14focusable\1\vheader\5\vprefix\5\vborder\frounded\nstyle\fminimal\1\0\6\nfloat\0\18severity_sort\2\14underline\2\21update_in_insert\1\nsigns\2\17virtual_text\2\vconfig\15diagnostic\bvim\30\1\0\3\0\2\0\0046\0\0\0003\2\1\0B\0\2\1K\0\1\0\0\npcall)\1\0\3\0\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\0\rschedule\bvim\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["codeium.vim"] = {
    config = { "\27LJ\2\n-\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\19codeium#Accept\afn\bvim,\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\18codeium#Clear\afn\bvim;\0\0\3\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\2\1\0D\0\2\0\29codeium#CycleCompletions\afn\bvim;\0\0\3\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\2ˇˇD\0\2\0\29codeium#CycleCompletions\afn\bvimØ\2\1\0\6\0\16\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0003\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0003\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0003\4\14\0005\5\15\0B\0\5\1K\0\1\0\1\0\2\texpr\2\tdesc\22Codeium: Previous\0\n<C-L>\1\0\2\texpr\2\tdesc\18Codeium: Next\0\n<C-K>\1\0\2\texpr\2\tdesc\19Codeium: Clear\0\n<C-H>\1\0\2\texpr\2\tdesc\20Codeium: Accept\0\n<C-J>\6i\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/codeium.vim",
    url = "https://github.com/Exafunction/codeium.vim"
  },
  ["conform.nvim"] = {
    config = { "\27LJ\2\nE\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\nbufnr\3\0\vformat\fconform\frequire»\6\1\0\6\0*\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\3=\3\25\0025\3\29\0005\4\27\0005\5\26\0=\5\28\4=\4\30\0035\4 \0005\5\31\0=\5\28\4=\4!\3=\3\"\2B\0\2\0016\0#\0009\0$\0009\0%\0'\2&\0'\3'\0003\4(\0005\5)\0B\0\5\1K\0\1\0\1\0\1\tdesc\18Format buffer\0\14<leader>f\6n\bset\vkeymap\bvim\15formatters\rprettier\1\0\1\17prepend_args\0\1\2\0\0\19--single-quote\17clang-format\1\0\2\17clang-format\0\rprettier\0\17prepend_args\1\0\1\17prepend_args\0\1\3\0\0\16-style=file\25-fallback-style=LLVM\21formatters_by_ft\velixir\1\2\0\0\bmix\20typescriptreact\1\2\0\0\rprettier\15typescript\1\2\0\0\rprettier\20javascriptreact\1\2\0\0\rprettier\15javascript\1\2\0\0\rprettier\ago\1\2\0\0\ngofmt\blua\1\2\0\0\vstylua\bcpp\1\2\0\0\17clang-format\6c\1\0\t\ago\0\bcpp\0\6c\0\15typescript\0\15javascript\0\blua\0\velixir\0\20typescriptreact\0\20javascriptreact\0\1\2\0\0\17clang-format\19format_on_save\1\0\4\21formatters_by_ft\0\19format_on_save\0\20notify_on_error\1\15formatters\0\1\0\2\15timeout_ms\3à'\15lsp_format\rfallback\nsetup\fconform\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  ["diffview.nvim"] = {
    config = { "\27LJ\2\nx\2\1\5\1\4\0\0166\1\0\0\18\3\0\0B\1\2\2\a\1\1\0X\1\aÄ\18\3\0\0009\1\2\0'\4\3\0B\1\3\2\15\0\1\0X\2\1ÄK\0\1\0-\1\0\0\18\3\0\0G\4\1\0C\1\1\0\t¿!Failed to create diff buffer\nmatch\vstring\ttypeï\1\2\0\a\1\5\0\0216\0\0\0-\2\0\0G\3\0\0A\0\1\3\14\0\0\0X\2\14Ä6\2\1\0\18\4\1\0B\2\2\2\18\5\2\0009\3\2\2'\6\3\0B\3\3\2\15\0\3\0X\4\2Ä+\3\0\0L\3\2\0006\3\4\0\18\5\1\0B\3\2\1L\1\2\0\t¿\nerror!Failed to create diff buffer\nmatch\rtostring\npcallû\3\1\0\f\0\f\1<5\0\0\0)\1\0\0006\2\1\0\18\4\0\0B\2\2\4X\5,Ä6\a\2\0006\t\3\0\18\n\6\0B\a\3\3\15\0\a\0X\t&Ä\15\0\b\0X\t$Ä9\t\4\b\15\0\t\0X\n\15Ä6\t\5\0009\v\4\bB\t\2\2\a\t\6\0X\t\nÄ9\t\a\b\14\0\t\0X\t\aÄ9\t\4\b3\n\b\0=\n\4\b+\n\2\0=\n\a\b\22\1\0\0012\t\0Ä9\t\t\b\15\0\t\0X\n\15Ä6\t\5\0009\v\t\bB\t\2\2\a\t\6\0X\t\nÄ9\t\n\b\14\0\t\0X\t\aÄ9\t\t\b3\n\v\0=\n\t\b+\n\2\0=\n\n\b\22\1\0\0012\t\0ÄE\5\3\3R\5“\127)\2\0\0\0\2\1\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0002\0\0ÄL\2\2\0\0 _create_diff_buffer_patched\23create_diff_buffer\0\19_error_patched\rfunction\ttype\nerror\frequire\npcall\vipairs\1\5\0\0\20diffview.buffer\19diffview.utils\17diffview.log\17diffview.lib\2 \0\0\3\2\0\1\5-\0\0\0-\2\1\0\23\2\0\2B\0\2\1K\0\1\0\1\0\0¿\2Y\1\1\6\2\3\0\16)\1\0\0\3\0\1\0X\1\1Ä2\0\vÄ-\1\0\0B\1\1\2\14\0\1\0X\2\5Ä6\2\0\0009\2\1\0023\4\2\0)\5d\0B\2\3\0012\0\0ÄK\0\1\0K\0\1\0\0¿\1¿\0\rdefer_fn\bvim\25\0\0\3\1\0\0\4-\0\0\0)\2\n\0B\0\2\1K\0\1\0\1¿\21\0\0\2\1\0\0\3-\0\0\0B\0\1\1K\0\1\0\0\0+\1\0\3\1\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\0¿\0\rschedule\bvim˘\2\0\0\r\0\r\0;6\0\0\0009\0\1\0009\0\2\0B\0\1\0024\1\0\0006\2\3\0\18\4\0\0B\2\2\4X\5\23Ä6\a\0\0009\a\1\a9\a\4\a\18\t\6\0B\a\2\2\15\0\a\0X\b\16Ä6\a\5\0006\t\0\0009\t\1\t9\t\6\t\18\n\6\0'\v\a\0B\a\4\3\15\0\a\0X\t\aÄ\15\0\b\0X\t\5Ä6\t\b\0009\t\t\t\18\v\1\0\18\f\6\0B\t\3\1E\5\3\3R\5Á\127\21\2\1\0)\3\1\0\1\3\2\0X\2\20Ä6\2\3\0\18\4\1\0B\2\2\4X\5\14Ä6\a\0\0009\a\1\a9\a\n\a\18\t\6\0'\n\v\0+\v\2\0B\a\4\0016\a\0\0009\a\1\a9\a\n\a\18\t\6\0'\n\f\0+\v\2\0B\a\4\1E\5\3\3R\5\127K\0\1\0\15cursorbind\15scrollbind\24nvim_win_set_option\vinsert\ntable\tdiff\24nvim_win_get_option\npcall\22nvim_win_is_valid\vipairs\19nvim_list_wins\bapi\bvimF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18prev_conflict\21diffview.actions\frequireF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18next_conflict\21diffview.actions\frequireF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18prev_conflict\21diffview.actions\frequireF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18next_conflict\21diffview.actions\frequireC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\15next_entry\21diffview.actions\frequireC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\15prev_entry\21diffview.actions\frequireD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\16focus_files\21diffview.actions\frequire¢\2\1\0\r\1\n\0-6\0\0\0003\2\1\0B\0\2\3\14\0\0\0X\2%Ä6\2\2\0009\2\3\0029\2\4\2B\2\1\0026\3\5\0\18\5\2\0B\3\2\4X\6\26Ä6\b\2\0009\b\3\b9\b\6\b\18\n\a\0B\b\2\2\15\0\b\0X\t\19Ä6\b\0\0006\n\2\0009\n\3\n9\n\a\n\18\v\a\0'\f\b\0B\b\4\3\15\0\b\0X\n\nÄ\15\0\t\0X\n\bÄ6\n\2\0009\n\3\n9\n\t\n\18\f\a\0B\n\2\1-\n\0\0B\n\1\1X\3\5ÄE\6\3\3R\6‰\127X\2\2Ä-\2\0\0B\2\1\1K\0\1\0\0\0\25nvim_set_current_win\tdiff\24nvim_win_get_option\22nvim_win_is_valid\vipairs\19nvim_list_wins\bapi\bvim\0\npcallÅ\2\0\0\v\1\t\0%6\0\0\0009\0\1\0009\0\2\0B\0\1\0026\1\3\0\18\3\0\0B\1\2\4X\4\26Ä6\6\0\0009\6\1\0069\6\4\6\18\b\5\0B\6\2\2\15\0\6\0X\a\19Ä6\6\5\0006\b\0\0009\b\1\b9\b\6\b\18\t\5\0'\n\a\0B\6\4\3\15\0\6\0X\b\nÄ\15\0\a\0X\b\bÄ6\b\0\0009\b\1\b9\b\b\b\18\n\5\0B\b\2\1-\b\0\0B\b\1\1X\1\2ÄE\4\3\3R\4‰\127K\0\1\0\0\0\25nvim_set_current_win\tdiff\24nvim_win_get_option\npcall\22nvim_win_is_valid\vipairs\19nvim_list_wins\bapi\bvimD\1\0\4\1\4\0\v6\0\0\0009\0\1\0003\2\2\0)\3ñ\0B\0\3\0016\0\0\0009\0\1\0003\2\3\0)\3,\1B\0\3\1K\0\1\0\0\0\0\0\rdefer_fn\bvime\1\0\3\1\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0003\2\5\0B\0\2\1K\0\1\0\0\0\0\rschedule\bvim\17select_entry\21diffview.actions\frequire(\1\0\3\1\2\0\0066\0\0\0003\2\1\0B\0\2\3\14\0\0\0X\2\0ÄK\0\1\0\2¿\0\npcallE\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\17select_entry\21diffview.actions\frequireD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\16focus_entry\21diffview.actions\frequire\v\0\0\1\0\0\0\1K\0\1\0V\0\0\4\1\2\0\0166\0\0\0009\0\1\0-\2\0\0)\0032\0B\0\3\0016\0\0\0009\0\1\0-\2\0\0)\3ñ\0B\0\3\0016\0\0\0009\0\1\0-\2\0\0)\3,\1B\0\3\1K\0\1\0\0\0\rdefer_fn\bvim+\1\0\3\1\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\2¿\0\rschedule\bvim \0\0\3\2\0\1\5-\0\0\0-\2\1\0\22\2\0\2B\0\2\1K\0\1\0\1\0\0Ä\2’\2\1\1\r\2\v\0007\14\0\0\0X\1\1Ä)\0\0\0)\1\5\0\1\1\0\0X\1\1Ä2\0/Ä6\1\0\0009\1\1\0019\1\2\1B\1\1\2+\2\1\0006\3\3\0\18\5\1\0B\3\2\4X\6\27Ä6\b\0\0009\b\1\b9\b\4\b\18\n\a\0B\b\2\2\15\0\b\0X\t\20Ä6\b\5\0006\n\0\0009\n\1\n9\n\6\n\18\v\a\0'\f\a\0B\b\4\3\15\0\b\0X\n\vÄ\15\0\t\0X\n\tÄ6\n\0\0009\n\1\n9\n\b\n\18\f\a\0B\n\2\1-\n\0\0B\n\1\1+\2\2\0X\3\2ÄE\6\3\3R\6„\127\14\0\2\0X\3\5Ä6\3\0\0009\3\t\0033\5\n\0)\6d\0B\3\3\0012\0\0ÄK\0\1\0K\0\1\0\0\0\0¿\0\rdefer_fn\25nvim_set_current_win\tdiff\24nvim_win_get_option\npcall\22nvim_win_is_valid\vipairs\19nvim_list_wins\bapi\bvim#\0\0\3\2\0\0\6-\0\0\0B\0\1\1-\0\1\0)\2\0\0B\0\2\1K\0\1\0\0\0\0¿L\1\0\5\1\4\0\r3\0\0\0006\1\1\0009\1\2\0013\3\3\0)\0042\0B\1\3\0016\1\1\0009\1\2\1-\3\0\0)\4»\0B\1\3\0012\0\0ÄK\0\1\0\0\0\0\rdefer_fn\bvim\0+\1\0\3\1\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\2¿\0\rschedule\bvim\21\0\0\2\1\0\0\3-\0\0\0B\0\1\1K\0\1\0\0\0}\1\0\3\1\a\0\0186\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\fÄ6\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\5\0003\2\6\0B\0\2\1K\0\1\0\2¿\0\rschedule\15cursorbind\15scrollbind\tdiff\awo\bvim€\t\1\0\t\0@\0[3\0\0\0003\1\1\0006\2\2\0009\2\3\0023\4\4\0B\2\2\0016\2\2\0009\2\5\0029\2\6\2'\4\a\0005\5\b\0003\6\t\0=\6\n\5B\2\3\0013\2\v\0006\3\f\0'\5\r\0B\3\2\0029\3\14\0035\5\20\0005\6\16\0005\a\15\0=\a\17\0065\a\18\0=\a\19\6=\6\21\0055\6\22\0005\a\23\0=\a\24\0065\a\25\0=\a\26\6=\6\27\0055\6\29\0005\a\28\0=\a\26\6=\6\30\0055\6(\0005\a \0003\b\31\0=\b!\a3\b\"\0=\b#\a3\b$\0=\b%\a3\b&\0=\b'\a=\a\21\0065\a*\0003\b)\0=\b+\a3\b,\0=\b-\a3\b.\0=\b/\a3\b0\0=\b1\a3\b2\0=\b3\a=\a\27\6=\0064\0055\0066\0003\a5\0=\a7\6=\0068\5B\3\2\0016\3\2\0009\3\5\0039\3\6\3'\5\a\0005\0069\0003\a:\0=\a\n\6B\3\3\0016\3\2\0009\3\5\0039\3\6\3'\5\a\0005\6;\0003\a<\0=\a\n\6B\3\3\0016\3\2\0009\3\5\0039\3\6\0035\5=\0005\6?\0003\a>\0=\a\n\6B\3\3\0012\0\0ÄK\0\1\0\1\0\1\rcallback\0\0\1\4\0\0\rWinEnter\16BufWinEnter\vWinNew\0\1\0\2\rcallback\0\fpattern\23DiffviewFileOpened\0\1\0\2\rcallback\0\fpattern\23DiffviewViewOpened\nhooks\18diff_buf_read\1\0\1\18diff_buf_read\0\0\fkeymaps\n<Tab>\0\6o\0\t<CR>\0\6k\0\6j\1\0\5\t<CR>\0\n<Tab>\0\6o\0\6j\0\6k\0\0\1\0\2\tview\0\15file_panel\0\a]x\0\a[x\0\a]c\0\a[c\1\0\4\a[x\0\a[c\0\a]c\0\a]x\0\0\23file_history_panel\1\0\1\15win_config\0\1\0\2\vheight\3\16\rposition\vbottom\15file_panel\15win_config\1\0\2\nwidth\0032\rposition\tleft\17tree_options\1\0\2\20folder_statuses\16only_folded\17flatten_dirs\2\1\0\3\15win_config\0\17tree_options\0\18listing_style\ttree\tview\1\0\t\tview\0\fkeymaps\0\15file_panel\0\nhooks\0\20show_help_hints\1\14use_icons\2\21enhanced_diff_hl\1\18diff_binaries\1\23file_history_panel\0\15merge_tool\1\0\2\vlayout\21diff3_horizontal\24disable_diagnostics\2\fdefault\1\0\2\fdefault\0\15merge_tool\0\1\0\2\vlayout\21diff2_horizontal\16winbar_info\2\nsetup\rdiffview\frequire\0\rcallback\0\1\0\3\rcallback\0\tonce\2\fpattern\23DiffviewViewOpened\tUser\24nvim_create_autocmd\bapi\0\rschedule\bvim\0\0\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  dracula = {
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/dracula",
    url = "https://github.com/dracula/vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  harpoon = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\nsetup\fharpoon\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n|\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\nscope\1\0\1\fenabled\2\vindent\1\0\2\vindent\0\nscope\0\1\0\1\tchar\b‚îÇ\nsetup\bibl\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["leap.nvim"] = {
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n%\0\0\3\0\3\0\0046\0\0\0009\0\1\0'\2\2\0D\0\2\0\n%H:%M\tdate\aos+\0\1\5\0\2\0\a'\1\0\0\18\4\0\0009\2\1\0B\2\2\2'\3\0\0&\1\3\1L\1\2\0\nupper\6 \29\0\1\4\0\1\0\5'\1\0\0\18\2\0\0'\3\0\0&\1\3\1L\1\2\0\6 +\0\1\5\0\2\0\a'\1\0\0\18\4\0\0009\2\1\0B\2\2\2'\3\0\0&\1\3\1L\1\2\0\nupper\6 +\0\1\5\0\2\0\a'\1\0\0\18\4\0\0009\2\1\0B\2\2\2'\3\0\0&\1\3\1L\1\2\0\nupper\6 \29\0\1\4\0\1\0\5'\1\0\0\18\2\0\0'\3\0\0&\1\3\1L\1\2\0\6 \29\0\1\4\0\1\0\5'\1\0\0\18\2\0\0'\3\0\0&\1\3\1L\1\2\0\6 \29\0\1\4\0\1\0\5'\1\0\0\18\2\0\0'\3\0\0&\1\3\1L\1\2\0\6 ÿ\r\1\0\n\0@\0v6\0\0\0009\0\1\0)\1\3\0=\1\2\0003\0\3\0006\1\4\0006\3\5\0'\4\6\0B\1\3\3\14\0\1\0X\3\2Ä2\0\0ÄK\0\1\0009\3\a\0025\5\17\0005\6\b\0005\a\t\0=\a\n\0065\a\v\0=\a\f\0065\a\r\0004\b\0\0=\b\14\a4\b\0\0=\b\15\a=\a\16\6=\6\18\0055\6\24\0004\a\3\0005\b\19\0003\t\20\0=\t\21\b5\t\22\0=\t\23\b>\b\1\a=\a\25\0064\a\4\0005\b\26\0003\t\27\0=\t\21\b5\t\28\0=\t\23\b>\b\1\a5\b\29\0005\t\30\0=\t\31\b5\t \0=\t\23\b>\b\2\a5\b!\0005\t\"\0=\t\31\b5\t#\0=\t\23\b>\b\3\a=\a$\0064\a\3\0005\b%\0005\t&\0=\t\31\b5\t'\0=\t\23\b>\b\1\a=\a(\0064\a\4\0005\b)\0003\t*\0=\t\21\b5\t+\0=\t\23\b>\b\1\a5\b,\0003\t-\0=\t\21\b5\t.\0=\t\23\b>\b\2\a5\b/\0>\0\1\b3\t0\0=\t\21\b5\t1\0=\t\23\b>\b\3\a=\a2\0064\a\3\0005\b3\0003\t4\0=\t\21\b5\t5\0=\t\23\b>\b\1\a=\a6\0064\a\3\0005\b7\0003\t8\0=\t\21\b5\t9\0=\t\23\b>\b\1\a=\a:\6=\6;\0055\6<\0004\a\0\0=\a\25\0064\a\0\0=\a$\0065\a=\0=\a(\0065\a>\0=\a2\0064\a\0\0=\a6\0064\a\0\0=\a:\6=\6?\5B\3\2\1K\0\1\0\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\6\14lualine_y\0\14lualine_c\0\14lualine_x\0\14lualine_a\0\14lualine_z\0\14lualine_b\0\rsections\14lualine_z\1\0\2\nright\5\tleft\6 \0\1\2\2\0\rlocation\bfmt\0\14separator\0\14lualine_y\1\0\2\nright\6 \tleft\6 \0\1\2\2\0\rprogress\bfmt\0\14separator\0\14lualine_x\1\0\2\nright\5\tleft\6 \0\1\0\3\14separator\0\ticon\tÛ∞•î\bfmt\0\1\0\2\nright\6 \tleft\6 \0\1\2\2\0\rencoding\bfmt\0\14separator\0\1\0\2\nright\6 \tleft\a  \0\1\2\3\0\rfiletype\14separator\0\14icon_only\1\bfmt\0\14lualine_c\1\0\2\nright\6 \tleft\bÓÇ≤\1\0\4\funnamed\15 [No Name]\rmodified\t ‚óè\rreadonly\n Û∞à°\fnewfile\v [New]\1\2\4\0\rfilename\16file_status\2\14separator\0\tpath\3\1\fsymbols\0\14lualine_b\1\0\1\nright\bÓÇ∞\1\0\4\thint\nüí° \tinfo\t‚Ñπ \nerror\t‚úó \twarn\t‚ö† \1\2\2\0\16diagnostics\14separator\0\fsymbols\0\1\0\1\nright\bÓÇ∞\fsymbols\1\0\3\nadded\nÛ∞êï \rmodified\nÛ∞è´ \fremoved\nÛ∞ç¥ \1\2\2\0\tdiff\14separator\0\fsymbols\0\1\0\1\nright\bÓÇ∞\0\1\2\3\0\vbranch\14separator\0\ticon\tÛ∞ò¨\bfmt\0\14lualine_a\1\0\6\14lualine_y\0\14lualine_c\0\14lualine_x\0\14lualine_a\0\14lualine_z\0\14lualine_b\0\14separator\1\0\1\nright\bÓÇ∞\bfmt\0\1\2\2\0\tmode\bfmt\0\14separator\0\foptions\1\0\3\rsections\0\foptions\0\22inactive_sections\0\23disabled_filetypes\vwinbar\15statusline\1\0\2\15statusline\0\vwinbar\0\23section_separators\1\0\2\nright\5\tleft\5\25component_separators\1\0\2\nright\5\tleft\5\1\0\6\17globalstatus\1\25always_divide_middle\2\23section_separators\0\23disabled_filetypes\0\25component_separators\0\ntheme\tauto\nsetup\flualine\frequire\npcall\0\15laststatus\bopt\bvim)\1\0\3\0\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\0\rschedule\bvim\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-nvim-dap.nvim"] = {
    config = { "\27LJ\2\n+\0\1\4\1\1\0\5-\1\0\0009\1\0\1\18\3\0\0B\1\2\1K\0\1\0\3¿\18default_setupG\0\0\5\0\6\0\t6\0\0\0009\0\1\0006\2\0\0009\2\2\0029\2\3\2'\4\4\0B\2\2\2'\3\5\0D\0\3\0\6 \vargs> \ninput\afn\nsplit\bvimG\0\0\5\0\6\0\t6\0\0\0009\0\1\0006\2\0\0009\2\2\0029\2\3\2'\4\4\0B\2\2\2'\3\5\0D\0\3\0\6 \vargs> \ninput\afn\nsplit\bvim±\2\1\1\a\1\t\0\0216\1\0\0009\1\1\0019\3\2\0)\4\1\0005\5\4\0003\6\3\0=\6\5\5B\1\4\0016\1\0\0009\1\1\0019\3\2\0)\4\1\0005\5\a\0003\6\6\0=\6\5\5B\1\4\1-\1\0\0009\1\b\1\18\3\0\0B\1\2\1K\0\1\0\3¿\18default_setup\1\0\6\frequest\vlaunch\tname\14file args\targs\0\15outputMode\vremote\ttype\ndelve\fprogram\f${file}\0\targs\1\0\6\frequest\vlaunch\tname\tfile\targs\0\15outputMode\vremote\ttype\ndelve\fprogram\f${file}\0\19configurations\vinsert\ntable˛\2\1\0\t\0\17\0.6\0\0\0009\0\1\0+\1\0\0=\1\2\0006\0\0\0009\0\1\0+\1\0\0=\1\3\0006\0\0\0009\0\1\0+\1\0\0=\1\4\0006\0\5\0006\2\6\0'\3\a\0B\0\3\3\14\0\0\0X\2\1Ä2\0\24Ä9\2\b\1\14\0\2\0X\2\1Ä2\0\21Ä6\2\5\0006\4\6\0'\5\2\0B\2\3\3\14\0\2\0X\4\1Ä2\0\15Ä9\4\b\0035\6\n\0005\a\t\0=\a\v\0065\a\14\0003\b\f\0>\b\1\a3\b\r\0=\b\15\a=\a\16\6B\4\2\0012\0\0ÄK\0\1\0K\0\1\0K\0\1\0K\0\1\0\rhandlers\ndelve\1\0\1\ndelve\0\0\0\21ensure_installed\1\0\3\27automatic_installation\2\rhandlers\0\21ensure_installed\0\1\2\0\0\ndelve\nsetup\nmason\frequire\npcall\15mason-core\19mason-core.log\19mason-nvim-dap\vloaded\fpackage)\1\0\3\0\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\0\rschedule\bvim\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/mason-nvim-dap.nvim",
    url = "https://github.com/jay-babu/mason-nvim-dap.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\nù\1\0\0\5\0\v\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0B\0\2\2'\1\a\0&\0\1\0006\1\3\0009\1\b\1\18\2\0\0'\3\n\0006\4\3\0009\4\b\0049\4\t\4&\2\4\2=\2\t\1K\0\1\0\6:\tPATH\benv\15/mason/bin\tdata\fstdpath\afn\bvim\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["noice.nvim"] = {
    config = { "\27LJ\2\n≈\2\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\fpresets\1\0\5\19lsp_doc_border\1\15inc_rename\1\26long_message_to_split\2\20command_palette\2\18bottom_search\2\blsp\1\0\2\fpresets\0\blsp\0\roverride\1\0\1\roverride\0\1\0\3 cmp.entry.get_documentation\2\"vim.lsp.util.stylize_markdown\0021vim.lsp.util.convert_input_to_markdown_lines\2\nsetup\nnoice\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nµ\1\0\0\n\0\b\0\0226\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0006\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\2\0X\4\1ÄK\0\1\0009\4\4\3\18\6\4\0009\4\5\4'\a\6\0009\b\a\1B\b\1\0A\4\2\1K\0\1\0\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\frequire\npcallt\1\0\5\0\a\0\0156\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0\aÄ9\2\3\1B\2\1\0016\2\4\0009\2\5\0023\4\6\0B\2\2\1K\0\1\0K\0\1\0\0\rschedule\bvim\nsetup\19nvim-autopairs\frequire\npcall\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    config = { "\27LJ\2\nª\3\0\0\6\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\3=\3\a\0025\3\b\0=\3\t\0025\3\15\0005\4\v\0005\5\n\0=\5\f\0045\5\r\0=\5\14\4=\4\16\3=\3\17\2B\0\2\1K\0\1\0\vfilter\bfzf\1\0\1\bfzf\0\15extra_opts\1\5\0\0\v--bind\22ctrl-o:toggle-all\r--prompt\a> \15action_for\1\0\2\15action_for\0\15extra_opts\0\1\0\1\vctrl-s\nsplit\rfunc_map\1\0\3\16ptogglemode\az,\vvsplit\5\14stoggleup\5\fpreview\17border_chars\1\n\0\0\b‚îÉ\b‚îÉ\b‚îÅ\b‚îÅ\b‚îè\b‚îì\b‚îó\b‚îõ\b‚ñà\1\0\4\16win_vheight\3\f\15win_height\3\f\17border_chars\0\17delay_syntax\3P\1\0\4\16auto_enable\2\rfunc_map\0\fpreview\0\vfilter\0\nsetup\bbqf\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/opt/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\3¿\tbody\15lsp_expandö\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\vÄ-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\3¿\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\3¿\tjump\rjumpable\21select_prev_item\fvisibleû\1\0\0\6\1\b\0\17-\0\0\0009\0\0\0009\0\1\0005\2\2\0005\3\5\0-\4\0\0009\4\3\0049\4\4\0049\4\1\4B\4\1\2=\4\3\0034\4\3\0005\5\6\0>\5\1\4=\4\a\3B\0\3\1K\0\1\0\1¿\fsources\1\0\1\tname\vbuffer\1\0\2\fmapping\0\fsources\0\vpreset\fmapping\1\3\0\0\6/\6?\fcmdline\nsetup…\1\0\0\t\1\n\0\24-\0\0\0009\0\0\0009\0\1\0'\2\2\0005\3\5\0-\4\0\0009\4\3\0049\4\4\0049\4\1\4B\4\1\2=\4\3\3-\4\0\0009\4\6\0049\4\a\0044\6\3\0005\a\b\0>\a\1\0064\a\3\0005\b\t\0>\b\1\aB\4\3\2=\4\a\3B\0\3\1K\0\1\0\1¿\1\0\1\tname\fcmdline\1\0\1\tname\tpath\fsources\vconfig\1\0\2\fmapping\0\fsources\0\vpreset\fmapping\6:\fcmdline\nsetup…\5\1\0\14\0'\0W6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0NÄ6\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\2\0X\4\1Ä2\0HÄ6\4\0\0003\6\4\0B\4\2\0019\4\5\0015\6\t\0005\a\a\0003\b\6\0=\b\b\a=\a\n\0069\a\v\0019\a\f\a9\a\r\a5\t\15\0009\n\v\0019\n\14\n)\f¸ˇB\n\2\2=\n\16\t9\n\v\0019\n\14\n)\f\4\0B\n\2\2=\n\17\t9\n\v\0019\n\18\nB\n\1\2=\n\19\t9\n\v\0019\n\20\nB\n\1\2=\n\21\t9\n\v\0019\n\22\n5\f\23\0B\n\2\2=\n\24\t9\n\v\0013\f\25\0005\r\26\0B\n\3\2=\n\27\t9\n\v\0013\f\28\0005\r\29\0B\n\3\2=\n\30\tB\a\2\2=\a\v\0069\a\31\0019\a \a4\t\3\0005\n!\0>\n\1\t5\n\"\0>\n\2\t4\n\3\0005\v#\0>\v\1\n5\v$\0>\v\2\nB\a\3\2=\a \6B\4\2\0016\4\0\0003\6%\0B\4\2\0016\4\0\0003\6&\0B\4\2\0012\0\0ÄK\0\1\0K\0\1\0K\0\1\0\0\0\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\a\t<CR>\0\n<Tab>\0\n<C-e>\0\14<C-Space>\0\n<C-f>\0\f<S-Tab>\0\n<C-b>\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\3\fmapping\0\fsnippet\0\fsources\0\vexpand\1\0\1\vexpand\0\0\nsetup\0\fluasnip\bcmp\frequire\npcall\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nÔ\2\0\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0005\5\b\0=\5\t\4=\4\n\3=\3\v\0024\3\0\0=\3\f\2B\0\2\1K\0\1\0\rbuftypes\25user_default_options\tsass\fparsers\1\2\0\0\bcss\1\0\2\venable\1\fparsers\0\1\0\14\tmode\15background\bRGB\2\16virtualtext\b‚ñ†\bcss\1\18always_update\1\tsass\0\rtailwind\1\vcss_fn\1\vhsl_fn\1\vrgb_fn\1\rAARRGGBB\1\rRRGGBBAA\2\nnames\2\vRRGGBB\2\14filetypes\1\0\3\rbuftypes\0\25user_default_options\0\14filetypes\0\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/NvChad/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n`\0\0\5\1\5\0\t-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\2'\4\4\0B\2\2\0A\0\0\1K\0\1\0\0¿\27Breakpoint condition: \ninput\afn\bvim\19set_breakpoint®\4\1\0\a\0\26\00086\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0009\5\t\0005\6\n\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\v\0009\5\f\0005\6\r\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\14\0009\5\15\0005\6\16\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\17\0009\5\18\0005\6\19\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\20\0009\5\21\0005\6\22\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\23\0003\5\24\0005\6\25\0B\1\5\0012\0\0ÄK\0\1\0\1\0\1\tdesc&Debug: Set Conditional Breakpoint\0\14<leader>B\1\0\1\tdesc\29Debug: Toggle Breakpoint\22toggle_breakpoint\14<leader>b\1\0\1\tdesc\20Debug: Step Out\rstep_out\t<F9>\1\0\1\tdesc\21Debug: Step Into\14step_into\n<F11>\1\0\1\tdesc\21Debug: Step Over\14step_over\n<F10>\1\0\1\tdesc\20Debug: Continue\rcontinue\t<F8>\6n\bset\vkeymap\bvim\nDEBUG\18set_log_level\bdap\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n`\0\1\4\0\4\0\a5\1\2\0004\2\3\0005\3\0\0=\0\1\3>\3\1\2=\2\3\1L\1\2\0\relements\1\0\4\relements\0\rposition\nright\tsize\3(\nenter\2\aid\1\0\1\aid\0⁄\1\0\1\b\2\r\0\29-\1\0\0009\1\0\1B\1\1\1-\1\1\0008\1\0\1\v\1\0\0X\2\aÄ6\2\1\0006\4\2\0009\4\3\4'\6\4\0\18\a\0\0B\4\3\0A\2\0\0016\2\5\0009\2\6\0029\2\a\2B\2\1\2:\2\1\2\n\2\0\0X\3\2Ä9\3\t\2=\3\b\0016\3\n\0-\5\0\0009\5\v\0059\6\f\1B\3\3\1K\0\1\0\3¿\5¿\nindex\vtoggle\npcall\nwidth\tsize\18nvim_list_uis\bapi\bvim\17bad name: %s\vformat\vstring\nerror\nclose\30\0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a¿\trepl \0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a¿\vstacks!\0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a¿\fwatches%\0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a¿\16breakpoints \0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a¿\vscopes!\0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a¿\fconsole'\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\twrap\awo\bvim\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\3¿\nclose\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\3¿\ncloseF\0\2\5\1\4\0\b9\2\0\1\a\2\1\0X\2\4Ä-\2\0\0009\2\2\0029\4\3\1B\2\2\1K\0\1\0\3¿\voutput\teval\fconsole\rcategory≠\f\1\0\16\1K\0Ø\0016\0\0\0009\0\1\0+\1\0\0=\1\2\0006\0\3\0006\2\4\0'\3\5\0B\0\3\3\14\0\0\0X\2\tÄ6\2\6\0009\2\a\2'\4\b\0006\5\6\0009\5\t\0059\5\n\0059\5\v\5B\2\3\0012\0öÄ6\2\3\0006\4\4\0'\5\2\0B\2\3\3\14\0\2\0X\4\1Ä2\0îÄ3\4\f\0005\5\16\0005\6\14\0\18\a\4\0'\t\r\0B\a\2\2=\a\15\6=\6\r\0055\6\18\0\18\a\4\0'\t\17\0B\a\2\2=\a\15\6=\6\17\0055\6\20\0\18\a\4\0'\t\19\0B\a\2\2=\a\15\6=\6\19\0055\6\22\0\18\a\4\0'\t\21\0B\a\2\2=\a\15\6=\6\21\0055\6\24\0\18\a\4\0'\t\23\0B\a\2\2=\a\15\6=\6\23\0055\6\26\0\18\a\4\0'\t\25\0B\a\2\2=\a\15\6=\6\25\0054\6\0\0006\a\27\0\18\t\5\0B\a\2\4H\n\bÄ6\f\28\0009\f\29\f\18\14\6\0009\15\15\vB\f\3\0018\f\n\5\21\r\6\0=\r\30\fF\n\3\3R\nˆ\1273\a\31\0006\b\6\0009\b \b9\b!\b'\n\"\0'\v#\0003\f$\0005\r%\0B\b\5\0016\b\6\0009\b \b9\b!\b'\n\"\0'\v&\0003\f'\0005\r(\0B\b\5\0016\b\6\0009\b \b9\b!\b'\n\"\0'\v)\0003\f*\0005\r+\0B\b\5\0016\b\6\0009\b \b9\b!\b'\n\"\0'\v,\0003\f-\0005\r.\0B\b\5\0016\b\6\0009\b \b9\b!\b'\n\"\0'\v/\0003\f0\0005\r1\0B\b\5\0016\b\6\0009\b \b9\b!\b'\n\"\0'\v2\0003\f3\0005\r4\0B\b\5\0016\b\6\0009\b5\b9\b6\b'\n7\0005\v8\0003\f9\0=\f:\vB\b\3\0016\b\6\0009\b5\b9\b6\b'\n;\0-\v\0\0'\r<\0B\v\2\0A\b\1\0016\b\6\0009\b5\b9\b6\b'\n;\0-\v\0\0'\r=\0B\v\2\0A\b\1\0019\b>\0035\n?\0=\6@\nB\b\2\0019\bA\0019\bB\b9\bC\b3\tE\0=\tD\b9\bA\0019\bB\b9\bF\b3\tG\0=\tD\b9\bA\0019\bH\b9\bI\b3\tJ\0=\tD\b2\0\0ÄK\0\1\0K\0\1\0K\0\1\0\0\0\0\17event_output\nafter\0\17event_exited\0\17dapui_config\21event_terminated\vbefore\14listeners\flayouts\1\0\2\nenter\2\flayouts\0\nsetup\16DAP Watches\rdap-repl\16BufWinEnter\rcallback\0\1\0\3\rcallback\0\fpattern\15*dap-repl*\ngroup\rDapGroup\rBufEnter\24nvim_create_autocmd\bapi\1\0\1\tdesc\29Debug: toggle console ui\0\15<leader>dc\1\0\1\tdesc\28Debug: toggle scopes ui\0\15<leader>dS\1\0\1\tdesc!Debug: toggle breakpoints ui\0\15<leader>db\1\0\1\tdesc\29Debug: toggle watches ui\0\15<leader>dw\1\0\1\tdesc\28Debug: toggle stacks ui\0\15<leader>ds\1\0\1\tdesc\26Debug: toggle repl ui\0\15<leader>dr\6n\bset\vkeymap\0\nindex\vinsert\ntable\npairs\1\0\2\vlayout\0\nindex\3\0\16breakpoints\1\0\2\vlayout\0\nindex\3\0\fwatches\1\0\2\vlayout\0\nindex\3\0\fconsole\1\0\2\vlayout\0\nindex\3\0\vscopes\1\0\2\vlayout\0\nindex\3\0\vstacks\1\0\6\16breakpoints\0\fwatches\0\fconsole\0\vscopes\0\vstacks\0\trepl\0\vlayout\1\0\2\vlayout\0\nindex\3\0\trepl\0\tWARN\vlevels\blog&nvim-dap not available for dap-ui\vnotify\bvim\bdap\frequire\npcall\ndapui\vloaded\fpackage+\1\0\3\1\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\2¿\0\rschedule\bvim\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-spectre"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fspectre\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/nvim-spectre",
    url = "https://github.com/nvim-pack/nvim-spectre"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nù\3\0\0\a\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\r\0005\4\v\0005\5\t\0005\6\b\0=\6\n\5=\5\f\4=\4\14\3=\3\15\2B\0\2\1K\0\1\0\rrenderer\nicons\1\0\1\nicons\0\vglyphs\1\0\1\vglyphs\0\bgit\1\0\1\bgit\0\1\0\a\14untracked\b‚òÖ\runmerged\b‚å•\vstaged\b‚úì\fignored\b‚óå\runstaged\b‚úó\fdeleted\b‚äò\frenamed\b‚ûú\24update_focused_file\1\0\2\venable\2\16update_root\2\tview\1\0\6\rrenderer\0\tview\0\24update_focused_file\0\20respect_buf_cwd\2\23sync_root_with_cwd\2\17hijack_netrw\2\1\0\2\tside\tleft\nwidth\0032\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÜ\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\3\14highlight\0\vindent\0\21ensure_installed\0\1\v\0\0\blua\bvim\15javascript\15typescript\tjson\thtml\bcss\vpython\tbash\rmarkdown\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["oil.nvim"] = {
    config = { "\27LJ\2\n§\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\17view_options\1\0\1\16show_hidden\2\fcolumns\1\2\0\0\ticon\1\0\3\17view_options\0\26default_file_explorer\1\fcolumns\0\nsetup\boil\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/oil.nvim",
    url = "https://github.com/stevearc/oil.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["persistence.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16persistence\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/persistence.nvim",
    url = "https://github.com/folke/persistence.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\nÉ\3\0\0\6\0\16\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0024\3\0\0=\3\n\0026\3\v\0009\3\f\0039\3\r\3'\5\14\0B\3\2\2=\3\15\2B\0\2\1K\0\1\0\rdatapath\tdata\fstdpath\afn\bvim\17exclude_dirs\15ignore_lsp\1\2\0\0\6*\rpatterns\1\t\0\0\t.git\v_darcs\b.hg\t.bzr\t.svn\rMakefile\17package.json\t.sln\22detection_methods\1\0\b\17silent_chdir\2\17exclude_dirs\0\15ignore_lsp\0\rpatterns\0\22detection_methods\0\16scope_chdir\vglobal\rdatapath\0\16show_hidden\1\1\2\0\0\fpattern\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nØ\4\0\0\6\0\27\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\0035\4\b\0=\4\t\3=\3\v\0025\3\r\0005\4\f\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\23\0005\4\22\0=\4\24\3=\3\25\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\26\0'\2\24\0B\0\2\1K\0\1\0\19load_extension\15extensions\17file_browser\1\0\1\17file_browser\0\1\0\2\17hijack_netrw\1\ntheme\bivy\fpickers\roldfiles\1\0\1\14previewer\1\14live_grep\1\0\1\14previewer\1\15find_files\1\0\1\14previewer\1\fbuffers\1\0\4\15find_files\0\fbuffers\0\roldfiles\0\14live_grep\0\1\0\2\17initial_mode\vnormal\14previewer\1\rdefaults\1\0\3\fpickers\0\15extensions\0\rdefaults\0\fpreview\1\0\2\ftimeout\3˙\1\20check_mime_type\2\rmappings\1\0\2\fpreview\0\rmappings\0\6i\1\0\1\6i\0\1\0\2\n<C-d>\1\n<C-u>\1\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nn\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\14direction\15horizontal\17open_mapping\n<C-\\>\tsize\3\20\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  undotree = {
    config = { "\27LJ\2\na\0\0\2\0\4\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1\3\0=\1\3\0K\0\1\0\26undotree_WindowLayout\30undotree_SetFocusOnToggle\6g\bvim\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\n0\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\tpush\bGit\bcmd\bvim=\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\3\0\0\tpull\r--rebase\bGit\bcmd\bvim¶\2\1\0\b\0\17\0&6\0\0\0009\0\1\0009\0\2\0\6\0\3\0X\0\1Ä2\0\31Ä6\0\0\0009\0\4\0009\0\5\0B\0\1\0025\1\6\0=\0\a\0016\2\0\0009\2\b\0029\2\t\2'\4\n\0'\5\v\0003\6\f\0\18\a\1\0B\2\5\0016\2\0\0009\2\b\0029\2\t\2'\4\n\0'\5\r\0003\6\14\0\18\a\1\0B\2\5\0016\2\0\0009\2\b\0029\2\t\2'\4\n\0'\5\15\0'\6\16\0\18\a\1\0B\2\5\1K\0\1\0K\0\1\0\25:Git push -u origin \14<leader>t\0\14<leader>P\0\14<leader>p\6n\bset\vkeymap\vbuffer\1\0\2\nremap\1\vbuffer\0\25nvim_get_current_buf\bapi\rfugitive\aft\abo\bvim√\3\1\0\b\0\23\0+6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\0\0009\4\5\0049\4\6\0045\5\a\0B\0\5\0016\0\0\0009\0\b\0009\0\t\0'\2\n\0004\3\0\0B\0\3\0026\1\0\0009\1\b\0019\1\v\1\18\2\1\0'\4\f\0005\5\r\0=\0\14\0053\6\15\0=\6\16\5B\2\3\0016\2\0\0009\2\1\0029\2\2\2'\4\3\0'\5\17\0'\6\18\0005\a\19\0B\2\5\0016\2\0\0009\2\1\0029\2\2\2'\4\3\0'\5\20\0'\6\21\0005\a\22\0B\2\5\1K\0\1\0\1\0\1\tdesc\19Get right diff\25<cmd>diffget //3<CR>\agh\1\0\1\tdesc\18Get left diff\25<cmd>diffget //2<CR>\agu\rcallback\0\ngroup\1\0\3\rcallback\0\fpattern\6*\ngroup\0\16BufWinEnter\24nvim_create_autocmd\26ThePrimeagen_Fugitive\24nvim_create_augroup\bapi\1\0\1\tdesc\15Git status\bGit\bcmd\15<leader>gs\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\nï\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\1\foptions\0\1\0\3\20separator_style\tthin\27always_show_bufferline\2\tmode\fbuffers\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: noice.nvim
time([[Config for noice.nvim]], true)
try_loadstring("\27LJ\2\n≈\2\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\fpresets\1\0\5\19lsp_doc_border\1\15inc_rename\1\26long_message_to_split\2\20command_palette\2\18bottom_search\2\blsp\1\0\2\fpresets\0\blsp\0\roverride\1\0\1\roverride\0\1\0\3 cmp.entry.get_documentation\2\"vim.lsp.util.stylize_markdown\0021vim.lsp.util.convert_input_to_markdown_lines\2\nsetup\nnoice\frequire\0", "config", "noice.nvim")
time([[Config for noice.nvim]], false)
-- Config for: cloak.nvim
time([[Config for cloak.nvim]], true)
try_loadstring("\27LJ\2\nÍ\1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\3\0005\4\5\0005\5\4\0=\5\6\4>\4\1\3=\3\a\2B\0\2\1K\0\1\0\rpatterns\17file_pattern\1\0\2\18cloak_pattern\b=.+\17file_pattern\0\1\4\0\0\n.env*\18wrangler.toml\14.dev.vars\1\0\4\20highlight_group\fComment\rpatterns\0\fenabled\2\20cloak_character\6*\nsetup\ncloak\frequire\0", "config", "cloak.nvim")
time([[Config for cloak.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\nÉ\3\0\0\6\0\16\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0024\3\0\0=\3\n\0026\3\v\0009\3\f\0039\3\r\3'\5\14\0B\3\2\2=\3\15\2B\0\2\1K\0\1\0\rdatapath\tdata\fstdpath\afn\bvim\17exclude_dirs\15ignore_lsp\1\2\0\0\6*\rpatterns\1\t\0\0\t.git\v_darcs\b.hg\t.bzr\t.svn\rMakefile\17package.json\t.sln\22detection_methods\1\0\b\17silent_chdir\2\17exclude_dirs\0\15ignore_lsp\0\rpatterns\0\22detection_methods\0\16scope_chdir\vglobal\rdatapath\0\16show_hidden\1\1\2\0\0\fpattern\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: undotree
time([[Config for undotree]], true)
try_loadstring("\27LJ\2\na\0\0\2\0\4\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1\3\0=\1\3\0K\0\1\0\26undotree_WindowLayout\30undotree_SetFocusOnToggle\6g\bvim\0", "config", "undotree")
time([[Config for undotree]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\nsetup\fharpoon\frequire\0", "config", "harpoon")
time([[Config for harpoon]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\tpush\bGit\bcmd\bvim=\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\3\0\0\tpull\r--rebase\bGit\bcmd\bvim¶\2\1\0\b\0\17\0&6\0\0\0009\0\1\0009\0\2\0\6\0\3\0X\0\1Ä2\0\31Ä6\0\0\0009\0\4\0009\0\5\0B\0\1\0025\1\6\0=\0\a\0016\2\0\0009\2\b\0029\2\t\2'\4\n\0'\5\v\0003\6\f\0\18\a\1\0B\2\5\0016\2\0\0009\2\b\0029\2\t\2'\4\n\0'\5\r\0003\6\14\0\18\a\1\0B\2\5\0016\2\0\0009\2\b\0029\2\t\2'\4\n\0'\5\15\0'\6\16\0\18\a\1\0B\2\5\1K\0\1\0K\0\1\0\25:Git push -u origin \14<leader>t\0\14<leader>P\0\14<leader>p\6n\bset\vkeymap\vbuffer\1\0\2\nremap\1\vbuffer\0\25nvim_get_current_buf\bapi\rfugitive\aft\abo\bvim√\3\1\0\b\0\23\0+6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\0\0009\4\5\0049\4\6\0045\5\a\0B\0\5\0016\0\0\0009\0\b\0009\0\t\0'\2\n\0004\3\0\0B\0\3\0026\1\0\0009\1\b\0019\1\v\1\18\2\1\0'\4\f\0005\5\r\0=\0\14\0053\6\15\0=\6\16\5B\2\3\0016\2\0\0009\2\1\0029\2\2\2'\4\3\0'\5\17\0'\6\18\0005\a\19\0B\2\5\0016\2\0\0009\2\1\0029\2\2\2'\4\3\0'\5\20\0'\6\21\0005\a\22\0B\2\5\1K\0\1\0\1\0\1\tdesc\19Get right diff\25<cmd>diffget //3<CR>\agh\1\0\1\tdesc\18Get left diff\25<cmd>diffget //2<CR>\agu\rcallback\0\ngroup\1\0\3\rcallback\0\fpattern\6*\ngroup\0\16BufWinEnter\24nvim_create_autocmd\26ThePrimeagen_Fugitive\24nvim_create_augroup\bapi\1\0\1\tdesc\15Git status\bGit\bcmd\15<leader>gs\6n\bset\vkeymap\bvim\0", "config", "vim-fugitive")
time([[Config for vim-fugitive]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nØ\4\0\0\6\0\27\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\0035\4\b\0=\4\t\3=\3\v\0025\3\r\0005\4\f\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\23\0005\4\22\0=\4\24\3=\3\25\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\26\0'\2\24\0B\0\2\1K\0\1\0\19load_extension\15extensions\17file_browser\1\0\1\17file_browser\0\1\0\2\17hijack_netrw\1\ntheme\bivy\fpickers\roldfiles\1\0\1\14previewer\1\14live_grep\1\0\1\14previewer\1\15find_files\1\0\1\14previewer\1\fbuffers\1\0\4\15find_files\0\fbuffers\0\roldfiles\0\14live_grep\0\1\0\2\17initial_mode\vnormal\14previewer\1\rdefaults\1\0\3\fpickers\0\15extensions\0\rdefaults\0\fpreview\1\0\2\ftimeout\3˙\1\20check_mime_type\2\rmappings\1\0\2\fpreview\0\rmappings\0\6i\1\0\1\6i\0\1\0\2\n<C-d>\1\n<C-u>\1\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: cmp-nvim-lsp
time([[Config for cmp-nvim-lsp]], true)
try_loadstring("\27LJ\2\nö\3\0\0\v\0\15\0\0276\0\0\0009\0\1\0009\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0015\0\6\0006\1\a\0\18\3\0\0B\1\2\4H\4\fÄ'\6\b\0\18\a\4\0&\6\a\0066\a\0\0009\a\t\a9\a\n\a\18\t\6\0005\n\v\0=\5\f\n=\6\r\n=\6\14\nB\a\3\1F\4\3\3R\4Ú\127K\0\1\0\nnumhl\vtexthl\ttext\1\0\3\vtexthl\0\ttext\0\nnumhl\0\16sign_define\afn\19DiagnosticSign\npairs\1\0\4\tWarn\b‚ö†\nError\b‚úó\tHint\tüí°\tInfo\b‚Ñπ\nfloat\1\0\6\vsource\valways\14focusable\1\vheader\5\vprefix\5\vborder\frounded\nstyle\fminimal\1\0\6\nfloat\0\18severity_sort\2\14underline\2\21update_in_insert\1\nsigns\2\17virtual_text\2\vconfig\15diagnostic\bvim\30\1\0\3\0\2\0\0046\0\0\0003\2\1\0B\0\2\1K\0\1\0\0\npcall)\1\0\3\0\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\0\rschedule\bvim\0", "config", "cmp-nvim-lsp")
time([[Config for cmp-nvim-lsp]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\3¿\tbody\15lsp_expandö\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\vÄ-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\3¿\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\3¿\tjump\rjumpable\21select_prev_item\fvisibleû\1\0\0\6\1\b\0\17-\0\0\0009\0\0\0009\0\1\0005\2\2\0005\3\5\0-\4\0\0009\4\3\0049\4\4\0049\4\1\4B\4\1\2=\4\3\0034\4\3\0005\5\6\0>\5\1\4=\4\a\3B\0\3\1K\0\1\0\1¿\fsources\1\0\1\tname\vbuffer\1\0\2\fmapping\0\fsources\0\vpreset\fmapping\1\3\0\0\6/\6?\fcmdline\nsetup…\1\0\0\t\1\n\0\24-\0\0\0009\0\0\0009\0\1\0'\2\2\0005\3\5\0-\4\0\0009\4\3\0049\4\4\0049\4\1\4B\4\1\2=\4\3\3-\4\0\0009\4\6\0049\4\a\0044\6\3\0005\a\b\0>\a\1\0064\a\3\0005\b\t\0>\b\1\aB\4\3\2=\4\a\3B\0\3\1K\0\1\0\1¿\1\0\1\tname\fcmdline\1\0\1\tname\tpath\fsources\vconfig\1\0\2\fmapping\0\fsources\0\vpreset\fmapping\6:\fcmdline\nsetup…\5\1\0\14\0'\0W6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0NÄ6\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\2\0X\4\1Ä2\0HÄ6\4\0\0003\6\4\0B\4\2\0019\4\5\0015\6\t\0005\a\a\0003\b\6\0=\b\b\a=\a\n\0069\a\v\0019\a\f\a9\a\r\a5\t\15\0009\n\v\0019\n\14\n)\f¸ˇB\n\2\2=\n\16\t9\n\v\0019\n\14\n)\f\4\0B\n\2\2=\n\17\t9\n\v\0019\n\18\nB\n\1\2=\n\19\t9\n\v\0019\n\20\nB\n\1\2=\n\21\t9\n\v\0019\n\22\n5\f\23\0B\n\2\2=\n\24\t9\n\v\0013\f\25\0005\r\26\0B\n\3\2=\n\27\t9\n\v\0013\f\28\0005\r\29\0B\n\3\2=\n\30\tB\a\2\2=\a\v\0069\a\31\0019\a \a4\t\3\0005\n!\0>\n\1\t5\n\"\0>\n\2\t4\n\3\0005\v#\0>\v\1\n5\v$\0>\v\2\nB\a\3\2=\a \6B\4\2\0016\4\0\0003\6%\0B\4\2\0016\4\0\0003\6&\0B\4\2\0012\0\0ÄK\0\1\0K\0\1\0K\0\1\0\0\0\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\a\t<CR>\0\n<Tab>\0\n<C-e>\0\14<C-Space>\0\n<C-f>\0\f<S-Tab>\0\n<C-b>\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\3\fmapping\0\fsnippet\0\fsources\0\vexpand\1\0\1\vexpand\0\0\nsetup\0\fluasnip\bcmp\frequire\npcall\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nn\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\14direction\15horizontal\17open_mapping\n<C-\\>\tsize\3\20\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\nÔ\2\0\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0005\5\b\0=\5\t\4=\4\n\3=\3\v\0024\3\0\0=\3\f\2B\0\2\1K\0\1\0\rbuftypes\25user_default_options\tsass\fparsers\1\2\0\0\bcss\1\0\2\venable\1\fparsers\0\1\0\14\tmode\15background\bRGB\2\16virtualtext\b‚ñ†\bcss\1\18always_update\1\tsass\0\rtailwind\1\vcss_fn\1\vhsl_fn\1\vrgb_fn\1\rAARRGGBB\1\rRRGGBBAA\2\nnames\2\vRRGGBB\2\14filetypes\1\0\3\rbuftypes\0\25user_default_options\0\14filetypes\0\1\2\0\0\6*\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: codeium.vim
time([[Config for codeium.vim]], true)
try_loadstring("\27LJ\2\n-\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\19codeium#Accept\afn\bvim,\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\18codeium#Clear\afn\bvim;\0\0\3\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\2\1\0D\0\2\0\29codeium#CycleCompletions\afn\bvim;\0\0\3\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\2ˇˇD\0\2\0\29codeium#CycleCompletions\afn\bvimØ\2\1\0\6\0\16\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0003\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0003\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0003\4\14\0005\5\15\0B\0\5\1K\0\1\0\1\0\2\texpr\2\tdesc\22Codeium: Previous\0\n<C-L>\1\0\2\texpr\2\tdesc\18Codeium: Next\0\n<C-K>\1\0\2\texpr\2\tdesc\19Codeium: Clear\0\n<C-H>\1\0\2\texpr\2\tdesc\20Codeium: Accept\0\n<C-J>\6i\bset\vkeymap\bvim\0", "config", "codeium.vim")
time([[Config for codeium.vim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n`\0\0\5\1\5\0\t-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\2'\4\4\0B\2\2\0A\0\0\1K\0\1\0\0¿\27Breakpoint condition: \ninput\afn\bvim\19set_breakpoint®\4\1\0\a\0\26\00086\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0009\5\t\0005\6\n\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\v\0009\5\f\0005\6\r\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\14\0009\5\15\0005\6\16\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\17\0009\5\18\0005\6\19\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\20\0009\5\21\0005\6\22\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\23\0003\5\24\0005\6\25\0B\1\5\0012\0\0ÄK\0\1\0\1\0\1\tdesc&Debug: Set Conditional Breakpoint\0\14<leader>B\1\0\1\tdesc\29Debug: Toggle Breakpoint\22toggle_breakpoint\14<leader>b\1\0\1\tdesc\20Debug: Step Out\rstep_out\t<F9>\1\0\1\tdesc\21Debug: Step Into\14step_into\n<F11>\1\0\1\tdesc\21Debug: Step Over\14step_over\n<F10>\1\0\1\tdesc\20Debug: Continue\rcontinue\t<F8>\6n\bset\vkeymap\bvim\nDEBUG\18set_log_level\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: conform.nvim
time([[Config for conform.nvim]], true)
try_loadstring("\27LJ\2\nE\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\nbufnr\3\0\vformat\fconform\frequire»\6\1\0\6\0*\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\3=\3\25\0025\3\29\0005\4\27\0005\5\26\0=\5\28\4=\4\30\0035\4 \0005\5\31\0=\5\28\4=\4!\3=\3\"\2B\0\2\0016\0#\0009\0$\0009\0%\0'\2&\0'\3'\0003\4(\0005\5)\0B\0\5\1K\0\1\0\1\0\1\tdesc\18Format buffer\0\14<leader>f\6n\bset\vkeymap\bvim\15formatters\rprettier\1\0\1\17prepend_args\0\1\2\0\0\19--single-quote\17clang-format\1\0\2\17clang-format\0\rprettier\0\17prepend_args\1\0\1\17prepend_args\0\1\3\0\0\16-style=file\25-fallback-style=LLVM\21formatters_by_ft\velixir\1\2\0\0\bmix\20typescriptreact\1\2\0\0\rprettier\15typescript\1\2\0\0\rprettier\20javascriptreact\1\2\0\0\rprettier\15javascript\1\2\0\0\rprettier\ago\1\2\0\0\ngofmt\blua\1\2\0\0\vstylua\bcpp\1\2\0\0\17clang-format\6c\1\0\t\ago\0\bcpp\0\6c\0\15typescript\0\15javascript\0\blua\0\velixir\0\20typescriptreact\0\20javascriptreact\0\1\2\0\0\17clang-format\19format_on_save\1\0\4\21formatters_by_ft\0\19format_on_save\0\20notify_on_error\1\15formatters\0\1\0\2\15timeout_ms\3à'\15lsp_format\rfallback\nsetup\fconform\frequire\0", "config", "conform.nvim")
time([[Config for conform.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n`\0\1\4\0\4\0\a5\1\2\0004\2\3\0005\3\0\0=\0\1\3>\3\1\2=\2\3\1L\1\2\0\relements\1\0\4\relements\0\rposition\nright\tsize\3(\nenter\2\aid\1\0\1\aid\0⁄\1\0\1\b\2\r\0\29-\1\0\0009\1\0\1B\1\1\1-\1\1\0008\1\0\1\v\1\0\0X\2\aÄ6\2\1\0006\4\2\0009\4\3\4'\6\4\0\18\a\0\0B\4\3\0A\2\0\0016\2\5\0009\2\6\0029\2\a\2B\2\1\2:\2\1\2\n\2\0\0X\3\2Ä9\3\t\2=\3\b\0016\3\n\0-\5\0\0009\5\v\0059\6\f\1B\3\3\1K\0\1\0\3¿\5¿\nindex\vtoggle\npcall\nwidth\tsize\18nvim_list_uis\bapi\bvim\17bad name: %s\vformat\vstring\nerror\nclose\30\0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a¿\trepl \0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a¿\vstacks!\0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a¿\fwatches%\0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a¿\16breakpoints \0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a¿\vscopes!\0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a¿\fconsole'\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\twrap\awo\bvim\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\3¿\nclose\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\3¿\ncloseF\0\2\5\1\4\0\b9\2\0\1\a\2\1\0X\2\4Ä-\2\0\0009\2\2\0029\4\3\1B\2\2\1K\0\1\0\3¿\voutput\teval\fconsole\rcategory≠\f\1\0\16\1K\0Ø\0016\0\0\0009\0\1\0+\1\0\0=\1\2\0006\0\3\0006\2\4\0'\3\5\0B\0\3\3\14\0\0\0X\2\tÄ6\2\6\0009\2\a\2'\4\b\0006\5\6\0009\5\t\0059\5\n\0059\5\v\5B\2\3\0012\0öÄ6\2\3\0006\4\4\0'\5\2\0B\2\3\3\14\0\2\0X\4\1Ä2\0îÄ3\4\f\0005\5\16\0005\6\14\0\18\a\4\0'\t\r\0B\a\2\2=\a\15\6=\6\r\0055\6\18\0\18\a\4\0'\t\17\0B\a\2\2=\a\15\6=\6\17\0055\6\20\0\18\a\4\0'\t\19\0B\a\2\2=\a\15\6=\6\19\0055\6\22\0\18\a\4\0'\t\21\0B\a\2\2=\a\15\6=\6\21\0055\6\24\0\18\a\4\0'\t\23\0B\a\2\2=\a\15\6=\6\23\0055\6\26\0\18\a\4\0'\t\25\0B\a\2\2=\a\15\6=\6\25\0054\6\0\0006\a\27\0\18\t\5\0B\a\2\4H\n\bÄ6\f\28\0009\f\29\f\18\14\6\0009\15\15\vB\f\3\0018\f\n\5\21\r\6\0=\r\30\fF\n\3\3R\nˆ\1273\a\31\0006\b\6\0009\b \b9\b!\b'\n\"\0'\v#\0003\f$\0005\r%\0B\b\5\0016\b\6\0009\b \b9\b!\b'\n\"\0'\v&\0003\f'\0005\r(\0B\b\5\0016\b\6\0009\b \b9\b!\b'\n\"\0'\v)\0003\f*\0005\r+\0B\b\5\0016\b\6\0009\b \b9\b!\b'\n\"\0'\v,\0003\f-\0005\r.\0B\b\5\0016\b\6\0009\b \b9\b!\b'\n\"\0'\v/\0003\f0\0005\r1\0B\b\5\0016\b\6\0009\b \b9\b!\b'\n\"\0'\v2\0003\f3\0005\r4\0B\b\5\0016\b\6\0009\b5\b9\b6\b'\n7\0005\v8\0003\f9\0=\f:\vB\b\3\0016\b\6\0009\b5\b9\b6\b'\n;\0-\v\0\0'\r<\0B\v\2\0A\b\1\0016\b\6\0009\b5\b9\b6\b'\n;\0-\v\0\0'\r=\0B\v\2\0A\b\1\0019\b>\0035\n?\0=\6@\nB\b\2\0019\bA\0019\bB\b9\bC\b3\tE\0=\tD\b9\bA\0019\bB\b9\bF\b3\tG\0=\tD\b9\bA\0019\bH\b9\bI\b3\tJ\0=\tD\b2\0\0ÄK\0\1\0K\0\1\0K\0\1\0\0\0\0\17event_output\nafter\0\17event_exited\0\17dapui_config\21event_terminated\vbefore\14listeners\flayouts\1\0\2\nenter\2\flayouts\0\nsetup\16DAP Watches\rdap-repl\16BufWinEnter\rcallback\0\1\0\3\rcallback\0\fpattern\15*dap-repl*\ngroup\rDapGroup\rBufEnter\24nvim_create_autocmd\bapi\1\0\1\tdesc\29Debug: toggle console ui\0\15<leader>dc\1\0\1\tdesc\28Debug: toggle scopes ui\0\15<leader>dS\1\0\1\tdesc!Debug: toggle breakpoints ui\0\15<leader>db\1\0\1\tdesc\29Debug: toggle watches ui\0\15<leader>dw\1\0\1\tdesc\28Debug: toggle stacks ui\0\15<leader>ds\1\0\1\tdesc\26Debug: toggle repl ui\0\15<leader>dr\6n\bset\vkeymap\0\nindex\vinsert\ntable\npairs\1\0\2\vlayout\0\nindex\3\0\16breakpoints\1\0\2\vlayout\0\nindex\3\0\fwatches\1\0\2\vlayout\0\nindex\3\0\fconsole\1\0\2\vlayout\0\nindex\3\0\vscopes\1\0\2\vlayout\0\nindex\3\0\vstacks\1\0\6\16breakpoints\0\fwatches\0\fconsole\0\vscopes\0\vstacks\0\trepl\0\vlayout\1\0\2\vlayout\0\nindex\3\0\trepl\0\tWARN\vlevels\blog&nvim-dap not available for dap-ui\vnotify\bvim\bdap\frequire\npcall\ndapui\vloaded\fpackage+\1\0\3\1\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\2¿\0\rschedule\bvim\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
try_loadstring("\27LJ\2\nx\2\1\5\1\4\0\0166\1\0\0\18\3\0\0B\1\2\2\a\1\1\0X\1\aÄ\18\3\0\0009\1\2\0'\4\3\0B\1\3\2\15\0\1\0X\2\1ÄK\0\1\0-\1\0\0\18\3\0\0G\4\1\0C\1\1\0\t¿!Failed to create diff buffer\nmatch\vstring\ttypeï\1\2\0\a\1\5\0\0216\0\0\0-\2\0\0G\3\0\0A\0\1\3\14\0\0\0X\2\14Ä6\2\1\0\18\4\1\0B\2\2\2\18\5\2\0009\3\2\2'\6\3\0B\3\3\2\15\0\3\0X\4\2Ä+\3\0\0L\3\2\0006\3\4\0\18\5\1\0B\3\2\1L\1\2\0\t¿\nerror!Failed to create diff buffer\nmatch\rtostring\npcallû\3\1\0\f\0\f\1<5\0\0\0)\1\0\0006\2\1\0\18\4\0\0B\2\2\4X\5,Ä6\a\2\0006\t\3\0\18\n\6\0B\a\3\3\15\0\a\0X\t&Ä\15\0\b\0X\t$Ä9\t\4\b\15\0\t\0X\n\15Ä6\t\5\0009\v\4\bB\t\2\2\a\t\6\0X\t\nÄ9\t\a\b\14\0\t\0X\t\aÄ9\t\4\b3\n\b\0=\n\4\b+\n\2\0=\n\a\b\22\1\0\0012\t\0Ä9\t\t\b\15\0\t\0X\n\15Ä6\t\5\0009\v\t\bB\t\2\2\a\t\6\0X\t\nÄ9\t\n\b\14\0\t\0X\t\aÄ9\t\t\b3\n\v\0=\n\t\b+\n\2\0=\n\n\b\22\1\0\0012\t\0ÄE\5\3\3R\5“\127)\2\0\0\0\2\1\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0002\0\0ÄL\2\2\0\0 _create_diff_buffer_patched\23create_diff_buffer\0\19_error_patched\rfunction\ttype\nerror\frequire\npcall\vipairs\1\5\0\0\20diffview.buffer\19diffview.utils\17diffview.log\17diffview.lib\2 \0\0\3\2\0\1\5-\0\0\0-\2\1\0\23\2\0\2B\0\2\1K\0\1\0\1\0\0¿\2Y\1\1\6\2\3\0\16)\1\0\0\3\0\1\0X\1\1Ä2\0\vÄ-\1\0\0B\1\1\2\14\0\1\0X\2\5Ä6\2\0\0009\2\1\0023\4\2\0)\5d\0B\2\3\0012\0\0ÄK\0\1\0K\0\1\0\0¿\1¿\0\rdefer_fn\bvim\25\0\0\3\1\0\0\4-\0\0\0)\2\n\0B\0\2\1K\0\1\0\1¿\21\0\0\2\1\0\0\3-\0\0\0B\0\1\1K\0\1\0\0\0+\1\0\3\1\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\0¿\0\rschedule\bvim˘\2\0\0\r\0\r\0;6\0\0\0009\0\1\0009\0\2\0B\0\1\0024\1\0\0006\2\3\0\18\4\0\0B\2\2\4X\5\23Ä6\a\0\0009\a\1\a9\a\4\a\18\t\6\0B\a\2\2\15\0\a\0X\b\16Ä6\a\5\0006\t\0\0009\t\1\t9\t\6\t\18\n\6\0'\v\a\0B\a\4\3\15\0\a\0X\t\aÄ\15\0\b\0X\t\5Ä6\t\b\0009\t\t\t\18\v\1\0\18\f\6\0B\t\3\1E\5\3\3R\5Á\127\21\2\1\0)\3\1\0\1\3\2\0X\2\20Ä6\2\3\0\18\4\1\0B\2\2\4X\5\14Ä6\a\0\0009\a\1\a9\a\n\a\18\t\6\0'\n\v\0+\v\2\0B\a\4\0016\a\0\0009\a\1\a9\a\n\a\18\t\6\0'\n\f\0+\v\2\0B\a\4\1E\5\3\3R\5\127K\0\1\0\15cursorbind\15scrollbind\24nvim_win_set_option\vinsert\ntable\tdiff\24nvim_win_get_option\npcall\22nvim_win_is_valid\vipairs\19nvim_list_wins\bapi\bvimF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18prev_conflict\21diffview.actions\frequireF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18next_conflict\21diffview.actions\frequireF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18prev_conflict\21diffview.actions\frequireF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18next_conflict\21diffview.actions\frequireC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\15next_entry\21diffview.actions\frequireC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\15prev_entry\21diffview.actions\frequireD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\16focus_files\21diffview.actions\frequire¢\2\1\0\r\1\n\0-6\0\0\0003\2\1\0B\0\2\3\14\0\0\0X\2%Ä6\2\2\0009\2\3\0029\2\4\2B\2\1\0026\3\5\0\18\5\2\0B\3\2\4X\6\26Ä6\b\2\0009\b\3\b9\b\6\b\18\n\a\0B\b\2\2\15\0\b\0X\t\19Ä6\b\0\0006\n\2\0009\n\3\n9\n\a\n\18\v\a\0'\f\b\0B\b\4\3\15\0\b\0X\n\nÄ\15\0\t\0X\n\bÄ6\n\2\0009\n\3\n9\n\t\n\18\f\a\0B\n\2\1-\n\0\0B\n\1\1X\3\5ÄE\6\3\3R\6‰\127X\2\2Ä-\2\0\0B\2\1\1K\0\1\0\0\0\25nvim_set_current_win\tdiff\24nvim_win_get_option\22nvim_win_is_valid\vipairs\19nvim_list_wins\bapi\bvim\0\npcallÅ\2\0\0\v\1\t\0%6\0\0\0009\0\1\0009\0\2\0B\0\1\0026\1\3\0\18\3\0\0B\1\2\4X\4\26Ä6\6\0\0009\6\1\0069\6\4\6\18\b\5\0B\6\2\2\15\0\6\0X\a\19Ä6\6\5\0006\b\0\0009\b\1\b9\b\6\b\18\t\5\0'\n\a\0B\6\4\3\15\0\6\0X\b\nÄ\15\0\a\0X\b\bÄ6\b\0\0009\b\1\b9\b\b\b\18\n\5\0B\b\2\1-\b\0\0B\b\1\1X\1\2ÄE\4\3\3R\4‰\127K\0\1\0\0\0\25nvim_set_current_win\tdiff\24nvim_win_get_option\npcall\22nvim_win_is_valid\vipairs\19nvim_list_wins\bapi\bvimD\1\0\4\1\4\0\v6\0\0\0009\0\1\0003\2\2\0)\3ñ\0B\0\3\0016\0\0\0009\0\1\0003\2\3\0)\3,\1B\0\3\1K\0\1\0\0\0\0\0\rdefer_fn\bvime\1\0\3\1\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0003\2\5\0B\0\2\1K\0\1\0\0\0\0\rschedule\bvim\17select_entry\21diffview.actions\frequire(\1\0\3\1\2\0\0066\0\0\0003\2\1\0B\0\2\3\14\0\0\0X\2\0ÄK\0\1\0\2¿\0\npcallE\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\17select_entry\21diffview.actions\frequireD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\16focus_entry\21diffview.actions\frequire\v\0\0\1\0\0\0\1K\0\1\0V\0\0\4\1\2\0\0166\0\0\0009\0\1\0-\2\0\0)\0032\0B\0\3\0016\0\0\0009\0\1\0-\2\0\0)\3ñ\0B\0\3\0016\0\0\0009\0\1\0-\2\0\0)\3,\1B\0\3\1K\0\1\0\0\0\rdefer_fn\bvim+\1\0\3\1\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\2¿\0\rschedule\bvim \0\0\3\2\0\1\5-\0\0\0-\2\1\0\22\2\0\2B\0\2\1K\0\1\0\1\0\0Ä\2’\2\1\1\r\2\v\0007\14\0\0\0X\1\1Ä)\0\0\0)\1\5\0\1\1\0\0X\1\1Ä2\0/Ä6\1\0\0009\1\1\0019\1\2\1B\1\1\2+\2\1\0006\3\3\0\18\5\1\0B\3\2\4X\6\27Ä6\b\0\0009\b\1\b9\b\4\b\18\n\a\0B\b\2\2\15\0\b\0X\t\20Ä6\b\5\0006\n\0\0009\n\1\n9\n\6\n\18\v\a\0'\f\a\0B\b\4\3\15\0\b\0X\n\vÄ\15\0\t\0X\n\tÄ6\n\0\0009\n\1\n9\n\b\n\18\f\a\0B\n\2\1-\n\0\0B\n\1\1+\2\2\0X\3\2ÄE\6\3\3R\6„\127\14\0\2\0X\3\5Ä6\3\0\0009\3\t\0033\5\n\0)\6d\0B\3\3\0012\0\0ÄK\0\1\0K\0\1\0\0\0\0¿\0\rdefer_fn\25nvim_set_current_win\tdiff\24nvim_win_get_option\npcall\22nvim_win_is_valid\vipairs\19nvim_list_wins\bapi\bvim#\0\0\3\2\0\0\6-\0\0\0B\0\1\1-\0\1\0)\2\0\0B\0\2\1K\0\1\0\0\0\0¿L\1\0\5\1\4\0\r3\0\0\0006\1\1\0009\1\2\0013\3\3\0)\0042\0B\1\3\0016\1\1\0009\1\2\1-\3\0\0)\4»\0B\1\3\0012\0\0ÄK\0\1\0\0\0\0\rdefer_fn\bvim\0+\1\0\3\1\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\2¿\0\rschedule\bvim\21\0\0\2\1\0\0\3-\0\0\0B\0\1\1K\0\1\0\0\0}\1\0\3\1\a\0\0186\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\fÄ6\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\5\0003\2\6\0B\0\2\1K\0\1\0\2¿\0\rschedule\15cursorbind\15scrollbind\tdiff\awo\bvim€\t\1\0\t\0@\0[3\0\0\0003\1\1\0006\2\2\0009\2\3\0023\4\4\0B\2\2\0016\2\2\0009\2\5\0029\2\6\2'\4\a\0005\5\b\0003\6\t\0=\6\n\5B\2\3\0013\2\v\0006\3\f\0'\5\r\0B\3\2\0029\3\14\0035\5\20\0005\6\16\0005\a\15\0=\a\17\0065\a\18\0=\a\19\6=\6\21\0055\6\22\0005\a\23\0=\a\24\0065\a\25\0=\a\26\6=\6\27\0055\6\29\0005\a\28\0=\a\26\6=\6\30\0055\6(\0005\a \0003\b\31\0=\b!\a3\b\"\0=\b#\a3\b$\0=\b%\a3\b&\0=\b'\a=\a\21\0065\a*\0003\b)\0=\b+\a3\b,\0=\b-\a3\b.\0=\b/\a3\b0\0=\b1\a3\b2\0=\b3\a=\a\27\6=\0064\0055\0066\0003\a5\0=\a7\6=\0068\5B\3\2\0016\3\2\0009\3\5\0039\3\6\3'\5\a\0005\0069\0003\a:\0=\a\n\6B\3\3\0016\3\2\0009\3\5\0039\3\6\3'\5\a\0005\6;\0003\a<\0=\a\n\6B\3\3\0016\3\2\0009\3\5\0039\3\6\0035\5=\0005\6?\0003\a>\0=\a\n\6B\3\3\0012\0\0ÄK\0\1\0\1\0\1\rcallback\0\0\1\4\0\0\rWinEnter\16BufWinEnter\vWinNew\0\1\0\2\rcallback\0\fpattern\23DiffviewFileOpened\0\1\0\2\rcallback\0\fpattern\23DiffviewViewOpened\nhooks\18diff_buf_read\1\0\1\18diff_buf_read\0\0\fkeymaps\n<Tab>\0\6o\0\t<CR>\0\6k\0\6j\1\0\5\t<CR>\0\n<Tab>\0\6o\0\6j\0\6k\0\0\1\0\2\tview\0\15file_panel\0\a]x\0\a[x\0\a]c\0\a[c\1\0\4\a[x\0\a[c\0\a]c\0\a]x\0\0\23file_history_panel\1\0\1\15win_config\0\1\0\2\vheight\3\16\rposition\vbottom\15file_panel\15win_config\1\0\2\nwidth\0032\rposition\tleft\17tree_options\1\0\2\20folder_statuses\16only_folded\17flatten_dirs\2\1\0\3\15win_config\0\17tree_options\0\18listing_style\ttree\tview\1\0\t\tview\0\fkeymaps\0\15file_panel\0\nhooks\0\20show_help_hints\1\14use_icons\2\21enhanced_diff_hl\1\18diff_binaries\1\23file_history_panel\0\15merge_tool\1\0\2\vlayout\21diff3_horizontal\24disable_diagnostics\2\fdefault\1\0\2\fdefault\0\15merge_tool\0\1\0\2\vlayout\21diff2_horizontal\16winbar_info\2\nsetup\rdiffview\frequire\0\rcallback\0\1\0\3\rcallback\0\tonce\2\fpattern\23DiffviewViewOpened\tUser\24nvim_create_autocmd\bapi\0\rschedule\bvim\0\0\0", "config", "diffview.nvim")
time([[Config for diffview.nvim]], false)
-- Config for: nvim-spectre
time([[Config for nvim-spectre]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fspectre\frequire\0", "config", "nvim-spectre")
time([[Config for nvim-spectre]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nù\3\0\0\a\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\r\0005\4\v\0005\5\t\0005\6\b\0=\6\n\5=\5\f\4=\4\14\3=\3\15\2B\0\2\1K\0\1\0\rrenderer\nicons\1\0\1\nicons\0\vglyphs\1\0\1\vglyphs\0\bgit\1\0\1\bgit\0\1\0\a\14untracked\b‚òÖ\runmerged\b‚å•\vstaged\b‚úì\fignored\b‚óå\runstaged\b‚úó\fdeleted\b‚äò\frenamed\b‚ûú\24update_focused_file\1\0\2\venable\2\16update_root\2\tview\1\0\6\rrenderer\0\tview\0\24update_focused_file\0\20respect_buf_cwd\2\23sync_root_with_cwd\2\17hijack_netrw\2\1\0\2\tside\tleft\nwidth\0032\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n|\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\nscope\1\0\1\fenabled\2\vindent\1\0\2\vindent\0\nscope\0\1\0\1\tchar\b‚îÇ\nsetup\bibl\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÜ\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\3\14highlight\0\vindent\0\21ensure_installed\0\1\v\0\0\blua\bvim\15javascript\15typescript\tjson\thtml\bcss\vpython\tbash\rmarkdown\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\nê\n\0\0\t\0\26\00106\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\3\0019\2\a\0024\3\6\0009\4\b\1'\6\t\0'\a\n\0'\b\v\0B\4\4\2>\4\1\0039\4\b\1'\6\f\0'\a\r\0'\b\14\0B\4\4\2>\4\2\0039\4\b\1'\6\15\0'\a\16\0'\b\17\0B\4\4\2>\4\3\0039\4\b\1'\6\18\0'\a\19\0'\b\20\0B\4\4\2>\4\4\0039\4\b\1'\6\21\0'\a\22\0'\b\23\0B\4\4\0?\4\0\0=\3\5\0029\2\24\0009\4\25\1B\2\2\1K\0\1\0\vconfig\nsetup\f:qa<CR>\r‚ùå Quit\6q\29:Telescope live_grep<CR>\19üîé Find text\6g\28:Telescope oldfiles<CR>\22üìÇ Recent files\6r\30:Telescope find_files<CR>\19üîç Find file\6f\31:ene <BAR> startinsert<CR>\18üìÅ New file\6e\vbutton\fbuttons\1\a\0\0Ö\1‚ñà‚ñà‚ñà‚ïó   ‚ñà‚ñà‚ïó‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó ‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó ‚ñà‚ñà‚ïó   ‚ñà‚ñà‚ïó‚ñà‚ñà‚ïó‚ñà‚ñà‚ñà‚ïó   ‚ñà‚ñà‚ñà‚ïóè\1‚ñà‚ñà‚ñà‚ñà‚ïó  ‚ñà‚ñà‚ïë‚ñà‚ñà‚ïî‚ïê‚ïê‚ïê‚ïê‚ïù‚ñà‚ñà‚ïî‚ïê‚ïê‚ïê‚ñà‚ñà‚ïó‚ñà‚ñà‚ïë   ‚ñà‚ñà‚ïë‚ñà‚ñà‚ïë‚ñà‚ñà‚ñà‚ñà‚ïó ‚ñà‚ñà‚ñà‚ñà‚ïëâ\1‚ñà‚ñà‚ïî‚ñà‚ñà‚ïó ‚ñà‚ñà‚ïë‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó  ‚ñà‚ñà‚ïë   ‚ñà‚ñà‚ïë‚ñà‚ñà‚ïë   ‚ñà‚ñà‚ïë‚ñà‚ñà‚ïë‚ñà‚ñà‚ïî‚ñà‚ñà‚ñà‚ñà‚ïî‚ñà‚ñà‚ïëè\1‚ñà‚ñà‚ïë‚ïö‚ñà‚ñà‚ïó‚ñà‚ñà‚ïë‚ñà‚ñà‚ïî‚ïê‚ïê‚ïù  ‚ñà‚ñà‚ïë   ‚ñà‚ñà‚ïë‚ïö‚ñà‚ñà‚ïó ‚ñà‚ñà‚ïî‚ïù‚ñà‚ñà‚ïë‚ñà‚ñà‚ïë‚ïö‚ñà‚ñà‚ïî‚ïù‚ñà‚ñà‚ïëë\1‚ñà‚ñà‚ïë ‚ïö‚ñà‚ñà‚ñà‚ñà‚ïë‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó‚ïö‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïî‚ïù ‚ïö‚ñà‚ñà‚ñà‚ñà‚ïî‚ïù ‚ñà‚ñà‚ïë‚ñà‚ñà‚ïë ‚ïö‚ïê‚ïù ‚ñà‚ñà‚ïëÅ\1‚ïö‚ïê‚ïù  ‚ïö‚ïê‚ïê‚ïê‚ïù‚ïö‚ïê‚ïê‚ïê‚ïê‚ïê‚ïê‚ïù ‚ïö‚ïê‚ïê‚ïê‚ïê‚ïê‚ïù   ‚ïö‚ïê‚ïê‚ïê‚ïù  ‚ïö‚ïê‚ïù‚ïö‚ïê‚ïù     ‚ïö‚ïê‚ïù\bval\vheader\fsection\27alpha.themes.dashboard\nalpha\frequire\vÄÄ¿ô\4\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\nù\1\0\0\5\0\v\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0B\0\2\2'\1\a\0&\0\1\0006\1\3\0009\1\b\1\18\2\0\0'\3\n\0006\4\3\0009\4\b\0049\4\t\4&\2\4\2=\2\t\1K\0\1\0\6:\tPATH\benv\15/mason/bin\tdata\fstdpath\afn\bvim\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n%\0\0\3\0\3\0\0046\0\0\0009\0\1\0'\2\2\0D\0\2\0\n%H:%M\tdate\aos+\0\1\5\0\2\0\a'\1\0\0\18\4\0\0009\2\1\0B\2\2\2'\3\0\0&\1\3\1L\1\2\0\nupper\6 \29\0\1\4\0\1\0\5'\1\0\0\18\2\0\0'\3\0\0&\1\3\1L\1\2\0\6 +\0\1\5\0\2\0\a'\1\0\0\18\4\0\0009\2\1\0B\2\2\2'\3\0\0&\1\3\1L\1\2\0\nupper\6 +\0\1\5\0\2\0\a'\1\0\0\18\4\0\0009\2\1\0B\2\2\2'\3\0\0&\1\3\1L\1\2\0\nupper\6 \29\0\1\4\0\1\0\5'\1\0\0\18\2\0\0'\3\0\0&\1\3\1L\1\2\0\6 \29\0\1\4\0\1\0\5'\1\0\0\18\2\0\0'\3\0\0&\1\3\1L\1\2\0\6 \29\0\1\4\0\1\0\5'\1\0\0\18\2\0\0'\3\0\0&\1\3\1L\1\2\0\6 ÿ\r\1\0\n\0@\0v6\0\0\0009\0\1\0)\1\3\0=\1\2\0003\0\3\0006\1\4\0006\3\5\0'\4\6\0B\1\3\3\14\0\1\0X\3\2Ä2\0\0ÄK\0\1\0009\3\a\0025\5\17\0005\6\b\0005\a\t\0=\a\n\0065\a\v\0=\a\f\0065\a\r\0004\b\0\0=\b\14\a4\b\0\0=\b\15\a=\a\16\6=\6\18\0055\6\24\0004\a\3\0005\b\19\0003\t\20\0=\t\21\b5\t\22\0=\t\23\b>\b\1\a=\a\25\0064\a\4\0005\b\26\0003\t\27\0=\t\21\b5\t\28\0=\t\23\b>\b\1\a5\b\29\0005\t\30\0=\t\31\b5\t \0=\t\23\b>\b\2\a5\b!\0005\t\"\0=\t\31\b5\t#\0=\t\23\b>\b\3\a=\a$\0064\a\3\0005\b%\0005\t&\0=\t\31\b5\t'\0=\t\23\b>\b\1\a=\a(\0064\a\4\0005\b)\0003\t*\0=\t\21\b5\t+\0=\t\23\b>\b\1\a5\b,\0003\t-\0=\t\21\b5\t.\0=\t\23\b>\b\2\a5\b/\0>\0\1\b3\t0\0=\t\21\b5\t1\0=\t\23\b>\b\3\a=\a2\0064\a\3\0005\b3\0003\t4\0=\t\21\b5\t5\0=\t\23\b>\b\1\a=\a6\0064\a\3\0005\b7\0003\t8\0=\t\21\b5\t9\0=\t\23\b>\b\1\a=\a:\6=\6;\0055\6<\0004\a\0\0=\a\25\0064\a\0\0=\a$\0065\a=\0=\a(\0065\a>\0=\a2\0064\a\0\0=\a6\0064\a\0\0=\a:\6=\6?\5B\3\2\1K\0\1\0\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\6\14lualine_y\0\14lualine_c\0\14lualine_x\0\14lualine_a\0\14lualine_z\0\14lualine_b\0\rsections\14lualine_z\1\0\2\nright\5\tleft\6 \0\1\2\2\0\rlocation\bfmt\0\14separator\0\14lualine_y\1\0\2\nright\6 \tleft\6 \0\1\2\2\0\rprogress\bfmt\0\14separator\0\14lualine_x\1\0\2\nright\5\tleft\6 \0\1\0\3\14separator\0\ticon\tÛ∞•î\bfmt\0\1\0\2\nright\6 \tleft\6 \0\1\2\2\0\rencoding\bfmt\0\14separator\0\1\0\2\nright\6 \tleft\a  \0\1\2\3\0\rfiletype\14separator\0\14icon_only\1\bfmt\0\14lualine_c\1\0\2\nright\6 \tleft\bÓÇ≤\1\0\4\funnamed\15 [No Name]\rmodified\t ‚óè\rreadonly\n Û∞à°\fnewfile\v [New]\1\2\4\0\rfilename\16file_status\2\14separator\0\tpath\3\1\fsymbols\0\14lualine_b\1\0\1\nright\bÓÇ∞\1\0\4\thint\nüí° \tinfo\t‚Ñπ \nerror\t‚úó \twarn\t‚ö† \1\2\2\0\16diagnostics\14separator\0\fsymbols\0\1\0\1\nright\bÓÇ∞\fsymbols\1\0\3\nadded\nÛ∞êï \rmodified\nÛ∞è´ \fremoved\nÛ∞ç¥ \1\2\2\0\tdiff\14separator\0\fsymbols\0\1\0\1\nright\bÓÇ∞\0\1\2\3\0\vbranch\14separator\0\ticon\tÛ∞ò¨\bfmt\0\14lualine_a\1\0\6\14lualine_y\0\14lualine_c\0\14lualine_x\0\14lualine_a\0\14lualine_z\0\14lualine_b\0\14separator\1\0\1\nright\bÓÇ∞\bfmt\0\1\2\2\0\tmode\bfmt\0\14separator\0\foptions\1\0\3\rsections\0\foptions\0\22inactive_sections\0\23disabled_filetypes\vwinbar\15statusline\1\0\2\15statusline\0\vwinbar\0\23section_separators\1\0\2\nright\5\tleft\5\25component_separators\1\0\2\nright\5\tleft\5\1\0\6\17globalstatus\1\25always_divide_middle\2\23section_separators\0\23disabled_filetypes\0\25component_separators\0\ntheme\tauto\nsetup\flualine\frequire\npcall\0\15laststatus\bopt\bvim)\1\0\3\0\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\0\rschedule\bvim\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nµ\1\0\0\n\0\b\0\0226\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0006\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\2\0X\4\1ÄK\0\1\0009\4\4\3\18\6\4\0009\4\5\4'\a\6\0009\b\a\1B\b\1\0A\4\2\1K\0\1\0\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\frequire\npcallt\1\0\5\0\a\0\0156\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0\aÄ9\2\3\1B\2\1\0016\2\4\0009\2\5\0023\4\6\0B\2\2\1K\0\1\0K\0\1\0\0\rschedule\bvim\nsetup\19nvim-autopairs\frequire\npcall\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: auto-save.nvim
time([[Config for auto-save.nvim]], true)
try_loadstring("\27LJ\2\nO\0\0\4\0\5\0\b'\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0B\1\2\2&\0\1\0L\0\2\0\r%H:%M:%S\rstrftime\afn\bvim\19Auto-saved at õ\3\1\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0003\4\4\0=\4\6\3=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\15conditions\1\0\3\15modifiable\2\28file_is_not_a_directory\2\vexists\2\19trigger_events\1\3\0\0\16InsertLeave\16TextChanged\22execution_message\fmessage\1\0\3\22cleaning_interval\3‚\t\fmessage\0\bdim\4äÆèÖ\aΩîú˛\3\0\1\0\b\15conditions\0 clean_command_line_interval\3\0\22execution_message\0\19trigger_events\0\20on_off_commands\2\22write_all_buffers\1\fenabled\1\19debounce_delay\3á\1\nsetup\14auto-save\frequire\0", "config", "auto-save.nvim")
time([[Config for auto-save.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: mason-nvim-dap.nvim
time([[Config for mason-nvim-dap.nvim]], true)
try_loadstring("\27LJ\2\n+\0\1\4\1\1\0\5-\1\0\0009\1\0\1\18\3\0\0B\1\2\1K\0\1\0\3¿\18default_setupG\0\0\5\0\6\0\t6\0\0\0009\0\1\0006\2\0\0009\2\2\0029\2\3\2'\4\4\0B\2\2\2'\3\5\0D\0\3\0\6 \vargs> \ninput\afn\nsplit\bvimG\0\0\5\0\6\0\t6\0\0\0009\0\1\0006\2\0\0009\2\2\0029\2\3\2'\4\4\0B\2\2\2'\3\5\0D\0\3\0\6 \vargs> \ninput\afn\nsplit\bvim±\2\1\1\a\1\t\0\0216\1\0\0009\1\1\0019\3\2\0)\4\1\0005\5\4\0003\6\3\0=\6\5\5B\1\4\0016\1\0\0009\1\1\0019\3\2\0)\4\1\0005\5\a\0003\6\6\0=\6\5\5B\1\4\1-\1\0\0009\1\b\1\18\3\0\0B\1\2\1K\0\1\0\3¿\18default_setup\1\0\6\frequest\vlaunch\tname\14file args\targs\0\15outputMode\vremote\ttype\ndelve\fprogram\f${file}\0\targs\1\0\6\frequest\vlaunch\tname\tfile\targs\0\15outputMode\vremote\ttype\ndelve\fprogram\f${file}\0\19configurations\vinsert\ntable˛\2\1\0\t\0\17\0.6\0\0\0009\0\1\0+\1\0\0=\1\2\0006\0\0\0009\0\1\0+\1\0\0=\1\3\0006\0\0\0009\0\1\0+\1\0\0=\1\4\0006\0\5\0006\2\6\0'\3\a\0B\0\3\3\14\0\0\0X\2\1Ä2\0\24Ä9\2\b\1\14\0\2\0X\2\1Ä2\0\21Ä6\2\5\0006\4\6\0'\5\2\0B\2\3\3\14\0\2\0X\4\1Ä2\0\15Ä9\4\b\0035\6\n\0005\a\t\0=\a\v\0065\a\14\0003\b\f\0>\b\1\a3\b\r\0=\b\15\a=\a\16\6B\4\2\0012\0\0ÄK\0\1\0K\0\1\0K\0\1\0K\0\1\0\rhandlers\ndelve\1\0\1\ndelve\0\0\0\21ensure_installed\1\0\3\27automatic_installation\2\rhandlers\0\21ensure_installed\0\1\2\0\0\ndelve\nsetup\nmason\frequire\npcall\15mason-core\19mason-core.log\19mason-nvim-dap\vloaded\fpackage)\1\0\3\0\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\0\rschedule\bvim\0", "config", "mason-nvim-dap.nvim")
time([[Config for mason-nvim-dap.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: better-escape.nvim
time([[Config for better-escape.nvim]], true)
try_loadstring("\27LJ\2\n_\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\ftimeout\3»\1\21default_mappings\2\nsetup\18better_escape\frequire\0", "config", "better-escape.nvim")
time([[Config for better-escape.nvim]], false)
-- Config for: oil.nvim
time([[Config for oil.nvim]], true)
try_loadstring("\27LJ\2\n§\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\17view_options\1\0\1\16show_hidden\2\fcolumns\1\2\0\0\ticon\1\0\3\17view_options\0\26default_file_explorer\1\fcolumns\0\nsetup\boil\frequire\0", "config", "oil.nvim")
time([[Config for oil.nvim]], false)
-- Config for: persistence.nvim
time([[Config for persistence.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16persistence\frequire\0", "config", "persistence.nvim")
time([[Config for persistence.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType qf ++once lua require("packer.load")({'nvim-bqf'}, { ft = "qf" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

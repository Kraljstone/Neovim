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
    config = { "\27LJ\2\n�\n\0\0\t\0\26\00106\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\3\0019\2\a\0024\3\6\0009\4\b\1'\6\t\0'\a\n\0'\b\v\0B\4\4\2>\4\1\0039\4\b\1'\6\f\0'\a\r\0'\b\14\0B\4\4\2>\4\2\0039\4\b\1'\6\15\0'\a\16\0'\b\17\0B\4\4\2>\4\3\0039\4\b\1'\6\18\0'\a\19\0'\b\20\0B\4\4\2>\4\4\0039\4\b\1'\6\21\0'\a\22\0'\b\23\0B\4\4\0?\4\0\0=\3\5\0029\2\24\0009\4\25\1B\2\2\1K\0\1\0\vconfig\nsetup\f:qa<CR>\r❌ Quit\6q\29:Telescope live_grep<CR>\19🔎 Find text\6g\28:Telescope oldfiles<CR>\22📂 Recent files\6r\30:Telescope find_files<CR>\19🔍 Find file\6f\31:ene <BAR> startinsert<CR>\18📁 New file\6e\vbutton\fbuttons\1\a\0\0�\1███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗�\1████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║�\1██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║�\1██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║�\1██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║�\1╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝\bval\vheader\fsection\27alpha.themes.dashboard\nalpha\frequire\v����\4\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["better-escape.nvim"] = {
    config = { "\27LJ\2\n_\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\ftimeout\3�\1\21default_mappings\2\nsetup\18better_escape\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/better-escape.nvim",
    url = "https://github.com/max397574/better-escape.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\1\foptions\0\1\0\3\20separator_style\tthin\tmode\fbuffers\27always_show_bufferline\2\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cloak.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\3\0005\4\5\0005\5\4\0=\5\6\4>\4\1\3=\3\a\2B\0\2\1K\0\1\0\rpatterns\17file_pattern\1\0\2\18cloak_pattern\b=.+\17file_pattern\0\1\4\0\0\n.env*\18wrangler.toml\14.dev.vars\1\0\4\20cloak_character\6*\fenabled\2\rpatterns\0\20highlight_group\fComment\nsetup\ncloak\frequire\0" },
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
    config = { "\27LJ\2\n�\1\0\0\5\1\f\1\0256\0\0\0009\0\1\0009\0\2\0005\2\3\0-\3\0\0=\3\4\2B\0\2\2\21\1\0\0\t\1\0\0X\1\t�6\1\0\0009\1\5\1'\3\6\0006\4\0\0009\4\a\0049\4\b\0049\4\t\4B\1\3\1K\0\1\0006\1\0\0009\1\1\0019\1\n\0019\1\v\1B\1\1\1K\0\1\0\1�\15definition\bbuf\tWARN\vlevels\blogDNo LSP client attached. Make sure language server is installed.\vnotify\nbufnr\1\0\1\nbufnr\0\16get_clients\blsp\bvim\0�\2\0\0\t\1\14\1,6\0\0\0009\0\1\0009\0\2\0005\2\3\0-\3\0\0=\3\4\2B\0\2\2\21\1\0\0\t\1\0\0X\1\t�6\1\0\0009\1\5\1'\3\6\0006\4\0\0009\4\a\0049\4\b\0049\4\t\4B\1\3\1X\1\24�'\1\n\0006\2\v\0\18\4\0\0B\2\2\4X\5\t�\18\a\1\0009\b\f\6&\1\b\a\21\a\0\0\1\5\a\0X\a\3�\18\a\1\0'\b\r\0&\1\b\aE\5\3\3R\5�\1276\2\0\0009\2\5\2\18\4\1\0006\5\0\0009\5\a\0059\5\b\0059\5\t\5B\2\3\1K\0\1\0\1�\a, \tname\vipairs\18LSP clients: \tINFO\vlevels\blog+No LSP clients attached to this buffer\vnotify\nbufnr\1\0\1\nbufnr\0\16get_clients\blsp\bvim\0�\5\1\2\t\1\"\0y5\2\0\0=\1\1\2-\3\0\0'\5\2\0'\6\3\0003\a\4\0\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\5\0006\a\6\0009\a\a\a9\a\b\a9\a\t\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\n\0006\a\6\0009\a\a\a9\a\b\a9\a\v\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\f\0006\a\6\0009\a\a\a9\a\b\a9\a\r\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\14\0006\a\6\0009\a\a\a9\a\b\a9\a\15\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\16\0006\a\6\0009\a\a\a9\a\b\a9\a\15\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\17\0006\a\6\0009\a\a\a9\a\b\a9\a\18\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\19\0006\a\6\0009\a\a\a9\a\b\a9\a\20\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\21\0006\a\6\0009\a\a\a9\a\b\a9\a\22\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\23\0006\a\6\0009\a\a\a9\a\b\a9\a\24\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\25\0006\a\6\0009\a\26\a9\a\27\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\28\0006\a\6\0009\a\26\a9\a\29\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\30\0006\a\6\0009\a\26\a9\a\31\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6 \0003\a!\0\18\b\2\0B\3\5\0012\0\0�K\0\1\0\0�\0\15<leader>ls\15open_float\14<leader>d\14goto_next\a]d\14goto_prev\15diagnostic\a[d\16code_action\15<leader>ca\vrename\15<leader>rn\19signature_help\n<C-k>\nhover\6K\f<S-F12>\15references\agr\19implementation\agi\16declaration\agD\15definition\bbuf\blsp\bvim\agd\0\n<F12>\6n\vbuffer\1\0\3\vsilent\2\fnoremap\2\vbuffer\0�\3\0\0\v\0\15\0\0276\0\0\0009\0\1\0009\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0015\0\6\0006\1\a\0\18\3\0\0B\1\2\4H\4\f�'\6\b\0\18\a\4\0&\6\a\0066\a\0\0009\a\t\a9\a\n\a\18\t\6\0005\n\v\0=\5\f\n=\6\r\n=\6\14\nB\a\3\1F\4\3\3R\4�\127K\0\1\0\nnumhl\vtexthl\ttext\1\0\3\ttext\0\nnumhl\0\vtexthl\0\16sign_define\afn\19DiagnosticSign\npairs\1\0\4\tHint\t💡\tInfo\bℹ\tWarn\b⚠\nError\b✗\nfloat\1\0\6\vsource\valways\vheader\5\vprefix\5\vborder\frounded\nstyle\fminimal\14focusable\1\1\0\6\nfloat\0\14underline\2\21update_in_insert\1\nsigns\2\17virtual_text\2\18severity_sort\2\vconfig\15diagnostic\bvim�\3\0\0\4\2\14\0\0216\0\0\0009\0\1\0009\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2-\3\0\0=\3\n\2-\3\1\0=\3\v\2B\0\2\0016\0\0\0009\0\1\0009\0\f\0'\2\r\0B\0\2\1K\0\1\0\4�\3�\nts_ls\venable\17capabilities\14on_attach\17root_markers\1\5\0\0\17package.json\18tsconfig.json\18jsconfig.json\t.git\14filetypes\1\5\0\0\15javascript\20javascriptreact\15typescript\20typescriptreact\bcmd\1\3\0\0\31typescript-language-server\f--stdio\1\0\6\bcmd\0\14filetypes\0\17capabilities\0\17root_markers\0\14on_attach\0\tname\nts_ls\vconfig\blsp\bvim�\2\0\0\4\2\14\0\0216\0\0\0009\0\1\0009\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2-\3\0\0=\3\n\2-\3\1\0=\3\v\2B\0\2\0016\0\0\0009\0\1\0009\0\f\0'\2\r\0B\0\2\1K\0\1\0\4�\3�\vjsonls\venable\17capabilities\14on_attach\17root_markers\1\4\0\0\17package.json\18tsconfig.json\t.git\14filetypes\1\3\0\0\tjson\njsonc\bcmd\1\3\0\0 vscode-json-language-server\f--stdio\1\0\6\bcmd\0\14filetypes\0\17capabilities\0\17root_markers\0\14on_attach\0\tname\vjsonls\vconfig\blsp\bvim�\3\0\0\4\2\14\0\0216\0\0\0009\0\1\0009\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2-\3\0\0=\3\n\2-\3\1\0=\3\v\2B\0\2\0016\0\0\0009\0\1\0009\0\f\0'\2\r\0B\0\2\1K\0\1\0\4�\3�\veslint\venable\17capabilities\14on_attach\17root_markers\1\6\0\0\14.eslintrc\17.eslintrc.js\19.eslintrc.json\17package.json\t.git\14filetypes\1\5\0\0\15javascript\20javascriptreact\15typescript\20typescriptreact\bcmd\1\3\0\0\"vscode-eslint-language-server\f--stdio\1\0\6\bcmd\0\14filetypes\0\17capabilities\0\17root_markers\0\14on_attach\0\tname\veslint\vconfig\blsp\bvim�\4\0\0\n\2 \0*6\0\0\0009\0\1\0009\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2-\3\0\0=\3\n\2-\3\1\0=\3\v\0025\3\27\0005\4\r\0005\5\f\0=\5\14\0045\5\16\0005\6\15\0=\6\17\5=\5\18\0045\5\22\0006\6\0\0009\6\19\0069\6\20\6'\b\21\0+\t\2\0B\6\3\2=\6\23\5=\5\24\0045\5\25\0=\5\26\4=\4\28\3=\3\29\2B\0\2\0016\0\0\0009\0\1\0009\0\30\0'\2\31\0B\0\2\1K\0\1\0\4�\3�\vlua_ls\venable\rsettings\bLua\1\0\1\bLua\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\1\flibrary\0\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\1\fglobals\0\1\2\0\0\bvim\fruntime\1\0\4\14workspace\0\fruntime\0\14telemetry\0\16diagnostics\0\1\0\1\fversion\vLuaJIT\17capabilities\14on_attach\17root_markers\1\4\0\0\16.luarc.json\17.luarc.jsonc\t.git\14filetypes\1\2\0\0\blua\bcmd\1\2\0\0\24lua-language-server\1\0\a\bcmd\0\14filetypes\0\17capabilities\0\rsettings\0\17root_markers\0\14on_attach\0\tname\vlua_ls\vconfig\blsp\bvim�\1\1\0\b\0\r\0\0316\0\0\0009\0\1\0009\0\2\0006\1\3\0006\3\4\0'\4\5\0B\1\3\3\14\0\1\0X\3\1�2\0\20�9\3\6\2B\3\1\0023\4\a\0006\5\3\0003\a\b\0B\5\2\0016\5\3\0003\a\t\0B\5\2\0016\5\3\0003\a\n\0B\5\2\0016\5\3\0003\a\v\0B\5\2\0016\5\3\0003\a\f\0B\5\2\0012\0\0�K\0\1\0K\0\1\0\0\0\0\0\0\0\25default_capabilities\17cmp_nvim_lsp\frequire\npcall\bset\vkeymap\bvim)\1\0\3\0\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\0\rschedule\bvim\0" },
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
    config = { "\27LJ\2\n-\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\19codeium#Accept\afn\bvim,\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\18codeium#Clear\afn\bvim;\0\0\3\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\2\1\0D\0\2\0\29codeium#CycleCompletions\afn\bvim;\0\0\3\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\2��D\0\2\0\29codeium#CycleCompletions\afn\bvim�\2\1\0\6\0\16\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0003\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0003\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0003\4\14\0005\5\15\0B\0\5\1K\0\1\0\1\0\2\texpr\2\tdesc\22Codeium: Previous\0\n<C-L>\1\0\2\texpr\2\tdesc\18Codeium: Next\0\n<C-K>\1\0\2\texpr\2\tdesc\19Codeium: Clear\0\n<C-H>\1\0\2\texpr\2\tdesc\20Codeium: Accept\0\n<C-J>\6i\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/codeium.vim",
    url = "https://github.com/Exafunction/codeium.vim"
  },
  ["conform.nvim"] = {
    config = { "\27LJ\2\nE\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\nbufnr\3\0\vformat\fconform\frequire�\5\1\0\6\0#\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\25\0005\4\23\0005\5\22\0=\5\24\4=\4\26\3=\3\27\2B\0\2\0016\0\28\0009\0\29\0009\0\30\0'\2\31\0'\3 \0003\4!\0005\5\"\0B\0\5\1K\0\1\0\1\0\1\tdesc\18Format buffer\0\14<leader>f\6n\bset\vkeymap\bvim\15formatters\17clang-format\1\0\1\17clang-format\0\17prepend_args\1\0\1\17prepend_args\0\1\3\0\0\16-style=file\25-fallback-style=LLVM\21formatters_by_ft\velixir\1\2\0\0\bmix\15typescript\1\2\0\0\rprettier\15javascript\1\2\0\0\rprettier\ago\1\2\0\0\ngofmt\blua\1\2\0\0\vstylua\bcpp\1\2\0\0\17clang-format\6c\1\0\a\blua\0\bcpp\0\6c\0\15javascript\0\velixir\0\15typescript\0\ago\0\1\2\0\0\17clang-format\19format_on_save\1\0\3\15formatters\0\19format_on_save\0\21formatters_by_ft\0\1\0\2\15timeout_ms\3�'\15lsp_format\rfallback\nsetup\fconform\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  ["diffview.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\5\0\19\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\n\0005\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\0025\3\17\0005\4\16\0=\4\14\3=\3\18\2B\0\2\1K\0\1\0\23file_history_panel\1\0\1\15win_config\0\1\0\2\rposition\vbottom\vheight\3\16\15file_panel\15win_config\1\0\2\rposition\tleft\nwidth\0032\17tree_options\1\0\2\17flatten_dirs\2\20folder_statuses\16only_folded\1\0\3\15win_config\0\17tree_options\0\18listing_style\ttree\tview\1\0\3\23file_history_panel\0\tview\0\15file_panel\0\15merge_tool\1\0\2\24disable_diagnostics\2\vlayout\21diff3_horizontal\fdefault\1\0\2\15merge_tool\0\fdefault\0\1\0\2\16winbar_info\2\vlayout\21diff2_horizontal\nsetup\rdiffview\frequire\0" },
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
    config = { "\27LJ\2\n|\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\nscope\1\0\1\fenabled\2\vindent\1\0\2\nscope\0\vindent\0\1\0\1\tchar\b│\nsetup\bibl\frequire\0" },
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
    config = { "\27LJ\2\n%\0\0\3\0\3\0\0046\0\0\0009\0\1\0'\2\2\0D\0\2\0\n%H:%M\tdate\aos+\0\1\5\0\2\0\a'\1\0\0\18\4\0\0009\2\1\0B\2\2\2'\3\0\0&\1\3\1L\1\2\0\nupper\6 \29\0\1\4\0\1\0\5'\1\0\0\18\2\0\0'\3\0\0&\1\3\1L\1\2\0\6 +\0\1\5\0\2\0\a'\1\0\0\18\4\0\0009\2\1\0B\2\2\2'\3\0\0&\1\3\1L\1\2\0\nupper\6 +\0\1\5\0\2\0\a'\1\0\0\18\4\0\0009\2\1\0B\2\2\2'\3\0\0&\1\3\1L\1\2\0\nupper\6 \29\0\1\4\0\1\0\5'\1\0\0\18\2\0\0'\3\0\0&\1\3\1L\1\2\0\6 \29\0\1\4\0\1\0\5'\1\0\0\18\2\0\0'\3\0\0&\1\3\1L\1\2\0\6 \29\0\1\4\0\1\0\5'\1\0\0\18\2\0\0'\3\0\0&\1\3\1L\1\2\0\6 �\r\1\0\n\0@\0v6\0\0\0009\0\1\0)\1\3\0=\1\2\0003\0\3\0006\1\4\0006\3\5\0'\4\6\0B\1\3\3\14\0\1\0X\3\2�2\0\0�K\0\1\0009\3\a\0025\5\17\0005\6\b\0005\a\t\0=\a\n\0065\a\v\0=\a\f\0065\a\r\0004\b\0\0=\b\14\a4\b\0\0=\b\15\a=\a\16\6=\6\18\0055\6\24\0004\a\3\0005\b\19\0003\t\20\0=\t\21\b5\t\22\0=\t\23\b>\b\1\a=\a\25\0064\a\4\0005\b\26\0003\t\27\0=\t\21\b5\t\28\0=\t\23\b>\b\1\a5\b\29\0005\t\30\0=\t\31\b5\t \0=\t\23\b>\b\2\a5\b!\0005\t\"\0=\t\31\b5\t#\0=\t\23\b>\b\3\a=\a$\0064\a\3\0005\b%\0005\t&\0=\t\31\b5\t'\0=\t\23\b>\b\1\a=\a(\0064\a\4\0005\b)\0003\t*\0=\t\21\b5\t+\0=\t\23\b>\b\1\a5\b,\0003\t-\0=\t\21\b5\t.\0=\t\23\b>\b\2\a5\b/\0>\0\1\b3\t0\0=\t\21\b5\t1\0=\t\23\b>\b\3\a=\a2\0064\a\3\0005\b3\0003\t4\0=\t\21\b5\t5\0=\t\23\b>\b\1\a=\a6\0064\a\3\0005\b7\0003\t8\0=\t\21\b5\t9\0=\t\23\b>\b\1\a=\a:\6=\6;\0055\6<\0004\a\0\0=\a\25\0064\a\0\0=\a$\0065\a=\0=\a(\0065\a>\0=\a2\0064\a\0\0=\a6\0064\a\0\0=\a:\6=\6?\5B\3\2\1K\0\1\0\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\6\14lualine_x\0\14lualine_c\0\14lualine_a\0\14lualine_b\0\14lualine_z\0\14lualine_y\0\rsections\14lualine_z\1\0\2\nright\5\tleft\6 \0\1\2\2\0\rlocation\14separator\0\bfmt\0\14lualine_y\1\0\2\nright\6 \tleft\6 \0\1\2\2\0\rprogress\14separator\0\bfmt\0\14lualine_x\1\0\2\nright\5\tleft\6 \0\1\0\3\14separator\0\ticon\t󰥔\bfmt\0\1\0\2\nright\6 \tleft\6 \0\1\2\2\0\rencoding\14separator\0\bfmt\0\1\0\2\nright\6 \tleft\a  \0\1\2\3\0\rfiletype\bfmt\0\14separator\0\14icon_only\1\14lualine_c\1\0\2\nright\6 \tleft\b\1\0\4\funnamed\15 [No Name]\rmodified\t ●\fnewfile\v [New]\rreadonly\n 󰈡\1\2\4\0\rfilename\fsymbols\0\tpath\3\1\16file_status\2\14separator\0\14lualine_b\1\0\1\nright\b\1\0\4\twarn\t⚠ \nerror\t✗ \tinfo\tℹ \thint\n💡 \1\2\2\0\16diagnostics\fsymbols\0\14separator\0\1\0\1\nright\b\fsymbols\1\0\3\fremoved\n󰍴 \rmodified\n󰏫 \nadded\n󰐕 \1\2\2\0\tdiff\fsymbols\0\14separator\0\1\0\1\nright\b\0\1\2\3\0\vbranch\14separator\0\ticon\t󰘬\bfmt\0\14lualine_a\1\0\6\14lualine_x\0\14lualine_c\0\14lualine_a\0\14lualine_b\0\14lualine_z\0\14lualine_y\0\14separator\1\0\1\nright\b\bfmt\0\1\2\2\0\tmode\14separator\0\bfmt\0\foptions\1\0\3\rsections\0\foptions\0\22inactive_sections\0\23disabled_filetypes\vwinbar\15statusline\1\0\2\vwinbar\0\15statusline\0\23section_separators\1\0\2\nright\5\tleft\5\25component_separators\1\0\2\nright\5\tleft\5\1\0\6\25component_separators\0\ntheme\tauto\23disabled_filetypes\0\17globalstatus\1\25always_divide_middle\2\23section_separators\0\nsetup\flualine\frequire\npcall\0\15laststatus\bopt\bvim)\1\0\3\0\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\0\rschedule\bvim\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-nvim-dap.nvim"] = {
    config = { "\27LJ\2\n+\0\1\4\1\1\0\5-\1\0\0009\1\0\1\18\3\0\0B\1\2\1K\0\1\0\3�\18default_setupG\0\0\5\0\6\0\t6\0\0\0009\0\1\0006\2\0\0009\2\2\0029\2\3\2'\4\4\0B\2\2\2'\3\5\0D\0\3\0\6 \vargs> \ninput\afn\nsplit\bvimG\0\0\5\0\6\0\t6\0\0\0009\0\1\0006\2\0\0009\2\2\0029\2\3\2'\4\4\0B\2\2\2'\3\5\0D\0\3\0\6 \vargs> \ninput\afn\nsplit\bvim�\2\1\1\a\1\t\0\0216\1\0\0009\1\1\0019\3\2\0)\4\1\0005\5\4\0003\6\3\0=\6\5\5B\1\4\0016\1\0\0009\1\1\0019\3\2\0)\4\1\0005\5\a\0003\6\6\0=\6\5\5B\1\4\1-\1\0\0009\1\b\1\18\3\0\0B\1\2\1K\0\1\0\3�\18default_setup\1\0\6\fprogram\f${file}\frequest\vlaunch\15outputMode\vremote\targs\0\ttype\ndelve\tname\14file args\0\targs\1\0\6\fprogram\f${file}\frequest\vlaunch\15outputMode\vremote\targs\0\ttype\ndelve\tname\tfile\0\19configurations\vinsert\ntable�\2\1\0\t\0\17\0.6\0\0\0009\0\1\0+\1\0\0=\1\2\0006\0\0\0009\0\1\0+\1\0\0=\1\3\0006\0\0\0009\0\1\0+\1\0\0=\1\4\0006\0\5\0006\2\6\0'\3\a\0B\0\3\3\14\0\0\0X\2\1�2\0\24�9\2\b\1\14\0\2\0X\2\1�2\0\21�6\2\5\0006\4\6\0'\5\2\0B\2\3\3\14\0\2\0X\4\1�2\0\15�9\4\b\0035\6\n\0005\a\t\0=\a\v\0065\a\14\0003\b\f\0>\b\1\a3\b\r\0=\b\15\a=\a\16\6B\4\2\0012\0\0�K\0\1\0K\0\1\0K\0\1\0K\0\1\0\rhandlers\ndelve\1\0\1\ndelve\0\0\0\21ensure_installed\1\0\3\rhandlers\0\21ensure_installed\0\27automatic_installation\2\1\2\0\0\ndelve\nsetup\nmason\frequire\npcall\15mason-core\19mason-core.log\19mason-nvim-dap\vloaded\fpackage)\1\0\3\0\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\0\rschedule\bvim\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/mason-nvim-dap.nvim",
    url = "https://github.com/jay-babu/mason-nvim-dap.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["noice.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\fpresets\1\0\5\19lsp_doc_border\1\15inc_rename\1\26long_message_to_split\2\20command_palette\2\18bottom_search\2\blsp\1\0\2\fpresets\0\blsp\0\roverride\1\0\1\roverride\0\1\0\3 cmp.entry.get_documentation\2\"vim.lsp.util.stylize_markdown\0021vim.lsp.util.convert_input_to_markdown_lines\2\nsetup\nnoice\frequire\0" },
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
    config = { "\27LJ\2\n�\1\0\0\n\0\b\0\0226\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0006\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\2\0X\4\1�K\0\1\0009\4\4\3\18\6\4\0009\4\5\4'\a\6\0009\b\a\1B\b\1\0A\4\2\1K\0\1\0\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\frequire\npcallt\1\0\5\0\a\0\0156\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�2\0\a�9\2\3\1B\2\1\0016\2\4\0009\2\5\0023\4\6\0B\2\2\1K\0\1\0K\0\1\0\0\rschedule\bvim\nsetup\19nvim-autopairs\frequire\npcall\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\3�\tbody\15lsp_expand�\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\v�-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4�-\1\1\0009\1\3\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\1�\3�\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisible�\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\r�-\1\1\0009\1\2\1)\3��B\1\2\2\15\0\1\0X\2\5�-\1\1\0009\1\3\1)\3��B\1\2\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\1�\3�\tjump\rjumpable\21select_prev_item\fvisible�\1\0\0\6\1\b\0\17-\0\0\0009\0\0\0009\0\1\0005\2\2\0005\3\5\0-\4\0\0009\4\3\0049\4\4\0049\4\1\4B\4\1\2=\4\3\0034\4\3\0005\5\6\0>\5\1\4=\4\a\3B\0\3\1K\0\1\0\1�\fsources\1\0\1\tname\vbuffer\1\0\2\fsources\0\fmapping\0\vpreset\fmapping\1\3\0\0\6/\6?\fcmdline\nsetup�\1\0\0\t\1\n\0\24-\0\0\0009\0\0\0009\0\1\0'\2\2\0005\3\5\0-\4\0\0009\4\3\0049\4\4\0049\4\1\4B\4\1\2=\4\3\3-\4\0\0009\4\6\0049\4\a\0044\6\3\0005\a\b\0>\a\1\0064\a\3\0005\b\t\0>\b\1\aB\4\3\2=\4\a\3B\0\3\1K\0\1\0\1�\1\0\1\tname\fcmdline\1\0\1\tname\tpath\fsources\vconfig\1\0\2\fsources\0\fmapping\0\vpreset\fmapping\6:\fcmdline\nsetup�\5\1\0\14\0'\0W6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�2\0N�6\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\2\0X\4\1�2\0H�6\4\0\0003\6\4\0B\4\2\0019\4\5\0015\6\t\0005\a\a\0003\b\6\0=\b\b\a=\a\n\0069\a\v\0019\a\f\a9\a\r\a5\t\15\0009\n\v\0019\n\14\n)\f��B\n\2\2=\n\16\t9\n\v\0019\n\14\n)\f\4\0B\n\2\2=\n\17\t9\n\v\0019\n\18\nB\n\1\2=\n\19\t9\n\v\0019\n\20\nB\n\1\2=\n\21\t9\n\v\0019\n\22\n5\f\23\0B\n\2\2=\n\24\t9\n\v\0013\f\25\0005\r\26\0B\n\3\2=\n\27\t9\n\v\0013\f\28\0005\r\29\0B\n\3\2=\n\30\tB\a\2\2=\a\v\0069\a\31\0019\a \a4\t\3\0005\n!\0>\n\1\t5\n\"\0>\n\2\t4\n\3\0005\v#\0>\v\1\n5\v$\0>\v\2\nB\a\3\2=\a \6B\4\2\0016\4\0\0003\6%\0B\4\2\0016\4\0\0003\6&\0B\4\2\0012\0\0�K\0\1\0K\0\1\0K\0\1\0\0\0\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\a\f<S-Tab>\0\n<C-b>\0\n<Tab>\0\t<CR>\0\n<C-e>\0\14<C-Space>\0\n<C-f>\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\3\fsnippet\0\fsources\0\fmapping\0\vexpand\1\0\1\vexpand\0\0\nsetup\0\fluasnip\bcmp\frequire\npcall\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n`\0\0\5\1\5\0\t-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\2'\4\4\0B\2\2\0A\0\0\1K\0\1\0\0�\27Breakpoint condition: \ninput\afn\bvim\19set_breakpoint�\4\1\0\a\0\26\00086\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0009\5\t\0005\6\n\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\v\0009\5\f\0005\6\r\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\14\0009\5\15\0005\6\16\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\17\0009\5\18\0005\6\19\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\20\0009\5\21\0005\6\22\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\23\0003\5\24\0005\6\25\0B\1\5\0012\0\0�K\0\1\0\1\0\1\tdesc&Debug: Set Conditional Breakpoint\0\14<leader>B\1\0\1\tdesc\29Debug: Toggle Breakpoint\22toggle_breakpoint\14<leader>b\1\0\1\tdesc\20Debug: Step Out\rstep_out\t<F9>\1\0\1\tdesc\21Debug: Step Into\14step_into\n<F11>\1\0\1\tdesc\21Debug: Step Over\14step_over\n<F10>\1\0\1\tdesc\20Debug: Continue\rcontinue\t<F8>\6n\bset\vkeymap\bvim\nDEBUG\18set_log_level\bdap\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n`\0\1\4\0\4\0\a5\1\2\0004\2\3\0005\3\0\0=\0\1\3>\3\1\2=\2\3\1L\1\2\0\relements\1\0\4\relements\0\rposition\nright\tsize\3(\nenter\2\aid\1\0\1\aid\0�\1\0\1\b\2\r\0\29-\1\0\0009\1\0\1B\1\1\1-\1\1\0008\1\0\1\v\1\0\0X\2\a�6\2\1\0006\4\2\0009\4\3\4'\6\4\0\18\a\0\0B\4\3\0A\2\0\0016\2\5\0009\2\6\0029\2\a\2B\2\1\2:\2\1\2\n\2\0\0X\3\2�9\3\t\2=\3\b\0016\3\n\0-\5\0\0009\5\v\0059\6\f\1B\3\3\1K\0\1\0\3�\5�\nindex\vtoggle\npcall\nwidth\tsize\18nvim_list_uis\bapi\bvim\17bad name: %s\vformat\vstring\nerror\nclose\30\0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a�\trepl \0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a�\vstacks!\0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a�\fwatches%\0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a�\16breakpoints \0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a�\vscopes!\0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a�\fconsole'\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\twrap\awo\bvim\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\3�\nclose\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\3�\ncloseF\0\2\5\1\4\0\b9\2\0\1\a\2\1\0X\2\4�-\2\0\0009\2\2\0029\4\3\1B\2\2\1K\0\1\0\3�\voutput\teval\fconsole\rcategory�\f\1\0\16\1K\0�\0016\0\0\0009\0\1\0+\1\0\0=\1\2\0006\0\3\0006\2\4\0'\3\5\0B\0\3\3\14\0\0\0X\2\t�6\2\6\0009\2\a\2'\4\b\0006\5\6\0009\5\t\0059\5\n\0059\5\v\5B\2\3\0012\0��6\2\3\0006\4\4\0'\5\2\0B\2\3\3\14\0\2\0X\4\1�2\0��3\4\f\0005\5\16\0005\6\14\0\18\a\4\0'\t\r\0B\a\2\2=\a\15\6=\6\r\0055\6\18\0\18\a\4\0'\t\17\0B\a\2\2=\a\15\6=\6\17\0055\6\20\0\18\a\4\0'\t\19\0B\a\2\2=\a\15\6=\6\19\0055\6\22\0\18\a\4\0'\t\21\0B\a\2\2=\a\15\6=\6\21\0055\6\24\0\18\a\4\0'\t\23\0B\a\2\2=\a\15\6=\6\23\0055\6\26\0\18\a\4\0'\t\25\0B\a\2\2=\a\15\6=\6\25\0054\6\0\0006\a\27\0\18\t\5\0B\a\2\4H\n\b�6\f\28\0009\f\29\f\18\14\6\0009\15\15\vB\f\3\0018\f\n\5\21\r\6\0=\r\30\fF\n\3\3R\n�\1273\a\31\0006\b\6\0009\b \b9\b!\b'\n\"\0'\v#\0003\f$\0005\r%\0B\b\5\0016\b\6\0009\b \b9\b!\b'\n\"\0'\v&\0003\f'\0005\r(\0B\b\5\0016\b\6\0009\b \b9\b!\b'\n\"\0'\v)\0003\f*\0005\r+\0B\b\5\0016\b\6\0009\b \b9\b!\b'\n\"\0'\v,\0003\f-\0005\r.\0B\b\5\0016\b\6\0009\b \b9\b!\b'\n\"\0'\v/\0003\f0\0005\r1\0B\b\5\0016\b\6\0009\b \b9\b!\b'\n\"\0'\v2\0003\f3\0005\r4\0B\b\5\0016\b\6\0009\b5\b9\b6\b'\n7\0005\v8\0003\f9\0=\f:\vB\b\3\0016\b\6\0009\b5\b9\b6\b'\n;\0-\v\0\0'\r<\0B\v\2\0A\b\1\0016\b\6\0009\b5\b9\b6\b'\n;\0-\v\0\0'\r=\0B\v\2\0A\b\1\0019\b>\0035\n?\0=\6@\nB\b\2\0019\bA\0019\bB\b9\bC\b3\tE\0=\tD\b9\bA\0019\bB\b9\bF\b3\tG\0=\tD\b9\bA\0019\bH\b9\bI\b3\tJ\0=\tD\b2\0\0�K\0\1\0K\0\1\0K\0\1\0\0\0\0\17event_output\nafter\0\17event_exited\0\17dapui_config\21event_terminated\vbefore\14listeners\flayouts\1\0\2\nenter\2\flayouts\0\nsetup\16DAP Watches\rdap-repl\16BufWinEnter\rcallback\0\1\0\3\ngroup\rDapGroup\rcallback\0\fpattern\15*dap-repl*\rBufEnter\24nvim_create_autocmd\bapi\1\0\1\tdesc\29Debug: toggle console ui\0\15<leader>dc\1\0\1\tdesc\28Debug: toggle scopes ui\0\15<leader>dS\1\0\1\tdesc!Debug: toggle breakpoints ui\0\15<leader>db\1\0\1\tdesc\29Debug: toggle watches ui\0\15<leader>dw\1\0\1\tdesc\28Debug: toggle stacks ui\0\15<leader>ds\1\0\1\tdesc\26Debug: toggle repl ui\0\15<leader>dr\6n\bset\vkeymap\0\nindex\vinsert\ntable\npairs\1\0\2\nindex\3\0\vlayout\0\16breakpoints\1\0\2\nindex\3\0\vlayout\0\fwatches\1\0\2\nindex\3\0\vlayout\0\fconsole\1\0\2\nindex\3\0\vlayout\0\vscopes\1\0\2\nindex\3\0\vlayout\0\vstacks\1\0\6\16breakpoints\0\fwatches\0\fconsole\0\vscopes\0\vstacks\0\trepl\0\vlayout\1\0\2\nindex\3\0\vlayout\0\trepl\0\tWARN\vlevels\blog&nvim-dap not available for dap-ui\vnotify\bvim\bdap\frequire\npcall\ndapui\vloaded\fpackage+\1\0\3\1\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\2�\0\rschedule\bvim\0" },
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
    config = { "\27LJ\2\n2\0\0\4\0\3\0\0066\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\frequire\vnotify\bvim\0" },
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
    config = { "\27LJ\2\n�\3\0\0\a\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\r\0005\4\v\0005\5\t\0005\6\b\0=\6\n\5=\5\f\4=\4\14\3=\3\15\2B\0\2\1K\0\1\0\rrenderer\nicons\1\0\1\nicons\0\vglyphs\1\0\1\vglyphs\0\bgit\1\0\1\bgit\0\1\0\a\14untracked\b★\vstaged\b✓\fdeleted\b⊘\runstaged\b✗\fignored\b◌\frenamed\b➜\runmerged\b⌥\24update_focused_file\1\0\2\venable\2\16update_root\2\tview\1\0\6\tview\0\24update_focused_file\0\20respect_buf_cwd\2\23sync_root_with_cwd\2\rrenderer\0\17hijack_netrw\2\1\0\2\tside\tleft\nwidth\0032\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\3\14highlight\0\vindent\0\21ensure_installed\0\1\v\0\0\blua\bvim\15javascript\15typescript\tjson\thtml\bcss\vpython\tbash\rmarkdown\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ufo"] = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bufo\frequire\0" },
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["oil.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\17view_options\1\0\1\16show_hidden\2\fcolumns\1\2\0\0\ticon\1\0\3\17view_options\0\26default_file_explorer\2\fcolumns\0\nsetup\boil\frequire\0" },
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
  ["promise-async"] = {
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/aenima/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\6\0\15\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3=\3\t\0025\3\v\0005\4\n\0=\4\f\3=\3\r\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\14\0'\2\f\0B\0\2\1K\0\1\0\19load_extension\15extensions\17file_browser\1\0\1\17file_browser\0\1\0\2\17hijack_netrw\2\ntheme\bivy\rdefaults\1\0\2\15extensions\0\rdefaults\0\rmappings\1\0\1\rmappings\0\6i\1\0\1\6i\0\1\0\2\n<C-d>\1\n<C-u>\1\nsetup\14telescope\frequire\0" },
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
  ["vim-fugitive"] = {
    config = { "\27LJ\2\n0\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\tpush\bGit\bcmd\bvim=\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\3\0\0\tpull\r--rebase\bGit\bcmd\bvim�\2\1\0\b\0\17\0&6\0\0\0009\0\1\0009\0\2\0\6\0\3\0X\0\1�2\0\31�6\0\0\0009\0\4\0009\0\5\0B\0\1\0025\1\6\0=\0\a\0016\2\0\0009\2\b\0029\2\t\2'\4\n\0'\5\v\0003\6\f\0\18\a\1\0B\2\5\0016\2\0\0009\2\b\0029\2\t\2'\4\n\0'\5\r\0003\6\14\0\18\a\1\0B\2\5\0016\2\0\0009\2\b\0029\2\t\2'\4\n\0'\5\15\0'\6\16\0\18\a\1\0B\2\5\1K\0\1\0K\0\1\0\25:Git push -u origin \14<leader>t\0\14<leader>P\0\14<leader>p\6n\bset\vkeymap\vbuffer\1\0\2\nremap\1\vbuffer\0\25nvim_get_current_buf\bapi\rfugitive\aft\abo\bvim�\3\1\0\b\0\23\0+6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\0\0009\4\5\0049\4\6\0045\5\a\0B\0\5\0016\0\0\0009\0\b\0009\0\t\0'\2\n\0004\3\0\0B\0\3\0026\1\0\0009\1\b\0019\1\v\1\18\2\1\0'\4\f\0005\5\r\0=\0\14\0053\6\15\0=\6\16\5B\2\3\0016\2\0\0009\2\1\0029\2\2\2'\4\3\0'\5\17\0'\6\18\0005\a\19\0B\2\5\0016\2\0\0009\2\1\0029\2\2\2'\4\3\0'\5\20\0'\6\21\0005\a\22\0B\2\5\1K\0\1\0\1\0\1\tdesc\19Get right diff\25<cmd>diffget //3<CR>\agh\1\0\1\tdesc\18Get left diff\25<cmd>diffget //2<CR>\agu\rcallback\0\ngroup\1\0\3\ngroup\0\rcallback\0\fpattern\6*\16BufWinEnter\24nvim_create_autocmd\26ThePrimeagen_Fugitive\24nvim_create_augroup\bapi\1\0\1\tdesc\15Git status\bGit\bcmd\15<leader>gs\6n\bset\vkeymap\bvim\0" },
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
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\tpush\bGit\bcmd\bvim=\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\3\0\0\tpull\r--rebase\bGit\bcmd\bvim�\2\1\0\b\0\17\0&6\0\0\0009\0\1\0009\0\2\0\6\0\3\0X\0\1�2\0\31�6\0\0\0009\0\4\0009\0\5\0B\0\1\0025\1\6\0=\0\a\0016\2\0\0009\2\b\0029\2\t\2'\4\n\0'\5\v\0003\6\f\0\18\a\1\0B\2\5\0016\2\0\0009\2\b\0029\2\t\2'\4\n\0'\5\r\0003\6\14\0\18\a\1\0B\2\5\0016\2\0\0009\2\b\0029\2\t\2'\4\n\0'\5\15\0'\6\16\0\18\a\1\0B\2\5\1K\0\1\0K\0\1\0\25:Git push -u origin \14<leader>t\0\14<leader>P\0\14<leader>p\6n\bset\vkeymap\vbuffer\1\0\2\nremap\1\vbuffer\0\25nvim_get_current_buf\bapi\rfugitive\aft\abo\bvim�\3\1\0\b\0\23\0+6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\0\0009\4\5\0049\4\6\0045\5\a\0B\0\5\0016\0\0\0009\0\b\0009\0\t\0'\2\n\0004\3\0\0B\0\3\0026\1\0\0009\1\b\0019\1\v\1\18\2\1\0'\4\f\0005\5\r\0=\0\14\0053\6\15\0=\6\16\5B\2\3\0016\2\0\0009\2\1\0029\2\2\2'\4\3\0'\5\17\0'\6\18\0005\a\19\0B\2\5\0016\2\0\0009\2\1\0029\2\2\2'\4\3\0'\5\20\0'\6\21\0005\a\22\0B\2\5\1K\0\1\0\1\0\1\tdesc\19Get right diff\25<cmd>diffget //3<CR>\agh\1\0\1\tdesc\18Get left diff\25<cmd>diffget //2<CR>\agu\rcallback\0\ngroup\1\0\3\ngroup\0\rcallback\0\fpattern\6*\16BufWinEnter\24nvim_create_autocmd\26ThePrimeagen_Fugitive\24nvim_create_augroup\bapi\1\0\1\tdesc\15Git status\bGit\bcmd\15<leader>gs\6n\bset\vkeymap\bvim\0", "config", "vim-fugitive")
time([[Config for vim-fugitive]], false)
-- Config for: cmp-nvim-lsp
time([[Config for cmp-nvim-lsp]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\1\f\1\0256\0\0\0009\0\1\0009\0\2\0005\2\3\0-\3\0\0=\3\4\2B\0\2\2\21\1\0\0\t\1\0\0X\1\t�6\1\0\0009\1\5\1'\3\6\0006\4\0\0009\4\a\0049\4\b\0049\4\t\4B\1\3\1K\0\1\0006\1\0\0009\1\1\0019\1\n\0019\1\v\1B\1\1\1K\0\1\0\1�\15definition\bbuf\tWARN\vlevels\blogDNo LSP client attached. Make sure language server is installed.\vnotify\nbufnr\1\0\1\nbufnr\0\16get_clients\blsp\bvim\0�\2\0\0\t\1\14\1,6\0\0\0009\0\1\0009\0\2\0005\2\3\0-\3\0\0=\3\4\2B\0\2\2\21\1\0\0\t\1\0\0X\1\t�6\1\0\0009\1\5\1'\3\6\0006\4\0\0009\4\a\0049\4\b\0049\4\t\4B\1\3\1X\1\24�'\1\n\0006\2\v\0\18\4\0\0B\2\2\4X\5\t�\18\a\1\0009\b\f\6&\1\b\a\21\a\0\0\1\5\a\0X\a\3�\18\a\1\0'\b\r\0&\1\b\aE\5\3\3R\5�\1276\2\0\0009\2\5\2\18\4\1\0006\5\0\0009\5\a\0059\5\b\0059\5\t\5B\2\3\1K\0\1\0\1�\a, \tname\vipairs\18LSP clients: \tINFO\vlevels\blog+No LSP clients attached to this buffer\vnotify\nbufnr\1\0\1\nbufnr\0\16get_clients\blsp\bvim\0�\5\1\2\t\1\"\0y5\2\0\0=\1\1\2-\3\0\0'\5\2\0'\6\3\0003\a\4\0\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\5\0006\a\6\0009\a\a\a9\a\b\a9\a\t\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\n\0006\a\6\0009\a\a\a9\a\b\a9\a\v\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\f\0006\a\6\0009\a\a\a9\a\b\a9\a\r\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\14\0006\a\6\0009\a\a\a9\a\b\a9\a\15\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\16\0006\a\6\0009\a\a\a9\a\b\a9\a\15\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\17\0006\a\6\0009\a\a\a9\a\b\a9\a\18\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\19\0006\a\6\0009\a\a\a9\a\b\a9\a\20\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\21\0006\a\6\0009\a\a\a9\a\b\a9\a\22\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\23\0006\a\6\0009\a\a\a9\a\b\a9\a\24\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\25\0006\a\6\0009\a\26\a9\a\27\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\28\0006\a\6\0009\a\26\a9\a\29\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6\30\0006\a\6\0009\a\26\a9\a\31\a\18\b\2\0B\3\5\1-\3\0\0'\5\2\0'\6 \0003\a!\0\18\b\2\0B\3\5\0012\0\0�K\0\1\0\0�\0\15<leader>ls\15open_float\14<leader>d\14goto_next\a]d\14goto_prev\15diagnostic\a[d\16code_action\15<leader>ca\vrename\15<leader>rn\19signature_help\n<C-k>\nhover\6K\f<S-F12>\15references\agr\19implementation\agi\16declaration\agD\15definition\bbuf\blsp\bvim\agd\0\n<F12>\6n\vbuffer\1\0\3\vsilent\2\fnoremap\2\vbuffer\0�\3\0\0\v\0\15\0\0276\0\0\0009\0\1\0009\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0015\0\6\0006\1\a\0\18\3\0\0B\1\2\4H\4\f�'\6\b\0\18\a\4\0&\6\a\0066\a\0\0009\a\t\a9\a\n\a\18\t\6\0005\n\v\0=\5\f\n=\6\r\n=\6\14\nB\a\3\1F\4\3\3R\4�\127K\0\1\0\nnumhl\vtexthl\ttext\1\0\3\ttext\0\nnumhl\0\vtexthl\0\16sign_define\afn\19DiagnosticSign\npairs\1\0\4\tHint\t💡\tInfo\bℹ\tWarn\b⚠\nError\b✗\nfloat\1\0\6\vsource\valways\vheader\5\vprefix\5\vborder\frounded\nstyle\fminimal\14focusable\1\1\0\6\nfloat\0\14underline\2\21update_in_insert\1\nsigns\2\17virtual_text\2\18severity_sort\2\vconfig\15diagnostic\bvim�\3\0\0\4\2\14\0\0216\0\0\0009\0\1\0009\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2-\3\0\0=\3\n\2-\3\1\0=\3\v\2B\0\2\0016\0\0\0009\0\1\0009\0\f\0'\2\r\0B\0\2\1K\0\1\0\4�\3�\nts_ls\venable\17capabilities\14on_attach\17root_markers\1\5\0\0\17package.json\18tsconfig.json\18jsconfig.json\t.git\14filetypes\1\5\0\0\15javascript\20javascriptreact\15typescript\20typescriptreact\bcmd\1\3\0\0\31typescript-language-server\f--stdio\1\0\6\bcmd\0\14filetypes\0\17capabilities\0\17root_markers\0\14on_attach\0\tname\nts_ls\vconfig\blsp\bvim�\2\0\0\4\2\14\0\0216\0\0\0009\0\1\0009\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2-\3\0\0=\3\n\2-\3\1\0=\3\v\2B\0\2\0016\0\0\0009\0\1\0009\0\f\0'\2\r\0B\0\2\1K\0\1\0\4�\3�\vjsonls\venable\17capabilities\14on_attach\17root_markers\1\4\0\0\17package.json\18tsconfig.json\t.git\14filetypes\1\3\0\0\tjson\njsonc\bcmd\1\3\0\0 vscode-json-language-server\f--stdio\1\0\6\bcmd\0\14filetypes\0\17capabilities\0\17root_markers\0\14on_attach\0\tname\vjsonls\vconfig\blsp\bvim�\3\0\0\4\2\14\0\0216\0\0\0009\0\1\0009\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2-\3\0\0=\3\n\2-\3\1\0=\3\v\2B\0\2\0016\0\0\0009\0\1\0009\0\f\0'\2\r\0B\0\2\1K\0\1\0\4�\3�\veslint\venable\17capabilities\14on_attach\17root_markers\1\6\0\0\14.eslintrc\17.eslintrc.js\19.eslintrc.json\17package.json\t.git\14filetypes\1\5\0\0\15javascript\20javascriptreact\15typescript\20typescriptreact\bcmd\1\3\0\0\"vscode-eslint-language-server\f--stdio\1\0\6\bcmd\0\14filetypes\0\17capabilities\0\17root_markers\0\14on_attach\0\tname\veslint\vconfig\blsp\bvim�\4\0\0\n\2 \0*6\0\0\0009\0\1\0009\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2-\3\0\0=\3\n\2-\3\1\0=\3\v\0025\3\27\0005\4\r\0005\5\f\0=\5\14\0045\5\16\0005\6\15\0=\6\17\5=\5\18\0045\5\22\0006\6\0\0009\6\19\0069\6\20\6'\b\21\0+\t\2\0B\6\3\2=\6\23\5=\5\24\0045\5\25\0=\5\26\4=\4\28\3=\3\29\2B\0\2\0016\0\0\0009\0\1\0009\0\30\0'\2\31\0B\0\2\1K\0\1\0\4�\3�\vlua_ls\venable\rsettings\bLua\1\0\1\bLua\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\1\flibrary\0\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\1\fglobals\0\1\2\0\0\bvim\fruntime\1\0\4\14workspace\0\fruntime\0\14telemetry\0\16diagnostics\0\1\0\1\fversion\vLuaJIT\17capabilities\14on_attach\17root_markers\1\4\0\0\16.luarc.json\17.luarc.jsonc\t.git\14filetypes\1\2\0\0\blua\bcmd\1\2\0\0\24lua-language-server\1\0\a\bcmd\0\14filetypes\0\17capabilities\0\rsettings\0\17root_markers\0\14on_attach\0\tname\vlua_ls\vconfig\blsp\bvim�\1\1\0\b\0\r\0\0316\0\0\0009\0\1\0009\0\2\0006\1\3\0006\3\4\0'\4\5\0B\1\3\3\14\0\1\0X\3\1�2\0\20�9\3\6\2B\3\1\0023\4\a\0006\5\3\0003\a\b\0B\5\2\0016\5\3\0003\a\t\0B\5\2\0016\5\3\0003\a\n\0B\5\2\0016\5\3\0003\a\v\0B\5\2\0016\5\3\0003\a\f\0B\5\2\0012\0\0�K\0\1\0K\0\1\0\0\0\0\0\0\0\25default_capabilities\17cmp_nvim_lsp\frequire\npcall\bset\vkeymap\bvim)\1\0\3\0\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\0\rschedule\bvim\0", "config", "cmp-nvim-lsp")
time([[Config for cmp-nvim-lsp]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n2\0\0\4\0\3\0\0066\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\frequire\vnotify\bvim\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-spectre
time([[Config for nvim-spectre]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fspectre\frequire\0", "config", "nvim-spectre")
time([[Config for nvim-spectre]], false)
-- Config for: codeium.vim
time([[Config for codeium.vim]], true)
try_loadstring("\27LJ\2\n-\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\19codeium#Accept\afn\bvim,\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\18codeium#Clear\afn\bvim;\0\0\3\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\2\1\0D\0\2\0\29codeium#CycleCompletions\afn\bvim;\0\0\3\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\2��D\0\2\0\29codeium#CycleCompletions\afn\bvim�\2\1\0\6\0\16\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0003\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0003\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0003\4\14\0005\5\15\0B\0\5\1K\0\1\0\1\0\2\texpr\2\tdesc\22Codeium: Previous\0\n<C-L>\1\0\2\texpr\2\tdesc\18Codeium: Next\0\n<C-K>\1\0\2\texpr\2\tdesc\19Codeium: Clear\0\n<C-H>\1\0\2\texpr\2\tdesc\20Codeium: Accept\0\n<C-J>\6i\bset\vkeymap\bvim\0", "config", "codeium.vim")
time([[Config for codeium.vim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n�\3\0\0\a\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\r\0005\4\v\0005\5\t\0005\6\b\0=\6\n\5=\5\f\4=\4\14\3=\3\15\2B\0\2\1K\0\1\0\rrenderer\nicons\1\0\1\nicons\0\vglyphs\1\0\1\vglyphs\0\bgit\1\0\1\bgit\0\1\0\a\14untracked\b★\vstaged\b✓\fdeleted\b⊘\runstaged\b✗\fignored\b◌\frenamed\b➜\runmerged\b⌥\24update_focused_file\1\0\2\venable\2\16update_root\2\tview\1\0\6\tview\0\24update_focused_file\0\20respect_buf_cwd\2\23sync_root_with_cwd\2\rrenderer\0\17hijack_netrw\2\1\0\2\tside\tleft\nwidth\0032\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: conform.nvim
time([[Config for conform.nvim]], true)
try_loadstring("\27LJ\2\nE\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\nbufnr\3\0\vformat\fconform\frequire�\5\1\0\6\0#\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\25\0005\4\23\0005\5\22\0=\5\24\4=\4\26\3=\3\27\2B\0\2\0016\0\28\0009\0\29\0009\0\30\0'\2\31\0'\3 \0003\4!\0005\5\"\0B\0\5\1K\0\1\0\1\0\1\tdesc\18Format buffer\0\14<leader>f\6n\bset\vkeymap\bvim\15formatters\17clang-format\1\0\1\17clang-format\0\17prepend_args\1\0\1\17prepend_args\0\1\3\0\0\16-style=file\25-fallback-style=LLVM\21formatters_by_ft\velixir\1\2\0\0\bmix\15typescript\1\2\0\0\rprettier\15javascript\1\2\0\0\rprettier\ago\1\2\0\0\ngofmt\blua\1\2\0\0\vstylua\bcpp\1\2\0\0\17clang-format\6c\1\0\a\blua\0\bcpp\0\6c\0\15javascript\0\velixir\0\15typescript\0\ago\0\1\2\0\0\17clang-format\19format_on_save\1\0\3\15formatters\0\19format_on_save\0\21formatters_by_ft\0\1\0\2\15timeout_ms\3�'\15lsp_format\rfallback\nsetup\fconform\frequire\0", "config", "conform.nvim")
time([[Config for conform.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\3\14highlight\0\vindent\0\21ensure_installed\0\1\v\0\0\blua\bvim\15javascript\15typescript\tjson\thtml\bcss\vpython\tbash\rmarkdown\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\5\0\19\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\n\0005\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\0025\3\17\0005\4\16\0=\4\14\3=\3\18\2B\0\2\1K\0\1\0\23file_history_panel\1\0\1\15win_config\0\1\0\2\rposition\vbottom\vheight\3\16\15file_panel\15win_config\1\0\2\rposition\tleft\nwidth\0032\17tree_options\1\0\2\17flatten_dirs\2\20folder_statuses\16only_folded\1\0\3\15win_config\0\17tree_options\0\18listing_style\ttree\tview\1\0\3\23file_history_panel\0\tview\0\15file_panel\0\15merge_tool\1\0\2\24disable_diagnostics\2\vlayout\21diff3_horizontal\fdefault\1\0\2\15merge_tool\0\fdefault\0\1\0\2\16winbar_info\2\vlayout\21diff2_horizontal\nsetup\rdiffview\frequire\0", "config", "diffview.nvim")
time([[Config for diffview.nvim]], false)
-- Config for: nvim-ufo
time([[Config for nvim-ufo]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bufo\frequire\0", "config", "nvim-ufo")
time([[Config for nvim-ufo]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n�\1\0\0\n\0\b\0\0226\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0006\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\2\0X\4\1�K\0\1\0009\4\4\3\18\6\4\0009\4\5\4'\a\6\0009\b\a\1B\b\1\0A\4\2\1K\0\1\0\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\frequire\npcallt\1\0\5\0\a\0\0156\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�2\0\a�9\2\3\1B\2\1\0016\2\4\0009\2\5\0023\4\6\0B\2\2\1K\0\1\0K\0\1\0\0\rschedule\bvim\nsetup\19nvim-autopairs\frequire\npcall\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: oil.nvim
time([[Config for oil.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\17view_options\1\0\1\16show_hidden\2\fcolumns\1\2\0\0\ticon\1\0\3\17view_options\0\26default_file_explorer\2\fcolumns\0\nsetup\boil\frequire\0", "config", "oil.nvim")
time([[Config for oil.nvim]], false)
-- Config for: persistence.nvim
time([[Config for persistence.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16persistence\frequire\0", "config", "persistence.nvim")
time([[Config for persistence.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: noice.nvim
time([[Config for noice.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\fpresets\1\0\5\19lsp_doc_border\1\15inc_rename\1\26long_message_to_split\2\20command_palette\2\18bottom_search\2\blsp\1\0\2\fpresets\0\blsp\0\roverride\1\0\1\roverride\0\1\0\3 cmp.entry.get_documentation\2\"vim.lsp.util.stylize_markdown\0021vim.lsp.util.convert_input_to_markdown_lines\2\nsetup\nnoice\frequire\0", "config", "noice.nvim")
time([[Config for noice.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n�\n\0\0\t\0\26\00106\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\3\0019\2\a\0024\3\6\0009\4\b\1'\6\t\0'\a\n\0'\b\v\0B\4\4\2>\4\1\0039\4\b\1'\6\f\0'\a\r\0'\b\14\0B\4\4\2>\4\2\0039\4\b\1'\6\15\0'\a\16\0'\b\17\0B\4\4\2>\4\3\0039\4\b\1'\6\18\0'\a\19\0'\b\20\0B\4\4\2>\4\4\0039\4\b\1'\6\21\0'\a\22\0'\b\23\0B\4\4\0?\4\0\0=\3\5\0029\2\24\0009\4\25\1B\2\2\1K\0\1\0\vconfig\nsetup\f:qa<CR>\r❌ Quit\6q\29:Telescope live_grep<CR>\19🔎 Find text\6g\28:Telescope oldfiles<CR>\22📂 Recent files\6r\30:Telescope find_files<CR>\19🔍 Find file\6f\31:ene <BAR> startinsert<CR>\18📁 New file\6e\vbutton\fbuttons\1\a\0\0�\1███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗�\1████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║�\1██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║�\1██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║�\1██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║�\1╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝\bval\vheader\fsection\27alpha.themes.dashboard\nalpha\frequire\v����\4\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: mason-nvim-dap.nvim
time([[Config for mason-nvim-dap.nvim]], true)
try_loadstring("\27LJ\2\n+\0\1\4\1\1\0\5-\1\0\0009\1\0\1\18\3\0\0B\1\2\1K\0\1\0\3�\18default_setupG\0\0\5\0\6\0\t6\0\0\0009\0\1\0006\2\0\0009\2\2\0029\2\3\2'\4\4\0B\2\2\2'\3\5\0D\0\3\0\6 \vargs> \ninput\afn\nsplit\bvimG\0\0\5\0\6\0\t6\0\0\0009\0\1\0006\2\0\0009\2\2\0029\2\3\2'\4\4\0B\2\2\2'\3\5\0D\0\3\0\6 \vargs> \ninput\afn\nsplit\bvim�\2\1\1\a\1\t\0\0216\1\0\0009\1\1\0019\3\2\0)\4\1\0005\5\4\0003\6\3\0=\6\5\5B\1\4\0016\1\0\0009\1\1\0019\3\2\0)\4\1\0005\5\a\0003\6\6\0=\6\5\5B\1\4\1-\1\0\0009\1\b\1\18\3\0\0B\1\2\1K\0\1\0\3�\18default_setup\1\0\6\fprogram\f${file}\frequest\vlaunch\15outputMode\vremote\targs\0\ttype\ndelve\tname\14file args\0\targs\1\0\6\fprogram\f${file}\frequest\vlaunch\15outputMode\vremote\targs\0\ttype\ndelve\tname\tfile\0\19configurations\vinsert\ntable�\2\1\0\t\0\17\0.6\0\0\0009\0\1\0+\1\0\0=\1\2\0006\0\0\0009\0\1\0+\1\0\0=\1\3\0006\0\0\0009\0\1\0+\1\0\0=\1\4\0006\0\5\0006\2\6\0'\3\a\0B\0\3\3\14\0\0\0X\2\1�2\0\24�9\2\b\1\14\0\2\0X\2\1�2\0\21�6\2\5\0006\4\6\0'\5\2\0B\2\3\3\14\0\2\0X\4\1�2\0\15�9\4\b\0035\6\n\0005\a\t\0=\a\v\0065\a\14\0003\b\f\0>\b\1\a3\b\r\0=\b\15\a=\a\16\6B\4\2\0012\0\0�K\0\1\0K\0\1\0K\0\1\0K\0\1\0\rhandlers\ndelve\1\0\1\ndelve\0\0\0\21ensure_installed\1\0\3\rhandlers\0\21ensure_installed\0\27automatic_installation\2\1\2\0\0\ndelve\nsetup\nmason\frequire\npcall\15mason-core\19mason-core.log\19mason-nvim-dap\vloaded\fpackage)\1\0\3\0\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\0\rschedule\bvim\0", "config", "mason-nvim-dap.nvim")
time([[Config for mason-nvim-dap.nvim]], false)
-- Config for: better-escape.nvim
time([[Config for better-escape.nvim]], true)
try_loadstring("\27LJ\2\n_\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\ftimeout\3�\1\21default_mappings\2\nsetup\18better_escape\frequire\0", "config", "better-escape.nvim")
time([[Config for better-escape.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\6\0\15\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3=\3\t\0025\3\v\0005\4\n\0=\4\f\3=\3\r\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\14\0'\2\f\0B\0\2\1K\0\1\0\19load_extension\15extensions\17file_browser\1\0\1\17file_browser\0\1\0\2\17hijack_netrw\2\ntheme\bivy\rdefaults\1\0\2\15extensions\0\rdefaults\0\rmappings\1\0\1\rmappings\0\6i\1\0\1\6i\0\1\0\2\n<C-d>\1\n<C-u>\1\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n`\0\1\4\0\4\0\a5\1\2\0004\2\3\0005\3\0\0=\0\1\3>\3\1\2=\2\3\1L\1\2\0\relements\1\0\4\relements\0\rposition\nright\tsize\3(\nenter\2\aid\1\0\1\aid\0�\1\0\1\b\2\r\0\29-\1\0\0009\1\0\1B\1\1\1-\1\1\0008\1\0\1\v\1\0\0X\2\a�6\2\1\0006\4\2\0009\4\3\4'\6\4\0\18\a\0\0B\4\3\0A\2\0\0016\2\5\0009\2\6\0029\2\a\2B\2\1\2:\2\1\2\n\2\0\0X\3\2�9\3\t\2=\3\b\0016\3\n\0-\5\0\0009\5\v\0059\6\f\1B\3\3\1K\0\1\0\3�\5�\nindex\vtoggle\npcall\nwidth\tsize\18nvim_list_uis\bapi\bvim\17bad name: %s\vformat\vstring\nerror\nclose\30\0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a�\trepl \0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a�\vstacks!\0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a�\fwatches%\0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a�\16breakpoints \0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a�\vscopes!\0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\a�\fconsole'\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\twrap\awo\bvim\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\3�\nclose\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\3�\ncloseF\0\2\5\1\4\0\b9\2\0\1\a\2\1\0X\2\4�-\2\0\0009\2\2\0029\4\3\1B\2\2\1K\0\1\0\3�\voutput\teval\fconsole\rcategory�\f\1\0\16\1K\0�\0016\0\0\0009\0\1\0+\1\0\0=\1\2\0006\0\3\0006\2\4\0'\3\5\0B\0\3\3\14\0\0\0X\2\t�6\2\6\0009\2\a\2'\4\b\0006\5\6\0009\5\t\0059\5\n\0059\5\v\5B\2\3\0012\0��6\2\3\0006\4\4\0'\5\2\0B\2\3\3\14\0\2\0X\4\1�2\0��3\4\f\0005\5\16\0005\6\14\0\18\a\4\0'\t\r\0B\a\2\2=\a\15\6=\6\r\0055\6\18\0\18\a\4\0'\t\17\0B\a\2\2=\a\15\6=\6\17\0055\6\20\0\18\a\4\0'\t\19\0B\a\2\2=\a\15\6=\6\19\0055\6\22\0\18\a\4\0'\t\21\0B\a\2\2=\a\15\6=\6\21\0055\6\24\0\18\a\4\0'\t\23\0B\a\2\2=\a\15\6=\6\23\0055\6\26\0\18\a\4\0'\t\25\0B\a\2\2=\a\15\6=\6\25\0054\6\0\0006\a\27\0\18\t\5\0B\a\2\4H\n\b�6\f\28\0009\f\29\f\18\14\6\0009\15\15\vB\f\3\0018\f\n\5\21\r\6\0=\r\30\fF\n\3\3R\n�\1273\a\31\0006\b\6\0009\b \b9\b!\b'\n\"\0'\v#\0003\f$\0005\r%\0B\b\5\0016\b\6\0009\b \b9\b!\b'\n\"\0'\v&\0003\f'\0005\r(\0B\b\5\0016\b\6\0009\b \b9\b!\b'\n\"\0'\v)\0003\f*\0005\r+\0B\b\5\0016\b\6\0009\b \b9\b!\b'\n\"\0'\v,\0003\f-\0005\r.\0B\b\5\0016\b\6\0009\b \b9\b!\b'\n\"\0'\v/\0003\f0\0005\r1\0B\b\5\0016\b\6\0009\b \b9\b!\b'\n\"\0'\v2\0003\f3\0005\r4\0B\b\5\0016\b\6\0009\b5\b9\b6\b'\n7\0005\v8\0003\f9\0=\f:\vB\b\3\0016\b\6\0009\b5\b9\b6\b'\n;\0-\v\0\0'\r<\0B\v\2\0A\b\1\0016\b\6\0009\b5\b9\b6\b'\n;\0-\v\0\0'\r=\0B\v\2\0A\b\1\0019\b>\0035\n?\0=\6@\nB\b\2\0019\bA\0019\bB\b9\bC\b3\tE\0=\tD\b9\bA\0019\bB\b9\bF\b3\tG\0=\tD\b9\bA\0019\bH\b9\bI\b3\tJ\0=\tD\b2\0\0�K\0\1\0K\0\1\0K\0\1\0\0\0\0\17event_output\nafter\0\17event_exited\0\17dapui_config\21event_terminated\vbefore\14listeners\flayouts\1\0\2\nenter\2\flayouts\0\nsetup\16DAP Watches\rdap-repl\16BufWinEnter\rcallback\0\1\0\3\ngroup\rDapGroup\rcallback\0\fpattern\15*dap-repl*\rBufEnter\24nvim_create_autocmd\bapi\1\0\1\tdesc\29Debug: toggle console ui\0\15<leader>dc\1\0\1\tdesc\28Debug: toggle scopes ui\0\15<leader>dS\1\0\1\tdesc!Debug: toggle breakpoints ui\0\15<leader>db\1\0\1\tdesc\29Debug: toggle watches ui\0\15<leader>dw\1\0\1\tdesc\28Debug: toggle stacks ui\0\15<leader>ds\1\0\1\tdesc\26Debug: toggle repl ui\0\15<leader>dr\6n\bset\vkeymap\0\nindex\vinsert\ntable\npairs\1\0\2\nindex\3\0\vlayout\0\16breakpoints\1\0\2\nindex\3\0\vlayout\0\fwatches\1\0\2\nindex\3\0\vlayout\0\fconsole\1\0\2\nindex\3\0\vlayout\0\vscopes\1\0\2\nindex\3\0\vlayout\0\vstacks\1\0\6\16breakpoints\0\fwatches\0\fconsole\0\vscopes\0\vstacks\0\trepl\0\vlayout\1\0\2\nindex\3\0\vlayout\0\trepl\0\tWARN\vlevels\blog&nvim-dap not available for dap-ui\vnotify\bvim\bdap\frequire\npcall\ndapui\vloaded\fpackage+\1\0\3\1\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\2�\0\rschedule\bvim\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\1\foptions\0\1\0\3\20separator_style\tthin\tmode\fbuffers\27always_show_bufferline\2\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\nsetup\fharpoon\frequire\0", "config", "harpoon")
time([[Config for harpoon]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: cloak.nvim
time([[Config for cloak.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\3\0005\4\5\0005\5\4\0=\5\6\4>\4\1\3=\3\a\2B\0\2\1K\0\1\0\rpatterns\17file_pattern\1\0\2\18cloak_pattern\b=.+\17file_pattern\0\1\4\0\0\n.env*\18wrangler.toml\14.dev.vars\1\0\4\20cloak_character\6*\fenabled\2\rpatterns\0\20highlight_group\fComment\nsetup\ncloak\frequire\0", "config", "cloak.nvim")
time([[Config for cloak.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n`\0\0\5\1\5\0\t-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\2'\4\4\0B\2\2\0A\0\0\1K\0\1\0\0�\27Breakpoint condition: \ninput\afn\bvim\19set_breakpoint�\4\1\0\a\0\26\00086\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0009\5\t\0005\6\n\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\v\0009\5\f\0005\6\r\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\14\0009\5\15\0005\6\16\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\17\0009\5\18\0005\6\19\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\20\0009\5\21\0005\6\22\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\23\0003\5\24\0005\6\25\0B\1\5\0012\0\0�K\0\1\0\1\0\1\tdesc&Debug: Set Conditional Breakpoint\0\14<leader>B\1\0\1\tdesc\29Debug: Toggle Breakpoint\22toggle_breakpoint\14<leader>b\1\0\1\tdesc\20Debug: Step Out\rstep_out\t<F9>\1\0\1\tdesc\21Debug: Step Into\14step_into\n<F11>\1\0\1\tdesc\21Debug: Step Over\14step_over\n<F10>\1\0\1\tdesc\20Debug: Continue\rcontinue\t<F8>\6n\bset\vkeymap\bvim\nDEBUG\18set_log_level\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n|\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\nscope\1\0\1\fenabled\2\vindent\1\0\2\nscope\0\vindent\0\1\0\1\tchar\b│\nsetup\bibl\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n%\0\0\3\0\3\0\0046\0\0\0009\0\1\0'\2\2\0D\0\2\0\n%H:%M\tdate\aos+\0\1\5\0\2\0\a'\1\0\0\18\4\0\0009\2\1\0B\2\2\2'\3\0\0&\1\3\1L\1\2\0\nupper\6 \29\0\1\4\0\1\0\5'\1\0\0\18\2\0\0'\3\0\0&\1\3\1L\1\2\0\6 +\0\1\5\0\2\0\a'\1\0\0\18\4\0\0009\2\1\0B\2\2\2'\3\0\0&\1\3\1L\1\2\0\nupper\6 +\0\1\5\0\2\0\a'\1\0\0\18\4\0\0009\2\1\0B\2\2\2'\3\0\0&\1\3\1L\1\2\0\nupper\6 \29\0\1\4\0\1\0\5'\1\0\0\18\2\0\0'\3\0\0&\1\3\1L\1\2\0\6 \29\0\1\4\0\1\0\5'\1\0\0\18\2\0\0'\3\0\0&\1\3\1L\1\2\0\6 \29\0\1\4\0\1\0\5'\1\0\0\18\2\0\0'\3\0\0&\1\3\1L\1\2\0\6 �\r\1\0\n\0@\0v6\0\0\0009\0\1\0)\1\3\0=\1\2\0003\0\3\0006\1\4\0006\3\5\0'\4\6\0B\1\3\3\14\0\1\0X\3\2�2\0\0�K\0\1\0009\3\a\0025\5\17\0005\6\b\0005\a\t\0=\a\n\0065\a\v\0=\a\f\0065\a\r\0004\b\0\0=\b\14\a4\b\0\0=\b\15\a=\a\16\6=\6\18\0055\6\24\0004\a\3\0005\b\19\0003\t\20\0=\t\21\b5\t\22\0=\t\23\b>\b\1\a=\a\25\0064\a\4\0005\b\26\0003\t\27\0=\t\21\b5\t\28\0=\t\23\b>\b\1\a5\b\29\0005\t\30\0=\t\31\b5\t \0=\t\23\b>\b\2\a5\b!\0005\t\"\0=\t\31\b5\t#\0=\t\23\b>\b\3\a=\a$\0064\a\3\0005\b%\0005\t&\0=\t\31\b5\t'\0=\t\23\b>\b\1\a=\a(\0064\a\4\0005\b)\0003\t*\0=\t\21\b5\t+\0=\t\23\b>\b\1\a5\b,\0003\t-\0=\t\21\b5\t.\0=\t\23\b>\b\2\a5\b/\0>\0\1\b3\t0\0=\t\21\b5\t1\0=\t\23\b>\b\3\a=\a2\0064\a\3\0005\b3\0003\t4\0=\t\21\b5\t5\0=\t\23\b>\b\1\a=\a6\0064\a\3\0005\b7\0003\t8\0=\t\21\b5\t9\0=\t\23\b>\b\1\a=\a:\6=\6;\0055\6<\0004\a\0\0=\a\25\0064\a\0\0=\a$\0065\a=\0=\a(\0065\a>\0=\a2\0064\a\0\0=\a6\0064\a\0\0=\a:\6=\6?\5B\3\2\1K\0\1\0\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\6\14lualine_x\0\14lualine_c\0\14lualine_a\0\14lualine_b\0\14lualine_z\0\14lualine_y\0\rsections\14lualine_z\1\0\2\nright\5\tleft\6 \0\1\2\2\0\rlocation\14separator\0\bfmt\0\14lualine_y\1\0\2\nright\6 \tleft\6 \0\1\2\2\0\rprogress\14separator\0\bfmt\0\14lualine_x\1\0\2\nright\5\tleft\6 \0\1\0\3\14separator\0\ticon\t󰥔\bfmt\0\1\0\2\nright\6 \tleft\6 \0\1\2\2\0\rencoding\14separator\0\bfmt\0\1\0\2\nright\6 \tleft\a  \0\1\2\3\0\rfiletype\bfmt\0\14separator\0\14icon_only\1\14lualine_c\1\0\2\nright\6 \tleft\b\1\0\4\funnamed\15 [No Name]\rmodified\t ●\fnewfile\v [New]\rreadonly\n 󰈡\1\2\4\0\rfilename\fsymbols\0\tpath\3\1\16file_status\2\14separator\0\14lualine_b\1\0\1\nright\b\1\0\4\twarn\t⚠ \nerror\t✗ \tinfo\tℹ \thint\n💡 \1\2\2\0\16diagnostics\fsymbols\0\14separator\0\1\0\1\nright\b\fsymbols\1\0\3\fremoved\n󰍴 \rmodified\n󰏫 \nadded\n󰐕 \1\2\2\0\tdiff\fsymbols\0\14separator\0\1\0\1\nright\b\0\1\2\3\0\vbranch\14separator\0\ticon\t󰘬\bfmt\0\14lualine_a\1\0\6\14lualine_x\0\14lualine_c\0\14lualine_a\0\14lualine_b\0\14lualine_z\0\14lualine_y\0\14separator\1\0\1\nright\b\bfmt\0\1\2\2\0\tmode\14separator\0\bfmt\0\foptions\1\0\3\rsections\0\foptions\0\22inactive_sections\0\23disabled_filetypes\vwinbar\15statusline\1\0\2\vwinbar\0\15statusline\0\23section_separators\1\0\2\nright\5\tleft\5\25component_separators\1\0\2\nright\5\tleft\5\1\0\6\25component_separators\0\ntheme\tauto\23disabled_filetypes\0\17globalstatus\1\25always_divide_middle\2\23section_separators\0\nsetup\flualine\frequire\npcall\0\15laststatus\bopt\bvim)\1\0\3\0\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\0\rschedule\bvim\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\3�\tbody\15lsp_expand�\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\v�-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4�-\1\1\0009\1\3\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\1�\3�\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisible�\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\r�-\1\1\0009\1\2\1)\3��B\1\2\2\15\0\1\0X\2\5�-\1\1\0009\1\3\1)\3��B\1\2\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\1�\3�\tjump\rjumpable\21select_prev_item\fvisible�\1\0\0\6\1\b\0\17-\0\0\0009\0\0\0009\0\1\0005\2\2\0005\3\5\0-\4\0\0009\4\3\0049\4\4\0049\4\1\4B\4\1\2=\4\3\0034\4\3\0005\5\6\0>\5\1\4=\4\a\3B\0\3\1K\0\1\0\1�\fsources\1\0\1\tname\vbuffer\1\0\2\fsources\0\fmapping\0\vpreset\fmapping\1\3\0\0\6/\6?\fcmdline\nsetup�\1\0\0\t\1\n\0\24-\0\0\0009\0\0\0009\0\1\0'\2\2\0005\3\5\0-\4\0\0009\4\3\0049\4\4\0049\4\1\4B\4\1\2=\4\3\3-\4\0\0009\4\6\0049\4\a\0044\6\3\0005\a\b\0>\a\1\0064\a\3\0005\b\t\0>\b\1\aB\4\3\2=\4\a\3B\0\3\1K\0\1\0\1�\1\0\1\tname\fcmdline\1\0\1\tname\tpath\fsources\vconfig\1\0\2\fsources\0\fmapping\0\vpreset\fmapping\6:\fcmdline\nsetup�\5\1\0\14\0'\0W6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�2\0N�6\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\2\0X\4\1�2\0H�6\4\0\0003\6\4\0B\4\2\0019\4\5\0015\6\t\0005\a\a\0003\b\6\0=\b\b\a=\a\n\0069\a\v\0019\a\f\a9\a\r\a5\t\15\0009\n\v\0019\n\14\n)\f��B\n\2\2=\n\16\t9\n\v\0019\n\14\n)\f\4\0B\n\2\2=\n\17\t9\n\v\0019\n\18\nB\n\1\2=\n\19\t9\n\v\0019\n\20\nB\n\1\2=\n\21\t9\n\v\0019\n\22\n5\f\23\0B\n\2\2=\n\24\t9\n\v\0013\f\25\0005\r\26\0B\n\3\2=\n\27\t9\n\v\0013\f\28\0005\r\29\0B\n\3\2=\n\30\tB\a\2\2=\a\v\0069\a\31\0019\a \a4\t\3\0005\n!\0>\n\1\t5\n\"\0>\n\2\t4\n\3\0005\v#\0>\v\1\n5\v$\0>\v\2\nB\a\3\2=\a \6B\4\2\0016\4\0\0003\6%\0B\4\2\0016\4\0\0003\6&\0B\4\2\0012\0\0�K\0\1\0K\0\1\0K\0\1\0\0\0\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\a\f<S-Tab>\0\n<C-b>\0\n<Tab>\0\t<CR>\0\n<C-e>\0\14<C-Space>\0\n<C-f>\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\3\fsnippet\0\fsources\0\fmapping\0\vexpand\1\0\1\vexpand\0\0\nsetup\0\fluasnip\bcmp\frequire\npcall\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nn\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\14direction\15horizontal\17open_mapping\n<C-\\>\tsize\3\20\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)

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

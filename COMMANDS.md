# Neovim Commands Reference

**Leader Key:** `<space>` (spacebar)

---

## 📁 File Explorer

- `<leader>e` - Toggle NvimTree file explorer
- `<leader>E` - Focus NvimTree
- `-` - Open Oil.nvim file explorer

## 📝 File Operations

- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>Q` - Quit without saving
- `<leader>nf` - Create new file
- `<leader>nd` - Create new folder

## 🔍 Telescope (Fuzzy Finder)

- `<leader>ff` - Find files (fuzzy search)
- `<leader>fg` - Live grep (search in files)
- `<leader>fb` - List buffers
- `<leader>fh` - Help tags
- `<leader>fr` - Recent files
- `<leader>fe` - File browser (navigate directories)

## 🧭 Navigation

- `j` / `k` - Move with centered view
- `<C-d>` / `<C-u>` - Half page scroll (centered)
- `<C-h>` - Move to left window
- `<C-j>` - Move to window below
- `<C-k>` - Move to window above
- `<C-l>` - Move to right window
- `<C-o>` - Go back in jump list (after gd)
- `<C-i>` / `<Tab>` - Go forward in jump list

## 📦 Buffer Management

- `<Tab>` - Next buffer
- `<S-Tab>` - Previous buffer
- `<leader>bn` - Next buffer
- `<leader>bp` - Previous buffer
- `<leader>bc` - Close current buffer
- `<leader>bd` - Pick and close buffer
- `<leader>bb` - List all buffers (Telescope)
- `<leader>ba` - Close all buffers (except current)

## 🔧 LSP (Language Server Protocol)

_Only active when LSP client is attached_

- `gd` - Go to definition
- `gr` - Go to references
- `gi` - Go to implementation
- `K` - Hover (show documentation)
- `<C-k>` - Signature help (function parameters)
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code actions
- `[d` - Previous diagnostic
- `]d` - Next diagnostic
- `<leader>d` - Show diagnostic in float
- `<leader>ls` - Show LSP client status

## 🐛 Diagnostics & Troubleshooting

- `<leader>xx` - Toggle Trouble diagnostics
- `<leader>xw` - Workspace diagnostics
- `<leader>xd` - Document diagnostics

## 🪟 Window Management

- `<A-h>` - Resize window left (-2)
- `<A-j>` - Resize window down (-2)
- `<A-k>` - Resize window up (+2)
- `<A-l>` - Resize window right (+2)

## ✏️ Editing

- `v` + `J` - Move line down (visual mode)
- `v` + `K` - Move line up (visual mode)
- `v` + `<` - Decrease indent (visual mode)
- `v` + `>` - Increase indent (visual mode)
- `p` / `P` - Paste (with modifiable check)
- `v` + `p` - Replace selection with paste

## 🔄 Git

- `<leader>gd` - Open diff view (all changes)
- `<leader>gD` - Close diff view
- `<leader>gh` - View file history
- `<leader>gs` - Git status (Fugitive)
- `<leader>gb` - Git blame
- `<leader>gl` - Git log
- `gu` - Get left diff (in diffview)
- `gh` - Get right diff (in diffview)
- `<leader>p` - Git push (in git status)
- `<leader>P` - Git pull (in git status)
- `<leader>t` - Git push with branch (in git status)

## 🎯 Harpoon (Quick File Switching)

- `<leader>ha` - Add file to harpoon
- `<leader>hh` - Toggle harpoon menu
- `<leader>h1` - Go to file 1
- `<leader>h2` - Go to file 2
- `<leader>h3` - Go to file 3
- `<leader>h4` - Go to file 4

## 🔍 Search & Replace

- `<leader>sr` - Open Spectre (search & replace)
- `<leader>sw` - Search current word in Spectre
- `<leader>H` - Clear search highlights
- `<Esc>` - Clear search highlights (in normal mode)

## 💾 Sessions

- `<leader>qs` - Load session
- `<leader>ql` - Load last session
- `<leader>qd` - Stop session

## 🐛 Debugging (DAP)

- `<F8>` - Continue/Pause
- `<F10>` - Step Over
- `<F11>` - Step Into
- `<F9>` - Step Out
- `<leader>b` - Toggle breakpoint
- `<leader>B` - Conditional breakpoint
- `<leader>dr` - Toggle REPL UI
- `<leader>ds` - Toggle stacks UI
- `<leader>dw` - Toggle watches UI
- `<leader>db` - Toggle breakpoints UI
- `<leader>dS` - Toggle scopes UI
- `<leader>dc` - Toggle console UI
- `<leader>f` - Format code (in debug mode)

## 🤖 AI Code Completion (Codeium)

_In Insert Mode_

- `<C-J>` - Accept suggestion
- `<C-H>` - Clear suggestion
- `<C-K>` - Next suggestion
- `<C-L>` - Previous suggestion

## 🖥️ Terminal

- `<leader>t` - Toggle terminal
- `<Esc>` - Exit terminal mode (in terminal)

## 📚 Other

- `<leader>u` - Toggle undo tree
- `<leader>f` - Format code (when formatter available)

---

## Tips

1. **Jump List Navigation:**

   - After `gd` (go to definition), use `Ctrl+O` to go back
   - Use `Ctrl+I` or `Tab` to go forward

2. **Buffer Navigation:**

   - Use `<Tab>` for quick buffer switching
   - Use `<leader>bb` to see all buffers in Telescope

3. **File Finding:**

   - `<leader>ff` - Quick file search
   - `<leader>fe` - Browse directories like a file manager

4. **LSP:**

   - Make sure LSP client is attached (check with `<leader>ls`)
   - `gd` only works if the LSP server supports it

5. **Git:**
   - Use `<leader>gs` to open git status
   - Use `<leader>gd` to see all changes in diffview

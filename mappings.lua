---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<M-h>"] = { "<C-w>h", "Window left" },
    ["<M-l>"] = { "<C-w>l", "Window right" },
    ["<M-j>"] = { "<C-w>j", "Window down" },
    ["<M-k>"] = { "<C-w>k", "Window up" },
    ["<F4>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<F9>"] = {
      function()
        if vim.bo.filetype == "tex" then
          vim.cmd [[ execute ':wa' ]]
          vim.fn.Tex_RunLaTeX()
        elseif vim.bo.filetype == "rust" then
          vim.cmd [[
          execute ':wa'
          let &makeprg= "cargo build"
          make
          copen 15
          ]]
        else
          vim.cmd [[
            execute ':wa'
            if filereadable("CMakeLists.txt")
                let build_dir = get(g:, "cmake_build_dir", "build")
                let &makeprg = "cmake --build " . build_dir . " -j16"
                make
            elseif filereadable("build.sh")
                let &makeprg = "./build.sh"
                make
            else
                let &makeprg= "make"
                make -j8
            endif
            copen 15
            execute ':cc'
          ]]
        end
      end,
    },
    ["<C-F9>"] = {
      function()
        vim.cmd [[
          execute ':wa'
          if filereadable("CMakeLists.txt")
              let build_dir = get(g:, "cmake_build_dir", "build")
              let &makeprg = "cmake --build " . build_dir . " --target clean"
              make
          elseif filereadable("build.sh")
          else
              let &makeprg= "make"
              make -j8 clean
          endif
        ]]
      end,
    },
    ["<C-9>"] = { "<cmd>cc<CR>", desc = "current error" },
    ["<C-0>"] = { "<cmd>cn<CR>", desc = "next error" },
    ["<C-8>"] = { "<cmd>cp<CR>", desc = "prev error" },
    ["<leader>9"] = { "<cmd>cc<CR>", desc = "current error" },
    ["<leader>0"] = { "<cmd>cn<CR>", desc = "next error" },
    ["<leader>8"] = { "<cmd>cp<CR>", desc = "prev error" },
    -- ["<leader>ft"] = {
    --   -- function()
    --   --   require("telescope").extensions.ctags_outline.outline({buf='all'})
    --   -- end,
    --   -- function()
    --   --   require("telescope").extensions.ctags_plus.jump_to_tag()
    --   -- end,
    --   function() require("telescope").extensions.ctags.tags({ctags_file="tags"}) end,
    --   desc = "Find Ctags"
    -- },
    ["ga"] = {
      "<Plug>(EasyAlign)",
      desc = "EasyAlign",
    },
    ["<F10>"] = { "<cmd>ToggleWhitespace<cr>", desc = "Toggle whitespace highlighting" },
    ["<C-F10>"] = { "<cmd>StripWhitespace<cr>", desc = "Clean extra whitespace" },
    ["<leader>uP"] = { "<cmd>TSPlaygroundToggle<cr>", desc = "Treesitter Playground" },
    ["<leader>uu"] = { vim.cmd.UndotreeToggle, desc = "Undo Tree" },
    ["j"] = { "j" },
    ["k"] = { "k" },
    ["\\"] = { "<cmd>split<cr>", "Horizontal Split" },
    ["|"] = { "<cmd>vs<cr>", "Vertical Split" },
    ["]b"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },
    ["[b"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
    ["]t"] = { "<cmd>tabnext<cr>", "Goto next tab" },
    ["[t"] = { "<cmd>tabprevious<cr>", "Goto prev tab" },
    ["<>"] = { "<cmd> noh <CR>", "Clear highlights" },
    ["<leader>q"] = { "<cmd>confirm q<cr>", "Quit" },
    ["<leader>n"] = { "<cmd>enew<cr>", "New buffer" },
    ["<leader>w"] = { "<cmd>w<cr>", "Save file" },
    ["<leader>b"] = { "<cmd>tabnew<cr>", "New tab" },
    ["<leader>tt"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "New terminal",
    },
  },
  t = {
    ["<M-h>"] = { "<C-w>h", "Window left" },
    ["<M-l>"] = { "<C-w>l", "Window right" },
    ["<M-j>"] = { "<C-w>j", "Window down" },
    ["<M-k>"] = { "<C-w>k", "Window up" },
  },
  i = {
    ["fj"] = { "<Esc>" },
    ["fJ"] = { "<Esc>" },
  },
  v = {
    ["<C-k>"] = { "<cmd>ClangFormat<CR>" },
    ["j"] = { "j" },
    ["k"] = { "k" },
  },
  x = {
    ["ga"] = {
      "<Plug>(EasyAlign)",
      desc = "EasyAlign",
    },
  },
}

-- more keybinds!
M.disabled = {
  n = {
    ["<C-h>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-l>"] = "",
    ["<C-s>"] = "",
    ["<C-n>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["<leader>n"] = "",
    ["<leader>rn"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",
  },
  t = {
    ["<C-h>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-l>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
  },
  i = {
    ["<C-b>"] = "",
    ["<C-e>"] = "",
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },
}

M.lspconfig = {
  n = {
    ["<leader>d"] = {
      function()
        local d = vim.diagnostic
        if d.is_disabled() then
          d.enable()
        else
          d.disable()
        end
      end,
      "Toggle diagnostics",
    },
  },
}

M.telescope = {
  n = {
    ["<leader>ft"] = {
      function()
        require("telescope").extensions.ctags.tags { ctags_file = "tags" }
      end,
      "Find Ctags",
    },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    -- new
    ["<leader>h"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New horizontal term",
    },

    ["<leader>v"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "New vertical term",
    },
  },
}

return M

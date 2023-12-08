local M = {}

M.treesitter = {
  ensure_installed = {
    "bash",
    "bibtex",
    "c",
    "cmake",
    "comment",
    "cpp",
    "cuda",
    "diff",
    "gitignore",
    "glsl",
    "hlsl",
    "java",
    "json",
    "lua",
    "make",
    "markdown",
    "matlab",
    "meson",
    "ninja",
    "perl",
    "python",
    "rust",
    "vim",
    "yaml",
    "query",
    "latex",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  ignore_install = { "fortran" },
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

M.mason = {
  PATH="append",
  ensure_installed = {
    "lua-language-server",
    "bash-language-server",
    "clangd",
    "cmake-language-server",
    "fortls",
    "pyright",
    "rust-analyzer",
    "black",
    "isort",
    "stylua",
    "clang-format"
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.blankline = {
  indentLine_enabled = 1,
  filetype_exclude = {
    "help",
    "terminal",
    "lazy",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    "nvdash",
    "nvcheatsheet",
    "",
  },
  buftype_exclude = { "terminal" },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  show_current_context = true,
  show_current_context_start = false,
}
return M
